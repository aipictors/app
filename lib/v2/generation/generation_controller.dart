import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_settings.dart';
import 'package:flutter/foundation.dart';

/// 生成を止めた理由（画面側で案内のシートを出し分ける）
enum GenBlockKind {
  /// 画面に出すだけでよいもの
  message,

  /// コインが足りない
  coins,

  /// プランが必要
  plan,

  /// 規約に同意していない
  terms,

  /// 本人確認が必要
  verification,

  /// 今週の Gemini の枠を使い切った
  geminiLimit,
}

class GenBlock {
  const GenBlock(this.kind, this.message);

  final GenBlockKind kind;
  final String message;
}

/// 生成画面の状態（候補データ・残高・履歴・途中経過）
class GenController extends ChangeNotifier {
  GenController() {
    settings.addListener(_onSettings);
  }

  final settings = GenSettings();

  GenCatalog? catalog;
  String? catalogError;

  GenViewer? viewer;
  String? viewerError;

  CoinSummary? coins;

  /// Gemini を選んでいるときだけ読む
  GeminiAllowance? geminiAllowance;

  /// メンテナンス中などのお知らせ
  GenNotice? notice;

  /// 履歴の絞り込み（Web と同じ。minRating: 1 以上でお気に入り、isProtected: 保護中のみ）
  int historyMinRating = 0;
  bool historyProtectedOnly = false;
  String? historyDate;

  bool get hasHistoryFilter => historyMinRating > 0 || historyProtectedOnly || historyDate != null;

  Map<String, dynamic> get _historyWhere => {
    if (historyMinRating > 0) 'minRating': historyMinRating,
    if (historyProtectedOnly) 'isProtected': true,
    if (historyDate != null) 'dateText': historyDate,
  };

  void setHistoryFilter({int? minRating, bool? protectedOnly, String? date, bool clearDate = false}) {
    if (minRating != null) historyMinRating = minRating;
    if (protectedOnly != null) historyProtectedOnly = protectedOnly;
    if (date != null) historyDate = date;
    if (clearDate) historyDate = null;
    results.clear();
    refreshHistory();
  }

  /// 今日の付与があったとき一度だけ出す案内
  String? grantMessage;

  // 履歴
  final List<GenResult> running = [];
  final List<GenResult> results = [];
  bool historyLoading = false;
  bool historyLoadingMore = false;
  bool historyHasMore = true;
  String? historyError;
  int _resultsOffset = 0;
  static const _pageSize = 40;

  /// 送信中（サーバーの応答待ち）の仮カードの数
  int sendingCount = 0;
  bool submitting = false;

  /// nanoid → 途中経過
  final Map<String, GenProgress> progress = {};
  final Map<String, int> _previewIds = {};
  final Set<String> _wasActive = {};

  Timer? _progressTimer;
  Timer? _refreshTimer;
  DateTime _refreshUntil = DateTime.fromMillisecondsSinceEpoch(0);
  bool _disposed = false;
  bool _loggedIn = false;

  ImageModel? get model => catalog?.model(settings.modelId);

  bool get isPaid => viewer?.isPaid ?? false;

  int get imagesPerRequest => settings.imagesFor(model, isPaid: isPaid);

  int get requestCost => settings.requestCost(model, isPaid: isPaid);

  int get runningCount => running.length + sendingCount;

  String? _lastType;

  void _onSettings() {
    // Gemini を選んだときに枠を読む
    if (settings.isGemini && _lastType != settings.effectiveType && _loggedIn) unawaited(loadGeminiAllowance());
    _lastType = settings.effectiveType;
    _notify();
  }

  Future<void> loadGeminiAllowance() async {
    try {
      geminiAllowance = await GenApi.geminiAllowance();
      _notify();
    } catch (_) {
      // 読めなくても生成はできる（サーバーが枠を確認する）
    }
  }

  Future<void> loadNotice() async {
    try {
      notice = await GenApi.notice();
      _notify();
    } catch (_) {
      // 取れなければ前回のまま
    }
  }

