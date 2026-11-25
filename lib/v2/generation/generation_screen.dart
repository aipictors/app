import 'dart:async';
import 'dart:convert';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/notifications/push.dart';
import 'package:aipictors/v2/generation/generation_debug.dart';
import 'package:aipictors/v2/generation/generation_entry.dart';
import 'package:aipictors/v2/generation/generation_form.dart';
import 'package:aipictors/v2/generation/generation_history.dart';
import 'package:aipictors/v2/generation/generation_reference.dart';
import 'package:aipictors/v2/generation/generation_settings.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/generation/generation_simple.dart';
import 'package:aipictors/v2/generation/lora_picker.dart';
import 'package:aipictors/v2/generation/model_picker.dart';
import 'package:aipictors/v2/generation/result_viewer.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 画像生成タブ（Web の /generation と同じことができる画面）
class GenerationScreen extends StatefulWidget {
  const GenerationScreen({super.key});

  /// 「生成が終わりました」の通知を押したとき、履歴を開いて読み直す（値を 1 つ進める）
  static final openHistory = ValueNotifier<int>(0);

  @override
  State<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen> {
  final _controller = GenController();

  /// 折りたたみの開閉で 1 ペイン⇔2 ペインが入れ替わっても、入力欄・開閉・スクロール位置を残す
  final _formKey = GlobalKey(debugLabel: 'genForm');
  final _historyKey = GlobalKey(debugLabel: 'genHistory');
  StreamSubscription<User?>? _auth;
  bool _loggedIn = Nav.isLoggedIn;
  int _tab = 0;
  bool _grantShown = false;
  bool _debugDone = false;

  /// 参照生成（Web の /generation?work=）
  RefRequest? _refLoading;
  ReferenceState? _reference;

  /// かんたん入口（Web の /generation/home）を出すか。null はまだ決めていない
  bool? _simple;
  bool _entryLoaded = false;

  /// 端末に覚えた入口の選択（'advanced' / 'simple'）
  String? _entryMode;

  /// かんたん入口で「生成する」を押して、ログインや読み込みを待っているプロンプト
  String? _pending;
  bool _pendingRunning = false;

  /// 一度通常の画面を出したら、開いている間はかんたん入口に戻さない（Web と同じ）
  bool _shownAdvanced = false;

  /// 切り替えのボタンで選んだあとは、自動では変えない
  bool _chosen = false;

  @override
  void initState() {
    super.initState();
    // 開発用: /tmp/aipictors-debug の 2 行目 gen:<action> でも自動操作を選べる（本体のアプリで確かめるとき）
    final debugTab = DebugBoot.screenTab;
    if (kDebugMode && GenDebug.action == null && debugTab != null && debugTab.startsWith('gen:')) GenDebug.action = debugTab.substring(4);
    _controller.start(loggedIn: _loggedIn);
    _controller.addListener(_onController);
    _loadEntry();
    GenReference.pending.addListener(_takeReference);
    GenerationScreen.openHistory.addListener(_showHistory);
    _auth = FirebaseAuth.instance.authStateChanges().listen((user) {
      final loggedIn = user != null;
      if (loggedIn == _loggedIn) return;
      setState(() => _loggedIn = loggedIn);
      if (loggedIn) {
        _controller.onLoggedIn();
      } else {
        _controller.onLoggedOut();
      }
      _decideEntry();
    });
  }

  @override
  void dispose() {
    _auth?.cancel();
    GenReference.pending.removeListener(_takeReference);
    GenerationScreen.openHistory.removeListener(_showHistory);
    _controller.removeListener(_onController);
    _controller.dispose();
    super.dispose();
  }

  void _showHistory() {
    if (!mounted) return;
    _openAdvanced(remember: false);
    setState(() => _tab = 1);
    unawaited(_controller.refreshAll());
  }

  void _onController() {
    _decideEntry();
    _runPending();
    _takeReference();
    if (kDebugMode && !_debugDone && GenDebug.action != null) _runDebugAction();
    final grant = _controller.grantMessage;
    if (grant != null && !_grantShown && mounted) {
      _grantShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.toast(grant, icon: Icons.toll_rounded);
      });
    }
  }

  Future<void> _loadEntry() async {
    final mode = await GenEntry.readMode();
    final pending = await GenEntry.readPending();
    if (!mounted) return;
    _entryMode = mode;
    // ログイン済みで開いたときの残りは使わない（前に押したものが、開いただけで急に生成されないように）
    if (pending != null && _loggedIn) {
      unawaited(GenEntry.clearPending());
    } else {
      _pending = pending;
    }
    _entryLoaded = true;
    _decideEntry();
    _runPending();
  }

  /// かんたん入口と通常の画面のどちらを出すか決める（Web の useGenerationEntryMode と同じ）
  /// - 「詳細設定」を押した・一度生成した・生成履歴がある人は通常の画面（端末に覚える）
  /// - 未ログインの人と、生成履歴が 0 件の人はかんたん入口
  /// - 履歴が読めないときは、今までどおり通常の画面
  void _decideEntry() {
    if (!_entryLoaded || _shownAdvanced || _chosen || !mounted) return;
    final v = _controller.viewer;
    final bool? simple;
    if (_pending != null && _loggedIn) {
      simple = false;
    } else if (_entryMode == 'advanced') {
      simple = false;
    } else if (_entryMode == 'simple' || !_loggedIn) {
      simple = true;
    } else if (_controller.viewerError != null) {
      simple = false;
    } else if (v == null) {
      simple = null;
    } else {
      simple = v.generatedCount == 0;
    }
    if (v != null && v.generatedCount > 0 && _entryMode == null) {
      _entryMode = 'advanced';
      unawaited(GenEntry.saveMode('advanced'));
    }
    if (simple == false) _shownAdvanced = true;
    if (simple != _simple) setState(() => _simple = simple);
  }

  /// 通常の画面にする（remember: 次からも通常の画面で開く）
  void _openAdvanced({bool remember = true}) {
    if (remember) {
      _entryMode = 'advanced';
      unawaited(GenEntry.saveMode('advanced'));
    }
    _shownAdvanced = true;
    if (_simple != false && mounted) setState(() => _simple = false);
  }

  /// かんたん入口にする（次からもかんたん入口で開く）
  void _openSimple({bool remember = true}) {
    if (remember) {
      _entryMode = 'simple';
      unawaited(GenEntry.saveMode('simple'));
    }
    FocusScope.of(context).unfocus();
    _chosen = true;
    _shownAdvanced = false;
    setState(() => _simple = true);
  }

  /// かんたん入口の「生成する」。未ログインならログインのあとに始める
  void _startFromEntry(String prompt) {
    _pending = prompt;
    unawaited(GenEntry.savePending(prompt));
    if (!_loggedIn) {
      context.toast(tr('ログイン（無料の登録）をすると、入力したプロンプトでそのまま生成が始まります', 'Log in (free sign-up) and generation starts right away with your prompt'), icon: Icons.login_rounded);
      Nav.login(context);
      return;
    }
    _decideEntry();
    _runPending();
  }

  /// 待っているプロンプトを通常の画面の入力欄に入れて、生成ボタンを押したときと同じ処理を 1 回だけ呼ぶ
  /// （Web の useGenerationAutoSubmit。日本語なら「日本語で入力する」をオンにする）
  void _runPending() {
    final prompt = _pending;
    final c = _controller;
    if (prompt == null || _pendingRunning || !_loggedIn || c.catalog == null || c.viewer == null || !mounted) return;
    _pendingRunning = true;
    _pending = null;
    unawaited(GenEntry.clearPending());
    c.settings.update((s) {
      s.prompt = prompt;
      s.japanesePrompt = containsJapanese(prompt);
    });
    _openAdvanced(remember: false);
    setState(() => _tab = 0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final ok = await _generate();
      _pendingRunning = false;
      // 生成を始められたら、次からは通常の画面で開く（自分でかんたんを選んだ人はそのまま）
      if (ok && _entryMode != 'simple') {
        _entryMode = 'advanced';
        unawaited(GenEntry.saveMode('advanced'));
      }
    });
  }

  /// 開発用: 画面に触れずに各状態を開く（debug_main.dart から）
  void _runDebugAction() {
    final c = _controller;
    if (c.catalog == null || c.viewer == null || c.historyLoading) return;
    _debugDone = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      switch (GenDebug.action) {
        case 'models':
          showModelPicker(context, c);
        case 'lora':
          showLoraPicker(context, c);
        case 'history':
          setState(() => _tab = 1);
        case 'viewer':
          if (c.results.isNotEmpty) openResultViewer(context, controller: c, initialIndex: 0, onReuse: _reuse);
        case 'terms':
          showTermsSheet(context, onAgree: c.signTerms);
        case 'generate':
          _generate();
        case 'generate-small':
          // 一番小さいサイズで 1 枚だけ（コインを使う）
          c.settings.update((x) {
            x.sizeType = 'SD1_512_512';
            x.highRes = false;
            x.imagesPerRequest = 1;
            x.prompt = 'cat, simple background';
          });
          final m = c.catalog?.model(GenRules.defaultModelId);
          if (m != null) c.settings.selectModel(m);
          c.settings.update((x) => x.sizeType = 'SD1_512_512');
          await _generate();
          setState(() => _tab = 1);
        case 'custom':
          c.settings.update((x) {
            final sdxl = c.catalog?.models.firstWhere((m) => m.type == 'SDXL');
            if (sdxl != null) x.selectModel(sdxl);
            x.sizeType = 'CUSTOM_2496_2048';
          });
        case 'landscape':
          c.settings.update((x) {
            final sdxl = c.catalog?.models.firstWhere((m) => m.type == 'SDXL');
            if (sdxl != null) x.selectModel(sdxl);
            x.sizeType = 'SD3_1216_832';
          });
        case 'gemini':
          final g = c.catalog?.models.firstWhere((m) => m.isGemini);
          if (g != null) c.settings.selectModel(g);
          _generate();
        case 'flux':
          final f = c.catalog?.models.firstWhere((m) => m.isFlux);
          if (f != null) c.settings.selectModel(f);
          _generate();
        case 'coins':
          showCoinHistorySheet(context);
        case 'usermodels':
          showModelPicker(context, c);
        case 'simple':
          _openSimple(remember: false);
        case 'simple-dry':
          // かんたん入口から押したときに送る内容をログに出すだけ（生成は依頼しない）
          Api.debugMutationHandler = (document, variables) async {
            debugPrint('[GenDebug] mutation ${RegExp(r'mutation\s+(\w+)').firstMatch(document)?.group(1)} ${jsonEncode(variables)}');
            return <String, dynamic>{};
          };
          _openSimple(remember: false);
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) _startFromEntry(tr('桜の下で笑う女の子、やわらかい光、アニメ風', 'a smiling girl under cherry blossoms, soft light, anime style'));
      }
    });
  }

  /// 作品画面・カードから渡された作品を読み、項目を選んで流し込む
  Future<void> _takeReference() async {
    final req = GenReference.pending.value;
    final catalog = _controller.catalog;
    if (req == null || !_loggedIn || !mounted) return;
    // 作品の設定を読み込むときは通常の画面で（Web の ?work= と同じ）
    _openAdvanced(remember: false);
    // モデル一覧を読み終えるまで待つ（_onController から呼び直される）
    if (catalog == null) {
      if (_refLoading?.workId != req.workId) setState(() => _refLoading = req);
      return;
    }
    GenReference.pending.value = null;
    FocusScope.of(context).unfocus();
    setState(() {
      _tab = 0;
      _refLoading = req;
    });
    try {
      final work = await RefWork.load(req.workId);
      if (!mounted) return;
      final plan = ReferencePlan.build(work, catalog);
      if (!plan.hasAnything) {
        setState(() => _refLoading = null);
        context.toast(tr('この作品には引き継げる生成情報がありません', 'This work has no generation info to load'), error: true);
        return;
      }
      // タブが切り替わってからシートを出す
      await Future.delayed(const Duration(milliseconds: 250));
      if (!mounted) return;
      await _chooseReference(plan);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _refLoading = null);
      context.toast(e.message, error: true);
    }
  }

  Future<void> _chooseReference(ReferencePlan plan, {Set<RefField>? initial, Map<String, dynamic>? before}) async {
    final s = _controller.settings;
    final currentModel = s.userCheckpoint?.name ?? _controller.model?.displayName ?? '';
    // 選び直すときは、読み込む前の設定（モデルの種類）を基準にする
    final base = before ?? s.toJson();
    final checkpoint = base['userCheckpoint'];
    final type = (checkpoint is Map ? checkpoint['type']?.toString() : null) ?? base['modelType']?.toString() ?? s.effectiveType;
    final picked = await showReferenceSheet(context, plan: plan, currentType: type, currentModelName: currentModel, initial: initial);
    if (!mounted) return;
    if (picked == null) {
      setState(() => _refLoading = null);
      return;
    }
    if (before != null) s.loadJson(before);
    final snapshot = before ?? Map<String, dynamic>.of(s.toJson());
    s.applyReference(plan.patch(picked, currentType: type));
    final warnings = plan.warnings(picked, currentType: type);
    setState(() {
      _refLoading = null;
      _reference = ReferenceState(plan: plan, selected: picked, applied: plan.applied(picked, currentType: type), warnings: warnings, before: snapshot);
      _tab = 0;
    });
    Ds.success();
    context.toast(
      warnings.isEmpty ? tr('作品の設定を読み込みました', 'Loaded settings from the work') : tr('作品の設定を読み込みました（一部は入りませんでした）', 'Loaded settings (some items were skipped)'),
      icon: Icons.auto_awesome_rounded,
    );
  }

  void _undoReference() {
    final r = _reference;
    if (r == null) return;
    Ds.impact();
    _controller.settings.loadJson(r.before);
    setState(() => _reference = null);
    context.toast(tr('読み込む前の設定に戻しました', 'Restored previous settings'), icon: Icons.undo_rounded);
  }

  void _closeReference() {
    Ds.tap();
    setState(() {
      _reference = null;
      _refLoading = null;
    });
  }

  Widget? _referenceBanner() {
    if (_reference == null && _refLoading == null) return null;
    final r = _reference;
    return AnimatedSize(
      duration: Ds.slow,
      curve: Curves.easeOutCubic,
      child: ReferenceBanner(
        key: ValueKey(r?.plan.work.id ?? _refLoading?.workId),
        state: _refLoading != null && r?.plan.work.id != _refLoading?.workId ? null : r,
        loading: _refLoading,
        onClose: _closeReference,
        onUndo: r == null ? null : _undoReference,
        onEdit: r == null ? null : () => _chooseReference(r.plan, initial: r.selected, before: r.before),
      ),
    );
  }

  void _reuse(GenResult r) {
    final catalog = _controller.catalog;
    if (catalog == null) return;
    _controller.settings.applyResult(r, catalog);
    setState(() => _tab = 0);
    context.toast(tr('この設定を読み込みました', 'Settings loaded'), icon: Icons.replay_rounded);
  }

  /// 生成を始められたら true
  Future<bool> _generate() async {
    FocusScope.of(context).unfocus();
    final c = _controller;
    if (c.viewer != null && !c.viewer!.hasSignedTerms) {
      final agreed = await showTermsSheet(context, onAgree: c.signTerms);
      if (!agreed || !mounted) return false;
    }
    // フリーコインが足りずプレミアムコインを使うときは確認する
    if (c.check() == null && c.premiumCoinUse > 0) {
      final ok = await showConfirmSheet(context, title: tr('プレミアムコインを使います', 'Use premium coins'), message: tr('この生成でプレミアムコインを ${c.premiumCoinUse} 枚使います。よろしいですか？', 'This generation uses ${c.premiumCoinUse} premium coins. Continue?'), confirmLabel: tr('使って生成する', 'Use and generate'));
      if (!ok || !mounted) return false;
    }
    Ds.impact();
    final block = await c.submit();
    if (!mounted) return false;
    if (block == null) {
      Ds.success();
      context.toast(tr('生成をはじめました', 'Generation started'), icon: Icons.auto_awesome_rounded);
      // 通知がオフなら「アプリを閉じても続く・終わったら知らせる」を提案する（間をあけて数回まで）
      unawaited(Push.offerAfterGeneration(context));
      return true;
    }
    switch (block.kind) {
      case GenBlockKind.coins:
        final have = c.coins?.total ?? 0;
        await showCoinShortageSheet(context, need: c.requestCost, have: have, passType: c.viewer?.passType, exhausted: have < c.settings.coinPerImage(c.model, isPaid: c.isPaid));
      case GenBlockKind.plan:
        await showPlanRequiredSheet(context, block.message);
      case GenBlockKind.geminiLimit:
        await showGeminiLimitSheet(context, coinCost: c.settings.coinPerImage(c.model, isPaid: c.isPaid), premium: c.coins?.premium ?? 0, isPaid: c.isPaid);
      case GenBlockKind.verification:
        await showVerificationSheet(context);
      case GenBlockKind.terms:
        final agreed = await showTermsSheet(context, onAgree: c.signTerms);
        if (agreed && mounted) return _generate();
      case GenBlockKind.message:
        context.toast(block.message, error: true);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // 未ログインの人もかんたん入口は使える（「生成する」でログインへ。Web と同じ）
    if (!_loggedIn && (_simple == true || !_entryLoaded)) return _entryScaffold();
    if (_loggedIn && _simple != false) return _entryScaffold();
    if (!_loggedIn) {
      return Scaffold(
        body: SafeArea(
          child: LoginRequiredView(
            icon: Icons.auto_awesome_rounded,
            title: tr('AI でイラストを生成しよう', 'Create illustrations with AI'),
            message: tr('言葉を書くだけで、AI がイラストを描きます。\n無料のコインが毎日もらえるので、ログインしてすぐに試せます。', 'Just describe it and AI draws the illustration.\nYou get free coins every day, so log in and try it right away.'),
            onLogin: () => Nav.login(context),
          ),
        ),
      );
    }
    return Scaffold(
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          final wide = isWideLayout(context);
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                _Header(controller: _controller, loggedIn: true, onSimple: _openSimple),
                if (!wide) ...[
                  PillTabs(
                    labels: [tr('つくる', 'Create'), _controller.runningCount > 0 ? tr('履歴・生成中 ${_controller.runningCount}', 'History · ${_controller.runningCount} running') : tr('履歴', 'History')],
                    index: _tab,
                    onChanged: (i) => setState(() => _tab = i),
                  ),
                  const SizedBox(height: 4),
                ],
                Expanded(child: wide ? _wideBody() : _narrowBody()),
              ],
            ),
          );
        },
      ),
    );
  }

  /// かんたん入口（決めている間は同じ形の仮の表示）
  Widget _entryScaffold() {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) => SafeArea(
          bottom: false,
          child: Column(
            children: [
              _Header(controller: _controller, loggedIn: _loggedIn),
              Expanded(
                child: _simple == true
                    ? GenerationSimpleEntry(
                        loggedIn: _loggedIn,
                        initialPrompt: _pending,
                        busy: _controller.submitting,
                        onGenerate: _startFromEntry,
                        onOpenAdvanced: () {
                          Ds.tap();
                          FocusScope.of(context).unfocus();
                          _openAdvanced();
                        },
                      )
                    : const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Column(children: [
                          Skeleton(height: 22, width: 240, radius: 8),
                          SizedBox(height: 14),
                          Skeleton(height: 150, radius: 18),
                        ]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _narrowBody() {
    return Stack(
      children: [
        IndexedStack(
          index: _tab,
          children: [
            GenerationForm(
              key: _formKey,
              controller: _controller,
              header: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                ?_referenceBanner(),
                _RecentStrip(controller: _controller, onReuse: _reuse, onSeeAll: () => setState(() => _tab = 1)),
              ]),
              bottomPadding: 150,
            ),
            GenerationHistory(key: _historyKey, controller: _controller, onReuse: _reuse, bottomPadding: 24),
          ],
        ),
        if (_tab == 0)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _GenerateBar(controller: _controller, onGenerate: _generate),
          ),
      ],
    );
  }

  Widget _wideBody() {
    // 左のナビゲーションを除いた幅で分ける（iPhone Duo の内側などでも結果が 2 列で見えるように）
    return LayoutBuilder(builder: (context, box) => Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: (box.maxWidth * 0.55).clamp(340, 480).toDouble(),
          child: Stack(
            children: [
              GenerationForm(key: _formKey, controller: _controller, header: _referenceBanner(), bottomPadding: 150),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _GenerateBar(controller: _controller, onGenerate: _generate),
              ),
            ],
          ),
        ),
        VerticalDivider(width: 1, color: context.hairline),
        Expanded(
          child: GenerationHistory(key: _historyKey, controller: _controller, onReuse: _reuse),
        ),
      ],
    ));
  }
}