  // ---------------------------------------------------------------------------
  // 読み込み
  // ---------------------------------------------------------------------------

  Future<void> start({required bool loggedIn}) async {
    _loggedIn = loggedIn;
    await settings.restore();
    await Future.wait([
      loadCatalog(),
      loadNotice(),
      if (loggedIn) loadViewer(),
      if (loggedIn) loadCoins(),
      if (loggedIn) refreshHistory(),
      if (loggedIn && settings.isGemini) loadGeminiAllowance(),
    ]);
  }

  Future<void> loadCatalog() async {
    catalogError = null;
    _notify();
    try {
      catalog = await GenCatalog.load();
      settings.validate(catalog!);
    } on ApiException catch (e) {
      catalogError = e.message;
    } catch (_) {
      catalogError = 'モデルの一覧を読み込めませんでした';
    }
    _notify();
  }

  Future<void> loadViewer() async {
    try {
      viewer = await GenViewer.load();
      viewerError = null;
    } on ApiException catch (e) {
      viewerError = e.message;
    } catch (_) {
      viewerError = '生成の状態を読み込めませんでした';
    }
    _notify();
  }

  Future<void> loadCoins() async {
    try {
      final summary = await GenApi.coinSummary();
      coins = summary;
      if (summary != null && summary.granted && summary.grantedCoins > 0) {
        grantMessage = '本日の付与コインとして${summary.grantedCoins}コインが付与されました。本日24:00まで有効です。';
      }
    } catch (_) {
      // 残高が取れなくても生成はできる（ボタンの表示だけ変わる）
    }
    _notify();
  }

  Future<void> refreshAll() async {
    await Future.wait([loadViewer(), loadCoins(), refreshHistory(), loadNotice(), if (settings.isGemini) loadGeminiAllowance()]);
  }

  Future<void> refreshHistory() async {
    historyLoading = true;
    historyError = null;
    _notify();
    try {
      final data = await Future.wait([
        Api.query(GenApi.tasksQuery, variables: {'offset': 0, 'limit': 20, 'where': <String, dynamic>{}}),
        Api.query(GenApi.resultsQuery, variables: {'offset': 0, 'limit': _pageSize, 'where': _historyWhere}),
      ]);
      final tasks = (data[0].obj('viewer')?.list('imageGenerationTasks') ?? const [])
          .map((j) => GenResult.fromJson(j, isTask: true))
          .where((t) => t.isRunning || t.isError)
          .where((t) => !(t.isError && t.completedAt > 0 && DateTime.now().millisecondsSinceEpoch ~/ 1000 - t.completedAt > 600))
          .toList();
      final page = (data[1].obj('viewer')?.list('imageGenerationResults') ?? const []).map(GenResult.fromJson).toList();
      final hadRunning = running.where((t) => t.isRunning).length;
      running
        ..clear()
        ..addAll(tasks);
      results
        ..clear()
        ..addAll(page);
      _resultsOffset = page.length;
      historyHasMore = page.length >= _pageSize;
      final nowRunning = running.where((t) => t.isRunning).length;
      if (nowRunning < hadRunning) {
        // 終わったものがあれば残高・残り枚数も取り直す
        unawaited(loadViewer());
        unawaited(loadCoins());
        if (settings.isGemini) unawaited(loadGeminiAllowance());
      }
      _syncPolling();
    } on ApiException catch (e) {
      historyError = e.message;
    } catch (_) {
      historyError = '履歴を読み込めませんでした';
    } finally {
      historyLoading = false;
      _notify();
    }
  }

  Future<void> loadMoreHistory() async {
    if (historyLoadingMore || !historyHasMore || historyLoading) return;
    historyLoadingMore = true;
    _notify();
    try {
      final data = await Api.query(GenApi.resultsQuery, variables: {'offset': _resultsOffset, 'limit': _pageSize, 'where': _historyWhere});
      final page = (data.obj('viewer')?.list('imageGenerationResults') ?? const []).map(GenResult.fromJson).toList();
      final seen = results.map((r) => r.id).toSet();
      results.addAll(page.where((r) => seen.add(r.id)));
      _resultsOffset += page.length;
      historyHasMore = page.length >= _pageSize;
    } on ApiException catch (e) {
      historyError = e.message;
    } catch (_) {
      historyError = '履歴を読み込めませんでした';
    } finally {
      historyLoadingMore = false;
      _notify();
    }
  }

  // ---------------------------------------------------------------------------
  // 途中経過（Web と同じく /api/generation/progress を 1.2 秒ごとに見る）
  // ---------------------------------------------------------------------------

  void _syncPolling() {
    final needs = running.any((t) => t.isRunning && t.nanoid != null) || sendingCount > 0;
    if (needs) {
      _progressTimer ??= Timer.periodic(const Duration(milliseconds: 1200), (_) => _pollProgress());
      _refreshUntil = DateTime.now().add(const Duration(seconds: 15));
    } else {
      _progressTimer?.cancel();
      _progressTimer = null;
    }
    // 保険として一覧も 4 秒ごとに取り直す（生成中・送信直後だけ）
    if (needs || DateTime.now().isBefore(_refreshUntil)) {
      _refreshTimer ??= Timer.periodic(const Duration(seconds: 4), (_) {
        if (!historyLoading) refreshHistory();
      });
    } else {
      _refreshTimer?.cancel();
      _refreshTimer = null;
    }
  }

  bool _polling = false;

  Future<void> _pollProgress() async {
    if (_polling || _disposed) return;
    _polling = true;
    try {
      final targets = running.where((t) => t.isRunning && t.nanoid != null).take(6).toList();
      var completed = false;
      await Future.wait(
        targets.map((t) async {
          final id = t.nanoid!;
          final p = await GenApi.progress(id, _previewIds[id] ?? -1);
          if (p == null) return;
          final previous = progress[id];
          if (p.previewId >= 0 && p.preview != null) _previewIds[id] = p.previewId;
          if (p.state == 'active') _wasActive.add(id);
          final done = p.state == 'completed' || (_wasActive.contains(id) && p.state == 'waiting');
          progress[id] = GenProgress(
            state: done ? 'completed' : p.state,
            progress: done ? 1 : p.progress,
            eta: p.eta,
            // 途中経過の画像は新しいものが来たときだけ差し替える
            preview: p.preview ?? previous?.preview,
            previewId: p.previewId,
            queuePosition: p.queuePosition,
          );
          if (done) completed = true;
        }),
      );
      if (completed) unawaited(_showCompleted());
      _notify();
    } finally {
      _polling = false;
    }
  }

  bool _showingCompleted = false;

  /// 終わったらすぐ一覧に出す（保存が終わるまで少しの間だけ細かく取り直す）
  Future<void> _showCompleted() async {
    if (_showingCompleted) return;
    _showingCompleted = true;
    try {
      for (final delay in const [0, 500, 800, 1200, 2000, 3000]) {
        await Future.delayed(Duration(milliseconds: delay));
        if (_disposed) return;
        final before = results.isEmpty ? null : results.first.id;
        await refreshHistory();
        if (results.isNotEmpty && results.first.id != before) return;
      }
    } finally {
      _showingCompleted = false;
    }
  }

  // ---------------------------------------------------------------------------
  // 生成
  // ---------------------------------------------------------------------------