/// 見出し（タイトル・プラン・コイン残高）
class _Header extends StatelessWidget {
  const _Header({required this.controller, required this.loggedIn, this.onSimple});

  final GenController controller;
  final bool loggedIn;

  /// 通常の画面で出す「かんたん」（かんたん入口に切り替える）
  final VoidCallback? onSimple;

  @override
  Widget build(BuildContext context) {
    final v = controller.viewer;
    final coins = controller.coins;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 12, 10),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (r) => Ds.brandGradient.createShader(r),
            child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr('画像生成', 'Image generation'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.4)),
                if (v != null)
                  Text(
                    v.engineWait > 0 ? tr('${v.planLabel} ・ 混み具合: 待ち ${v.engineWait} 件', '${v.planLabel} · Queue: ${v.engineWait} waiting') : v.planLabel,
                    style: TextStyle(fontSize: 11.5, color: context.muted, fontWeight: FontWeight.w600),
                  ),
              ],
            ),
          ),
          if (onSimple != null) ...[
            Pressable(
              onTap: onSimple,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit_note_rounded, size: 17, color: context.cs.onSurface.withValues(alpha: 0.78)),
                    const SizedBox(width: 3),
                    Text(tr('かんたん', 'Simple'), style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: context.cs.onSurface.withValues(alpha: 0.78))),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          if (loggedIn) Pressable(
            onTap: () => _showCoins(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                gradient: Ds.goldGradient,
                borderRadius: Ds.br(20),
                boxShadow: [BoxShadow(color: Ds.gold.withValues(alpha: 0.35), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.toll_rounded, color: Colors.white, size: 18),
                  const SizedBox(width: 5),
                  coins == null
                      ? const SizedBox(
                          width: 26,
                          height: 12,
                          child: LinearProgressIndicator(color: Colors.white, backgroundColor: Colors.white24),
                        )
                      : Text(
                          compactCount(coins.total),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCoins(BuildContext context) {
    final coins = controller.coins;
    final v = controller.viewer;
    showGenSheet(
      context,
      builder: (sheet) => SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(tr('コイン', 'Coins'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(tr('生成するとコインを使います。フリーコインから先に使われます。', 'Generating uses coins. Free coins are used first.'), style: TextStyle(color: context.muted, fontSize: 13)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _CoinBox(label: tr('フリーコイン', 'Free coins'), value: coins?.free, note: tr('毎日付与・当日24:00まで', 'Daily, valid until 24:00')),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _CoinBox(label: tr('プレミアムコイン', 'Premium coins'), value: coins?.premium, note: tr('プラン・購入分', 'From plans and purchases'), premium: true),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(16)),
                child: Column(
                  children: [
                    _kv(context, tr('プラン', 'Plan'), v?.planLabel ?? '-'),
                    _kv(context, tr('1枚あたり', 'Per image'), tr(
                        '${controller.settings.coinPerImage(controller.model, isPaid: controller.isPaid)} コイン${controller.settings.highRes ? '（高解像度）' : ''}',
                        '${controller.settings.coinPerImage(controller.model, isPaid: controller.isPaid)} coins${controller.settings.highRes ? ' (high-res)' : ''}',
                      )),
                    _kv(context, tr('同時に生成できる数', 'Simultaneous generations'), v == null ? '-' : '${v.consecutive}'),
                    _kv(context, tr('使える LoRA の数', 'LoRA limit'), v == null ? '-' : '${v.loraLimit}'),
                    if (v?.isPaid == true) _kv(context, tr('毎日のフリーコイン', 'Daily free coins'), tr('${{'LITE': 500, 'STANDARD': 1000, 'PREMIUM': 2000}[v!.passType] ?? 0} コイン', '${{'LITE': 500, 'STANDARD': 1000, 'PREMIUM': 2000}[v.passType] ?? 0} coins')),
                    if (v?.isPaid == true) _kv(context, tr('継続ボーナス', 'Renewal bonus'), tr('更新のたび ${{'LITE': 100, 'STANDARD': 300, 'PREMIUM': 600}[v!.passType] ?? 0} コイン', '${{'LITE': 100, 'STANDARD': 300, 'PREMIUM': 600}[v.passType] ?? 0} coins each renewal')),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              GradientButton(
                label: tr('コインを買う', 'Buy coins'),
                icon: Icons.add_shopping_cart_rounded,
                onPressed: () {
                  Navigator.of(sheet).pop();
                  showCoinShopSheet(context);
                },
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(sheet).pop();
                  showCoinHistorySheet(context);
                },
                icon: const Icon(Icons.receipt_long_rounded, size: 18),
                label: Text(tr('コインの履歴を見る', 'Coin history')),
              ),
              const SizedBox(height: 8),
              GradientButton(
                label: v?.isPaid == true ? tr('プランを確認する', 'View plan') : tr('Aipictors+ でコインを増やす', 'Get more coins with Aipictors+'),
                icon: Icons.workspace_premium_rounded,
                onPressed: () {
                  Navigator.of(sheet).pop();
                  Nav.plans(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _kv(BuildContext context, String k, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Text(k, style: TextStyle(color: context.muted, fontSize: 13)),
        const Spacer(),
        Text(v, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
      ],
    ),
  );
}

class _CoinBox extends StatelessWidget {
  const _CoinBox({required this.label, required this.value, required this.note, this.premium = false});

  final String label;
  final int? value;
  final String note;
  final bool premium;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(gradient: premium ? Ds.brandGradient : Ds.goldGradient, borderRadius: Ds.br(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
          ),
          const SizedBox(height: 6),
          Text(
            value == null ? '-' : '$value',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26),
          ),
          Text(note, style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 10.5)),
        ],
      ),
    );
  }
}

/// 「つくる」の上に出す、生成中と最近の結果
class _RecentStrip extends StatelessWidget {
  const _RecentStrip({required this.controller, required this.onReuse, required this.onSeeAll});

  final GenController controller;
  final ValueChanged<GenResult> onReuse;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    final c = controller;
    final running = [if (c.sendingCount > 0) null, ...c.running.where((t) => t.isRunning)];
    final recent = c.results.take(12).toList();
    if (running.isEmpty && recent.isEmpty) return const SizedBox.shrink();
    const h = 150.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(running.isNotEmpty ? tr('生成中', 'Generating') : tr('最近の生成', 'Recent'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
              const Spacer(),
              TextButton(onPressed: onSeeAll, child: Text(tr('すべて見る', 'See all'))),
            ],
          ),
          SizedBox(
            height: h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: running.length + recent.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                if (i < running.length) {
                  final t = running[i];
                  final aspect = (t?.aspect ?? 2 / 3).clamp(0.5, 1.5);
                  return SizedBox(
                    width: h * aspect,
                    child: GeneratingCard(task: t, progress: t?.nanoid == null ? null : c.progress[t!.nanoid], height: h),
                  );
                }
                final index = i - running.length;
                final r = recent[index];
                return SizedBox(
                  width: h * r.aspect.clamp(0.5, 1.5),
                  child: ResultTile(
                    hero: false,
                    result: r,
                    height: h,
                    onTap: () => openResultViewer(context, controller: c, initialIndex: index, onReuse: onReuse),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 生成ボタンの上に出す 1 行のお知らせ（押すと詳しく）
class _NoticeBanner extends StatelessWidget {
  const _NoticeBanner({required this.notice});

  final GenNotice notice;

  @override
  Widget build(BuildContext context) {
    final color = notice.isMaintenance ? context.cs.error : Ds.gold;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Pressable(
        onTap: () => showDialog(
          context: context,
          builder: (dialog) => AlertDialog.adaptive(
            title: Text(notice.title),
            content: Text(notice.message),
            actions: [TextButton(onPressed: () => Navigator.pop(dialog), child: const Text('OK'))],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: Ds.br(12), border: Border.all(color: color.withValues(alpha: 0.5))),
          child: Row(
            children: [
              Icon(notice.isMaintenance ? Icons.build_rounded : Icons.info_outline_rounded, size: 16, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(notice.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Gemini を選んでいるときの今週の枠（枠を超えるとプレミアムコインを使うので、押す前に残りが分かるようにする）
class _GeminiAllowanceBar extends StatelessWidget {
  const _GeminiAllowanceBar({required this.allowance, required this.coinCost, required this.premium});

  final GeminiAllowance allowance;
  final int coinCost;
  final int premium;

  @override
  Widget build(BuildContext context) {
    if (allowance.weeklyLimit <= 0) return const SizedBox.shrink();
    final limit = allowance.weeklyLimit ~/ coinCost;
    final left = allowance.remaining ~/ coinCost;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.8), borderRadius: Ds.br(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome_rounded, size: 14),
                const SizedBox(width: 6),
                Expanded(child: Text(tr('今週の Gemini の枠', 'Gemini this week'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
                Text(tr('あと$left枚 / $limit枚', '$left / $limit left'), style: TextStyle(fontSize: 12, fontWeight: left == 0 ? FontWeight.w800 : FontWeight.w500, color: left == 0 ? Ds.pink : null)),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: Ds.br(2),
              child: LinearProgressIndicator(value: (allowance.used / allowance.weeklyLimit).clamp(0, 1), minHeight: 4),
            ),
            if (left == 0) ...[
              const SizedBox(height: 4),
              Text(tr('月曜0時に枠が戻ります。今すぐ作るときは1枚プレミアムコイン$coinCost枚（残り$premium枚）', 'Resets Monday 0:00 JST. To generate now, each image costs $coinCost premium coins ($premium left)'), style: TextStyle(fontSize: 11, color: context.muted, height: 1.4)),
            ],
          ],
        ),
      ),
    );
  }
}

/// 下に固定の生成ボタン（使うコインと残高）
class _GenerateBar extends StatelessWidget {
  const _GenerateBar({required this.controller, required this.onGenerate});

  final GenController controller;
  final VoidCallback onGenerate;

  @override
  Widget build(BuildContext context) {
    final c = controller;
    final count = c.imagesPerRequest;
    final cost = c.requestCost;
    final coins = c.coins;
    final short = coins != null && coins.total < cost;
    final v = c.viewer;
    final label = c.submitting
        ? tr('送信中…', 'Sending…')
        : v != null && !v.hasSignedTerms
        ? tr('規約を確認して生成', 'Review terms and generate')
        : count > 1
        ? tr('生成する ×$count枚', 'Generate ×$count')
        : tr('生成する', 'Generate');
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0),
          ],
          // 上の「使うコイン」の行まで下地を敷き、フォームの文字と重ならないようにする
          stops: const [0, 0.86, 1],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (c.notice != null) _NoticeBanner(notice: c.notice!),
          if (c.settings.isGemini && c.geminiAllowance != null) _GeminiAllowanceBar(allowance: c.geminiAllowance!, coinCost: c.settings.coinPerImage(c.model, isPaid: c.isPaid), premium: coins?.premium ?? 0),
          if (v != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(short ? Icons.warning_amber_rounded : Icons.toll_rounded, size: 14, color: short ? Ds.pink : Ds.gold),
                  const SizedBox(width: 4),
                  Text(
                    coins == null ? tr('使うコイン $cost', 'Cost $cost') : tr('使うコイン $cost ・ 残り ${coins.total}', 'Cost $cost · ${coins.total} left'),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: short ? Ds.pink : context.muted),
                  ),
                  if (v.inProgress > 0) ...[
                    const SizedBox(width: 8),
                    Text(
                      tr('・ 生成中 ${v.inProgress}', '· ${v.inProgress} running'),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: context.muted),
                    ),
                  ],
                ],
              ),
            ),
          Pressable(
            onTap: c.submitting || c.catalog == null || v == null ? null : onGenerate,
            child: AnimatedOpacity(
              duration: Ds.fast,
              opacity: c.catalog == null || v == null ? 0.5 : 1,
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  gradient: Ds.brandGradient,
                  borderRadius: Ds.br(28),
                  boxShadow: [BoxShadow(color: const Color(0xFF6D5DF6).withValues(alpha: 0.35), blurRadius: 20, offset: const Offset(0, 8))],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 48),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (c.submitting)
                            const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white))
                          else
                            const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              label,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 56,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: Ds.br(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.toll_rounded, color: Colors.white, size: 14),
                          const SizedBox(width: 3),
                          Text(
                            '$cost',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