  /// 送信前のチェック（Web の onCreateTask と findGenerationSubmitBlock と同じ順番）
  GenBlock? check() {
    final v = viewer;
    final c = catalog;
    final m = model;
    final s = settings;
    if (v == null || c == null) return const GenBlock(GenBlockKind.message, '読み込み中です。少し待ってからお試しください');
    if (notice?.isMaintenance == true) return GenBlock(GenBlockKind.message, notice!.message);
    if (!v.hasSignedTerms) return const GenBlock(GenBlockKind.terms, '');
    if (m == null) return const GenBlock(GenBlockKind.message, 'モデルが見つかりません。モデルを選びなおしてください');
    if (v.passType == null && v.lineUserId == null && v.generatedCount >= 10 && !v.isExistedPreviousPass) {
      return const GenBlock(GenBlockKind.verification, '');
    }
    final official = s.userCheckpoint == null;
    if (official && m.name.toLowerCase().contains('gemini') && !v.isPaid) {
      return const GenBlock(GenBlockKind.plan, 'Gemini Nano Banana はライト以上、Nano Banana 2 はスタンダード以上のプランで使えます');
    }
    if (s.i2iImage != null && !v.isPaid && s.effectiveType != 'GEMINI') {
      return const GenBlock(GenBlockKind.plan, '画像から生成はライト以上のプランで使えます');
    }
    if (s.generationCount > 1 && !v.isStandardOrPremium) {
      return const GenBlock(GenBlockKind.plan, '続けて依頼できるのはスタンダード以上のプランです');
    }
    if (v.inProgress + sendingCount > 0 && !v.isStandardOrPremium) {
      return const GenBlock(GenBlockKind.plan, '生成が終わるまでお待ちください。スタンダード以上のプランなら、生成中でも続けて依頼できます');
    }
    final type = s.generationType(isPaid: v.isPaid);
    if (type == 'IMAGE_TO_IMAGE' && v.inProgress + s.generationCount > v.consecutive) {
      return const GenBlock(GenBlockKind.message, '同時に生成できる数の上限です');
    }
    if (s.generationCount > 1 && s.hasControlNet) return const GenBlock(GenBlockKind.message, 'ControlNet を使うときは 1 回ずつ生成してください');
    if (s.isFlux && s.hasControlNet) return const GenBlock(GenBlockKind.message, 'FLUX モデルは ControlNet を使えません');
    if (s.isFlux && s.i2iImage != null) return const GenBlock(GenBlockKind.message, 'FLUX モデルの画像から生成は一時的に停止しています');
    if (!v.isPaid && GenRules.isCustomSize(s.sizeType) && GenRules.isOverFreeLimit(s.sizeType, highRes: s.highRes)) {
      return const GenBlock(GenBlockKind.plan, 'サブスクに入っていない場合、出力サイズは 2048×2048（約4メガピクセル）までです');
    }
    if (s.highRes && s.i2iImage != null) return const GenBlock(GenBlockKind.message, '高解像度と画像から生成の組み合わせは一時的に停止しています');
    if (s.hasControlNet && s.controlNetModule == null) return const GenBlock(GenBlockKind.message, 'ControlNet の種類を選ぶか、画像を消してください');
    if (official && m.isFlux && !v.isStandardOrPremium) {
      return const GenBlock(GenBlockKind.plan, 'flux.1 はスタンダード以上のプランで生成できます');
    }
    final prompt = s.prompt.trim();
    if (prompt.length > GenRules.maxPromptLength) {
      return const GenBlock(GenBlockKind.message, 'プロンプトが長すぎます（20000文字まで）');
    }
    final summary = coins;
    if (summary != null && summary.total < requestCost) {
      return GenBlock(GenBlockKind.coins, 'コインが足りません（必要 $requestCost・残り ${summary.total}）');
    }
    if (_geminiCoinUse() case final use? when !use.$2) return const GenBlock(GenBlockKind.geminiLimit, '');
    if (s.seed != -1 && s.lastRequestKey == _requestKey(m)) {
      return const GenBlock(GenBlockKind.message, '前回と同じ条件での連続生成はできません。Seed を変えてください');
    }
    return null;
  }

  /// Gemini で使うプレミアムコインと、生成できるか（枠を適用していないときは null）
  (int, bool)? _geminiCoinUse() {
    final a = geminiAllowance;
    final summary = coins;
    if (!settings.isGemini || a == null || !a.isEnforced || summary == null) return null;
    final freeUse = math.min(requestCost, math.min(summary.free, a.remaining));
    final premiumUse = requestCost - freeUse;
    return (premiumUse, premiumUse <= summary.premium);
  }

  /// この生成で使うプレミアムコインの見込み（フリーコインを先に使う）
  int get premiumCoinUse {
    final gemini = _geminiCoinUse();
    if (gemini != null) return gemini.$1;
    final summary = coins;
    if (summary == null) return 0;
    return math.min(math.max(0, requestCost - summary.free), summary.premium);
  }

  String _requestKey(ImageModel m) => [
    settings.userCheckpoint?.checkpointName ?? m.name,
    settings.vae,
    settings.composePrompt(settings.prompt),
    settings.negativePrompt,
    settings.seed,
    settings.steps,
    settings.scale,
    settings.sampler,
    settings.scheduler,
    settings.clipSkip,
    settings.sizeType,
    settings.highRes,
    settings.i2iImage?.length,
    settings.i2iStrength,
    settings.controlNetImage?.length,
    settings.controlNetModule,
  ].join('|');

  /// 画像を今のサイズの比率で真ん中から切り出して PNG にする（Web の CropImageField と同じ大きさ）
  static Future<Uint8List> _cropToSize(Uint8List bytes, GenSize size) async {
    final codec = await ui.instantiateImageCodec(bytes);
    final image = (await codec.getNextFrame()).image;
    final scale = math.max(size.width / image.width, size.height / image.height);
    final srcW = size.width / scale;
    final srcH = size.height / scale;
    final recorder = ui.PictureRecorder();
    ui.Canvas(recorder).drawImageRect(
      image,
      ui.Rect.fromLTWH((image.width - srcW) / 2, (image.height - srcH) / 2, srcW, srcH),
      ui.Rect.fromLTWH(0, 0, size.width.toDouble(), size.height.toDouble()),
      ui.Paint()..filterQuality = ui.FilterQuality.high,
    );
    final out = await recorder.endRecording().toImage(size.width, size.height);
    final png = await out.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    out.dispose();
    return png!.buffer.asUint8List();
  }

  /// 生成を依頼する。止めたときは理由を返す
  Future<GenBlock?> submit() async {
    final block = check();
    if (block != null) return block;
    final v = viewer!;
    final m = model!;
    final s = settings;

    final basePrompt = s.prompt.trim().isEmpty ? GenRules.randomPrompts[math.Random().nextInt(GenRules.randomPrompts.length)] : s.prompt.trim();
    final prompt = s.composePrompt(basePrompt);
    final modelName = s.userCheckpoint?.checkpointName ?? m.name;
    final steps = (s.steps > GenRules.maxSteps || s.steps < GenRules.minSteps) ? GenRules.maxSteps : s.steps;
    final count = imagesPerRequest;
    final taskCount = math.max(1, s.generationCount);
    final generationType = s.generationType(isPaid: v.isPaid);
    final isFlux = s.userCheckpoint == null && m.isFlux;
    final isGemini = s.userCheckpoint == null && m.isGemini;
    final size = GenSize.parse(s.sizeType);

    submitting = true;
    sendingCount = taskCount;
    _syncPolling();
    _notify();
    try {
      var i2iUrl = '';
      if (generationType == 'IMAGE_TO_IMAGE') {
        i2iUrl = await GenApi.uploadPublicImage(await _cropToSize(s.i2iImage!, size));
      }
      String? controlNetUrl;
      if (s.controlNetImage != null) {
        controlNetUrl = await GenApi.uploadPublicImage(await _cropToSize(s.controlNetImage!, size));
      }
      final controlNet = {
        'controlNetImageUrl': controlNetUrl,
        'controlNetWeight': controlNetUrl == null ? null : s.controlNetWeight,
        'controlNetModel': controlNetUrl == null ? null : s.controlNetModel,
        'controlNetModule': controlNetUrl == null ? null : s.controlNetModule,
      };

      Future<void> one(int i) {
        // Seed を決めているときは依頼ごとに枚数ぶんずらす
        final seed = s.seed == -1 ? -1 : s.seed + i * count;
        final overLimit = v.consecutive > 0 && i + 1 + v.inProgress > v.consecutive;
        // 画像から生成・flux.1 は予約できないので、上限を超えた分は送らない
        if (overLimit && (i2iUrl.isNotEmpty || isFlux)) return Future.value();
        if (isFlux) {
          return Api.mutate(
            GenApi.createFluxTask,
            variables: {
              'input': {
                'count': 1,
                'prompt': prompt,
                'isPromptGenerationEnabled': s.japanesePrompt,
                'negativePrompt': s.negativePrompt,
                'seed': seed,
                'steps': steps,
                'scale': s.scale,
                'sizeType': s.sizeType,
                'modelName': modelName,
              },
            },
          );
        }
        final common = {
          'model': modelName,
          'vae': s.vae,
          'prompt': prompt,
          'isPromptGenerationEnabled': s.japanesePrompt,
          'negativePrompt': s.negativePrompt,
          'seed': seed,
          'steps': steps,
          'scale': s.scale,
          'sampler': s.sampler,
          'scheduler': s.scheduler,
          'clipSkip': s.clipSkip,
          ...GenRules.sizeInput(s.sizeType),
          ...controlNet,
          'upscaleSize': s.highRes ? 2 : null,
        };
        if (overLimit) {
          // 同時に作れる数を超えた分は予約生成にする（Web と同じ）
          return Api.mutate(
            GenApi.createReservedTask,
            variables: {
              'input': {...common, 'count': 1, 'type': 'TEXT_TO_IMAGE'},
            },
          );
        }
        if (isGemini) {
          final lower = modelName.toLowerCase();
          final is31 = lower.contains('3.1') || lower.contains('nanobanana2') || lower.contains('nano banana 2');
          return Api.mutate(
            GenApi.createGeminiTask,
            variables: {
              'input': {
                'prompt': basePrompt,
                'size': GenRules.geminiSize(s.sizeType),
                'imageUrl': i2iUrl.isEmpty ? null : i2iUrl,
                'model': is31 ? 'GEMINI_31_FLASH_IMAGE_PREVIEW' : 'GEMINI_25_FLASH_IMAGE',
              },
            },
          );
        }
        return Api.mutate(
          GenApi.createTask,
          variables: {
            'input': {
              ...common,
              // 1 回で作る枚数（サーバー側で上限に収める）
              'count': count,
              'type': generationType,
              't2tImageUrl': i2iUrl,
              't2tDenoisingStrengthSize': s.i2iStrength.toString(),
            },
          },
        );
      }

      await Future.wait([for (var i = 0; i < taskCount; i++) one(i)]);
      if (s.seed != -1) s.lastRequestKey = _requestKey(m);
      unawaited(s.save());
      // 反映が遅れることがあるので少しずつ取り直す
      await refreshHistory();
      for (final delay in const [1500, 4000, 8000]) {
        Future.delayed(Duration(milliseconds: delay), () {
          if (_disposed) return;
          loadViewer();
          loadCoins();
          if (s.isGemini) loadGeminiAllowance();
        });
      }
      return null;
    } on ApiException catch (e) {
      // サーバーが止めたとき（コイン・Gemini の枠・内容のチェックなど）
      if (e.message.contains('コイン残高が不足')) return GenBlock(GenBlockKind.coins, e.message);
      if (e.message.contains('Gemini の枠')) return GenBlock(GenBlockKind.geminiLimit, e.message);
      return GenBlock(GenBlockKind.message, e.message);
    } catch (_) {
      return const GenBlock(GenBlockKind.message, '生成を依頼できませんでした。もう一度お試しください');
    } finally {
      submitting = false;
      sendingCount = 0;
      _syncPolling();
      _notify();
    }
  }

  Future<String?> signTerms() async {
    try {
      await Api.mutate(
        GenApi.signTerms,
        variables: {
          'input': {'version': 1},
        },
      );
      await loadViewer();
      return null;
    } on ApiException catch (e) {
      return e.message;
    } catch (_) {
      return '同意を送れませんでした。もう一度お試しください';
    }
  }

  // ---------------------------------------------------------------------------
  // 履歴の操作
  // ---------------------------------------------------------------------------

  Future<String?> setRating(GenResult r, int rating) async {
    final nanoid = r.nanoid;
    if (nanoid == null) return 'この画像は操作できません';
    final before = r.rating;
    r.rating = rating;
    _notify();
    try {
      await Api.mutate(
        GenApi.updateRating,
        variables: {
          'input': {'nanoid': nanoid, 'rating': rating},
        },
      );
      return null;
    } on ApiException catch (e) {
      r.rating = before;
      _notify();
      return e.message;
    } catch (_) {
      r.rating = before;
      _notify();
      return '評価を保存できませんでした';
    }
  }

  Future<String?> setProtected(GenResult r, bool value) async {
    final nanoid = r.nanoid;
    if (nanoid == null) return 'この画像は操作できません';
    final before = r.isProtected;
    r.isProtected = value;
    _notify();
    try {
      await Api.mutate(
        GenApi.updateProtected,
        variables: {
          'input': {'nanoid': nanoid, 'isProtected': value},
        },
      );
      return null;
    } on ApiException catch (e) {
      r.isProtected = before;
      _notify();
      return e.message;
    } catch (_) {
      r.isProtected = before;
      _notify();
      return '保護の設定を保存できませんでした';
    }
  }

  Future<String?> delete(GenResult r) async {
    final nanoid = r.nanoid;
    if (nanoid == null) return 'この画像は削除できません';
    if (r.isProtected) return '保護中の画像は削除できません。保護を外してからお試しください';
    try {
      await Api.mutate(
        GenApi.deleteResult,
        variables: {
          'input': {'nanoid': nanoid},
        },
      );
      results.removeWhere((x) => x.id == r.id);
      running.removeWhere((x) => x.id == r.id);
      _notify();
      return null;
    } on ApiException catch (e) {
      return e.message;
    } catch (_) {
      return '削除できませんでした';
    }
  }

  /// お気に入りのモデルを切り替える
  Future<String?> toggleFavoriteModel(String modelId) async {
    final v = viewer;
    if (v == null) return null;
    final isFav = v.favoriteModelIds.contains(modelId);
    if (isFav) {
      v.favoriteModelIds.remove(modelId);
    } else {
      v.favoriteModelIds.add(modelId);
    }
    _notify();
    try {
      await Api.mutate(
        GenApi.updateModelRating,
        variables: {
          'input': {'modelId': modelId, 'rating': isFav ? 0 : 1},
        },
      );
      return null;
    } on ApiException catch (e) {
      if (isFav) {
        v.favoriteModelIds.add(modelId);
      } else {
        v.favoriteModelIds.remove(modelId);
      }
      _notify();
      return e.message;
    } catch (_) {
      return 'お気に入りを保存できませんでした';
    }
  }

  void onLoggedOut() {
    _loggedIn = false;
    viewer = null;
    coins = null;
    geminiAllowance = null;
    running.clear();
    results.clear();
    progress.clear();
    _syncPolling();
    _notify();
  }

  Future<void> onLoggedIn() async {
    if (_loggedIn) return;
    _loggedIn = true;
    await Future.wait([loadViewer(), loadCoins(), refreshHistory(), if (settings.isGemini) loadGeminiAllowance()]);
  }

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _progressTimer?.cancel();
    _refreshTimer?.cancel();
    settings.removeListener(_onSettings);
    settings.dispose();
    super.dispose();
  }
}
