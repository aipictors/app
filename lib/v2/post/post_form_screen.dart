import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/post_event.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/post/video_post.dart';
import 'package:aipictors/v2/post/video_section.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:video_player/video_player.dart';

/// システムの写真ピッカーで画像を選ぶ（権限が要らない）
Future<List<XFile>> pickSystemImages({bool multiple = true}) async {
  final platform = ImagePickerPlatform.instance;
  if (platform is ImagePickerAndroid) platform.useAndroidPhotoPicker = true;
  final picker = ImagePicker();
  if (multiple) return picker.pickMultiImage(requestFullMetadata: false);
  final one = await picker.pickImage(source: ImageSource.gallery, requestFullMetadata: false);
  return one == null ? const [] : [one];
}

/// 作品の投稿と編集。[workId] があれば編集
class PostFormScreen extends StatefulWidget {
  const PostFormScreen({super.key, this.workId, this.workType = 'WORK', this.generationNanoid, this.eventSlug, this.initialTag, this.debugImages, this.debugAutoSubmit = false, this.debugVideoPath});

  final String? workId;
  final String workType;

  /// 生成結果から投稿するときの nanoid。画像と生成情報を最初から入れる
  final String? generationNanoid;

  /// イベントの参加ボタンから来たときのイベントと参加タグ（Web の /new/image?event=&tag=）
  final String? eventSlug;
  final String? initialTag;

  /// デバッグでピッカーを通さずに試すための画像
  final List<Uint8List>? debugImages;
  final bool debugAutoSubmit;

  /// デバッグでピッカーを通さずに試す動画のパス
  final String? debugVideoPath;

  @override
  State<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  PostDraft _draft = PostDraft();
  EditingWork? _editing;
  PostOptions? _options;

  /// フォームに出すイベント（運営のイベント＋参加ボタンから来たイベント）
  List<PostEvent> _events = const [];
  String? _error;
  bool _loading = true;
  double? _progress;

  final List<PostImage> _images = [];
  final _title = TextEditingController();
  final _caption = TextEditingController();
  final _tag = TextEditingController();
  final _link = TextEditingController();
  final _body = TextEditingController();
  final _prompt = TextEditingController();
  final _negative = TextEditingController();
  final _seed = TextEditingController();
  final _sampler = TextEditingController();
  final _steps = TextEditingController();
  final _modelName = TextEditingController();

  /// プロンプトからのおすすめタグ（プロンプトが変わったら少し待って読み直す）
  List<String> _recommendedTags = const [];
  String _recommendedFor = '';
  int _recommendSeq = 0;

  bool get _isEdit => widget.workId != null;

  bool get _isText => _draft.workType == 'NOVEL' || _draft.workType == 'COLUMN';

  bool get _isVideo => _draft.workType == 'VIDEO';

  /// 動画（workType が VIDEO のとき）
  VideoUploadLimits _videoLimits = VideoUploadLimits.of(null);
  PickedVideo? _video;
  VideoPlayerController? _player;
  EncodedImage? _videoThumb;
  Duration _thumbAt = Duration.zero;
  bool _videoLoading = false;
  bool _thumbLoading = false;
  int _thumbSeq = 0;
  VideoPostPhase? _phase;

  @override
  void initState() {
    super.initState();
    _draft.workType = widget.workType;
    _prompt.addListener(_onPromptChanged);
    _load();
  }

  void _onPromptChanged() {
    final prompt = _prompt.text.trim();
    if (prompt == _recommendedFor) return;
    _recommendedFor = prompt;
    final seq = ++_recommendSeq;
    Future<void>.delayed(const Duration(milliseconds: 800), () async {
      if (!mounted || seq != _recommendSeq) return;
      try {
        final tags = await PostApi.recommendedTags(prompt);
        if (mounted && seq == _recommendSeq) setState(() => _recommendedTags = tags);
      } on ApiException {
        // おすすめが取れなくても入力はできる
      }
    });
  }

  @override
  void dispose() {
    for (final c in [_title, _caption, _tag, _link, _body, _prompt, _negative, _seed, _sampler, _steps, _modelName]) {
      c.dispose();
    }
    _player?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final passType = widget.workType == 'VIDEO' ? VideoPostApi.passType() : Future<String?>.value();
      final options = await PostApi.options();
      _videoLimits = VideoUploadLimits.of(await passType);
      if (_isEdit) {
        final editing = await PostApi.loadForEdit(widget.workId!);
        if (editing == null) throw ApiException(tr('作品が見つかりませんでした', 'Work not found'));
        _editing = editing;
        _draft = PostApi.draftFrom(editing);
        if (_draft.rating == 'R18' || _draft.rating == 'R18G') {
          throw ApiException(tr('この作品はアプリから編集できません', 'This work can\'t be edited in the app'));
        }
        _images
          ..clear()
          ..addAll(editing.imageUrls.map(PostImage.remote));
        _fillControllers();
        if (_isVideo) _openRemoteVideo(editing.json.str('url'));
        if (editing.mdUrl != null) {
          final res = await http.get(Uri.parse(editing.mdUrl!));
          if (res.statusCode == 200) _body.text = utf8.decode(res.bodyBytes, allowMalformed: true);
        }
      }
      if (widget.generationNanoid != null && _images.isEmpty) await _loadGeneration(widget.generationNanoid!, options);
      if (!_isEdit) await _applyEvent(options);
      for (final bytes in widget.debugImages ?? const <Uint8List>[]) {
        _images.add(PostImage.local(await ImageTools.normalize(bytes)));
      }
      if (widget.debugAutoSubmit) _debugFill();
      if (!mounted) return;
      setState(() {
        _options = options;
        if (_events.isEmpty) _events = options.events;
        _loading = false;
      });
      if (widget.debugVideoPath != null) {
        await _useVideo(widget.debugVideoPath!);
        if (!mounted) return;
      }
      if (widget.debugAutoSubmit) WidgetsBinding.instance.addPostFrameCallback((_) => _submit());
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _error = e.message;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _error = tr('読み込めませんでした。通信状況を確かめてもう一度お試しください', 'Couldn\'t load. Check your connection and try again');
          _loading = false;
        });
      }
    }
  }

  Future<void> _loadGeneration(String nanoid, PostOptions options) async {
    final result = await PostApi.generationResult(nanoid);
    if (result == null) throw ApiException(tr('生成した画像が見つかりませんでした', 'Generated image not found'));
    final response = await http.get(Uri.parse(result.imageUrl)).timeout(const Duration(seconds: 60));
    if (response.statusCode != 200) throw ApiException(tr('生成した画像を読み込めませんでした', 'Couldn\'t load the generated image'));
    _images.add(PostImage.local(await ImageTools.normalize(response.bodyBytes)));
    _draft.pngInfo = ImageTools.readGenerationParams(response.bodyBytes)?.source;
    _prompt.text = result.prompt;
    _negative.text = result.negativePrompt;
    _seed.text = result.seed;
    _sampler.text = result.sampler;
    _steps.text = result.steps;
    _modelName.text = result.modelName;
    // サーバーが選んだ使用AIを優先し、無ければ同じ名前の AI モデルを選んでおく
    // （名前が少し違う新しいモデルだと選ばれず、作品が「使用AIなし」になっていた）
    final postModelId = result.postModelId;
    if (postModelId != null && options.models.any((model) => model.id == postModelId)) {
      _draft.modelId = postModelId;
    } else {
      for (final model in options.models) {
        if (model.name == result.modelName) _draft.modelId = model.id;
      }
    }
  }

  void _debugFill() {
    _title.text = 'dry run の作品';
    _caption.text = '送る内容を確かめるだけで、作品は作られません';
    _draft.tags = ['テスト', 'dry-run'];
    _draft.accessType = 'PRIVATE';
    _draft.isBotGradingEnabled = false;
  }

  void _fillControllers() {
    _title.text = _draft.title;
    _caption.text = _draft.caption;
    _link.text = _draft.relatedUrl ?? '';
    _prompt.text = _draft.prompt;
    _negative.text = _draft.negativePrompt;
    _seed.text = _draft.seed;
    _sampler.text = _draft.sampler;
    _steps.text = _draft.steps;
    _modelName.text = _draft.modelName;
  }

  void _readControllers() {
    _draft
      ..title = _title.text
      ..caption = _caption.text
      ..relatedUrl = _link.text.trim().isEmpty ? null : _link.text.trim()
      ..body = _body.text
      ..prompt = _prompt.text
      ..negativePrompt = _negative.text
      ..seed = _seed.text
      ..sampler = _sampler.text
      ..steps = _steps.text
      ..modelName = _modelName.text;
  }

  Future<void> _pick() async {
    final room = (_isText ? 1 : maxPostImages) - _images.length;
    if (room <= 0) {
      context.toast(_isText ? tr('表紙は 1 枚です', 'Only one cover image') : tr('最大$maxPostImages枚までです', 'Up to $maxPostImages images'), error: true);
      return;
    }
    final List<XFile> files;
    try {
      files = await pickSystemImages(multiple: !_isText);
    } catch (_) {
      if (mounted) context.toast(tr('写真を開けませんでした', 'Couldn\'t open photos'), error: true);
      return;
    }
    if (files.isEmpty) return;
    var failed = 0;
    for (final file in files.take(room)) {
      try {
        final bytes = await file.readAsBytes();
        final image = await ImageTools.normalize(bytes);
        _images.add(PostImage.local(image));
        // 最初に見つかった生成情報を入れる（入力済みなら触らない）
        final params = ImageTools.readGenerationParams(bytes);
        if (params != null && _prompt.text.isEmpty) _applyParams(params);
      } on ApiException {
        failed++;
      }
    }
    if (!mounted) return;
    setState(() {});
    if (failed > 0) context.toast(tr('$failed枚は読み込めませんでした（32MB まで）', 'Couldn\'t read $failed image(s) (max 32MB)'), error: true);
    if (files.length > room) context.toast(tr('最大$maxPostImages枚までです', 'Up to $maxPostImages images'));
  }

  /// 投稿済みの動画を再生する（編集）
  void _openRemoteVideo(String url) {
    if (url.isEmpty) return;
    final player = VideoPlayerController.networkUrl(Uri.parse(playableVideoUrl(url)));
    _player = player;
    player.setLooping(true);
    player
        .initialize()
        .then((_) {
          if (mounted) setState(() {});
        })
        .catchError((_) {});
  }

  Future<void> _pickVideo() async {
    if (_progress != null || _videoLoading) return;
    final XFile? file;
    try {
      file = await pickSystemVideo();
    } catch (_) {
      if (mounted) context.toast(tr('動画を開けませんでした', 'Couldn\'t open videos'), error: true);
      return;
    }
    if (file == null || !mounted) return;
    await _useVideo(file.path);
  }

  /// 選んだ動画を調べ、投稿できればプレビューとサムネイルを用意する
  Future<void> _useVideo(String path) async {
    setState(() => _videoLoading = true);
    final bytes = await fileLength(path);
    final player = VideoPlayerController.file(File(path));
    var duration = Duration.zero;
    var size = Size.zero;
    try {
      await player.initialize();
      duration = player.value.duration;
      size = player.value.size;
    } catch (_) {
      // 長さが読めなければ下の判定で弾く
    }
    if (!mounted) {
      await player.dispose();
      return;
    }
    final error = videoPickError(path: path, bytes: bytes, duration: duration, limits: _videoLimits);
    if (error != null) {
      await player.dispose();
      setState(() => _videoLoading = false);
      if (!mounted) return;
      final again = await showConfirmSheet(
        context,
        title: tr('この動画は投稿できません', 'This video can\'t be posted'),
        message: '$error\n\n${_videoLimitText()}',
        confirmLabel: tr('別の動画を選ぶ', 'Choose another video'),
        cancelLabel: tr('閉じる', 'Close'),
      );
      if (again && mounted) await _pickVideo();
      return;
    }
    final old = _player;
    await player.setLooping(true);
    await player.setVolume(0);
    setState(() {
      _player = player;
      _video = PickedVideo(path: path, mime: videoMimeOf(path)!, bytes: bytes, duration: duration, width: size.width.round(), height: size.height.round());
      _videoThumb = null;
      _videoLoading = false;
      _thumbLoading = true;
    });
    await old?.dispose();
    final seq = ++_thumbSeq;
    final first = await captureInitialThumbnail(path, duration, size.width.round(), size.height.round());
    if (!mounted || seq != _thumbSeq) return;
    setState(() {
      _thumbLoading = false;
      if (first != null) {
        _thumbAt = first.$1;
        _videoThumb = first.$2;
      }
    });
    if (first != null) await player.seekTo(first.$1);
    if (first == null && mounted) context.toast(tr('サムネイルを作れませんでした。画像を選んでください', 'Couldn\'t make a thumbnail. Choose an image'), error: true);
  }

  String _videoLimitText() => tr(
    'MP4・MOV／${formatVideoBytes(maxVideoFileBytes)}まで／1本${_videoLimits.maxDurationSeconds}秒まで（1日合計${_videoLimits.dailyTotalDurationSeconds}秒まで）',
    'MP4 or MOV / up to ${formatVideoBytes(maxVideoFileBytes)} / up to ${_videoLimits.maxDurationSeconds}s each (${_videoLimits.dailyTotalDurationSeconds}s total per day)',
  );

  void _onScrub(Duration at) {
    final player = _player;
    if (player == null) return;
    if (player.value.isPlaying) player.pause();
    player.seekTo(at);
  }

  Future<void> _onScrubEnd(Duration at) async {
    final video = _video;
    if (video == null) return;
    final seq = ++_thumbSeq;
    setState(() {
      _thumbAt = at;
      _thumbLoading = true;
    });
    final image = await captureThumbnail(video.path, at, video.width, video.height);
    if (!mounted || seq != _thumbSeq) return;
    setState(() {
      _thumbLoading = false;
      if (image != null) _videoThumb = image;
    });
    if (image == null) context.toast(tr('このコマは使えませんでした', 'Couldn\'t use this frame'), error: true);
  }

  /// サムネイルを別の画像にする
  Future<void> _pickThumbnailImage() async {
    final List<XFile> files;
    try {
      files = await pickSystemImages(multiple: false);
    } catch (_) {
      if (mounted) context.toast(tr('写真を開けませんでした', 'Couldn\'t open photos'), error: true);
      return;
    }
    if (files.isEmpty) return;
    try {
      final image = await ImageTools.normalize(await files.first.readAsBytes());
      _thumbSeq++;
      if (mounted) {
        setState(() {
          _videoThumb = image;
          _thumbLoading = false;
        });
      }
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  Future<void> _removeVideo() async {
    final old = _player;
    _thumbSeq++;
    setState(() {
      _player = null;
      _video = null;
      _videoThumb = null;
      _thumbLoading = false;
    });
    await old?.dispose();
  }

  void _applyParams(GenerationParams p) {
    _prompt.text = p.prompt ?? '';
    _negative.text = p.negativePrompt ?? '';
    _seed.text = p.seed ?? '';
    _sampler.text = p.sampler ?? '';
    _steps.text = p.steps ?? '';
    _modelName.text = p.model ?? '';
    _draft.modelHash = p.modelHash ?? '';
    _draft.pngInfo = p.source;
  }

  void _addTag(String raw) {
    final tag = raw.trim().replaceFirst(RegExp('^[#＃]'), '');
    if (tag.isEmpty) return;
    if (_draft.tags.contains(tag)) {
      _tag.clear();
      return;
    }
    if (_draft.tags.length >= maxPostTags) {
      context.toast(tr('タグは$maxPostTags個までです', 'Up to $maxPostTags tags'), error: true);
      return;
    }
    setState(() {
      _draft.tags = [..._draft.tags, tag];
      _tag.clear();
    });
  }

  /// 一覧にないモデルをその場で足して選ぶ（Web の「『◯◯』を追加」）
  Future<NamedOption?> _addModel(String name) async {
    try {
      final added = await PostApi.createAiModel(name);
      final models = _options!.models;
      if (!models.any((m) => m.id == added.id)) models.add(added);
      if (mounted) context.toast(tr('「${added.name}」を選びました', 'Selected "${added.name}"'));
      return added;
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
      return null;
    }
  }

  /// 参加ボタンから来たら、そのイベントに参加した状態にする（Web の usePostImageSearchParams と同じく URL のタグを付ける。
  /// 開催期間外なら PostFormItemEvent と同じく付けない）
  Future<void> _applyEvent(PostOptions options) async {
    final slug = widget.eventSlug;
    PostEvent? selected;
    if (slug != null && slug.isNotEmpty) {
      selected = options.events.where((e) => e.slug == slug).firstOrNull;
      if (selected == null) {
        try {
          selected = await PostEventApi.bySlug(slug);
        } on ApiException {
          // イベントが読めなくてもタグだけで参加できる
        }
      }
    }
    _events = mergePostEvents(options.events, selected);
    final tag = (widget.initialTag ?? selected?.tag ?? '').trim();
    if (tag.isEmpty || _draft.tags.contains(tag) || _draft.tags.length >= maxPostTags) return;
    final event = _events.where((e) => e.tag == tag).firstOrNull;
    if (event != null && !event.isSelectable(eventPublishAt(_draft.reservedAt))) return;
    _draft.tags = [..._draft.tags, tag];
  }

  /// イベントの「参加する」。参加タグを付け外しする（Web の PostFormItemEvent）
  void _setAttending(PostEvent event, bool on) {
    if (on && !event.isSelectable(eventPublishAt(_draft.reservedAt))) return;
    if (on && _draft.tags.contains(event.tag)) return;
    if (on && _draft.tags.length >= maxPostTags) {
      context.toast(tr('タグは$maxPostTags個までです', 'Up to $maxPostTags tags'), error: true);
      return;
    }
    setState(() => _draft.tags = on ? [..._draft.tags, event.tag] : _draft.tags.where((t) => t != event.tag).toList());
  }

  /// 予約の日時を変えて開催期間外になったイベントからは抜ける（Web の PostFormItemEvent の useEffect）
  void _dropOutOfPeriodEvents() {
    if (_isEdit) return;
    final publishAt = eventPublishAt(_draft.reservedAt);
    final out = {for (final e in _events) if (!e.isSelectable(publishAt)) e.tag};
    _draft.tags = _draft.tags.where((t) => !out.contains(t)).toList();
  }

  Future<void> _pickReservation() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      initialDate: _draft.reservedAt ?? now,
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(_draft.reservedAt ?? now.add(const Duration(hours: 1))));
    if (time == null || !mounted) return;
    final picked = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    if (picked.isBefore(now)) {
      context.toast(tr('これからの日時を選んでください', 'Choose a future date and time'), error: true);
      return;
    }
    setState(() {
      _draft.reservedAt = picked;
      _dropOutOfPeriodEvents();
    });
  }

  Future<void> _submit() async {
    if (_progress != null) return;
    if (!Nav.requireLogin(context)) return;
    _readControllers();
    if (_tag.text.trim().isNotEmpty) _addTag(_tag.text);
    if (_isVideo) {
      await _submitVideo();
      return;
    }
    final invalid = PostApi.validate(_draft, _images) ?? _eventError();
    if (invalid != null) {
      context.toast(invalid, error: true);
      return;
    }
    setState(() => _progress = 0);
    void onProgress(double v) {
      if (mounted) setState(() => _progress = v);
    }

    try {
      final id = _isEdit
          ? await PostApi.update(_editing!, _draft, _images, onProgress: onProgress)
          : await PostApi.create(_draft, _images, onProgress: onProgress);
      if (!mounted) return;
      setState(() => _progress = null);
      Ds.success();
      if (postDryRun) {
        await _showDryRun();
        return;
      }
      context.toast(_isEdit ? tr('作品を更新しました', 'Work updated') : tr('作品を投稿しました', 'Work posted'));
      if (_isEdit) {
        context.pop(true);
      } else {
        context.pushReplacement('/works/$id');
      }
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _progress = null);
      context.toast(e.message, error: true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _progress = null);
      context.toast(tr('投稿に失敗しました。もう一度お試しください', 'Couldn\'t post. Please try again'), error: true);
    }
  }

  /// 投稿するときだけイベントの開催期間を確かめる（Web の新規投稿の getPostEventPeriodError）
  String? _eventError() => _isEdit ? null : postEventPeriodError(tags: _draft.tags, events: _events, reservedAt: _draft.reservedAt);

  Future<void> _submitVideo() async {
    final invalid = validateVideoPost(_draft, hasVideo: _isEdit || _video != null, hasThumbnail: _isEdit || _videoThumb != null) ?? _eventError();
    if (invalid != null) {
      context.toast(invalid, error: true);
      return;
    }
    if (_thumbLoading) {
      context.toast(tr('サムネイルを準備しています。少し待ってからもう一度押してください', 'Preparing the thumbnail. Try again in a moment'));
      return;
    }
    await _player?.pause();
    setState(() {
      _progress = 0;
      _phase = VideoPostPhase.thumbnail;
    });
    void onProgress(VideoPostPhase phase, double v) {
      if (mounted) {
        setState(() {
          _phase = phase;
          _progress = v;
        });
      }
    }

    try {
      final id = _isEdit ? await VideoPostApi.update(_editing!, _draft, _videoThumb, onProgress: onProgress) : await VideoPostApi.create(_draft, _video!, _videoThumb!, onProgress: onProgress);
      if (!mounted) return;
      setState(() {
        _progress = null;
        _phase = null;
      });
      Ds.success();
      if (postDryRun) {
        await _showDryRun();
        return;
      }
      context.toast(_isEdit ? tr('作品を更新しました', 'Work updated') : tr('作品を投稿しました', 'Work posted'));
      if (_isEdit) {
        context.pop(true);
      } else {
        context.pushReplacement('/works/$id');
      }
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _progress = null;
        _phase = null;
      });
      context.toast(e.message, error: true);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _progress = null;
        _phase = null;
      });
      context.toast(tr('投稿に失敗しました。もう一度お試しください', 'Couldn\'t post. Please try again'), error: true);
    }
  }

  Future<void> _showDryRun() {
    final input = PostApi.lastDryRunInput ?? const {};
    final lines = input.entries.where((e) => e.value != null).map((e) => '${e.key}: ${e.value}').join('\n');
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr('dry run（作品は作っていません）', 'Dry run (no work was created)')),
        content: SingleChildScrollView(child: Text(lines, style: const TextStyle(fontSize: 10.5))),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(tr('閉じる', 'Close')))],
      ),
    );
  }

  Future<void> _deleteWork() async {
    if (!await showConfirmSheet(context, title: tr('この作品を削除しますか？', 'Delete this work?'), message: tr('元に戻せません', 'This can\'t be undone'), destructive: true)) return;
    try {
      await PostApi.delete(widget.workId!);
      if (!mounted) return;
      context.toast(tr('削除しました', 'Deleted'));
      context.pop('deleted');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final busy = _progress != null;
    // 送信中は閉じない。動画を選んだあとに閉じるときは確かめる
    final guardVideo = _isVideo && !_isEdit && _video != null;
    return PopScope(
      canPop: !busy && !guardVideo,
      onPopInvokedWithResult: (didPop, _) => _onBlockedPop(didPop, busy),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_isEdit
              ? (_isVideo ? tr('動画を編集', 'Edit video') : tr('作品を編集', 'Edit work'))
              : (_isText ? tr('文章を投稿', 'Post text') : (_isVideo ? tr('動画を投稿', 'Post video') : tr('作品を投稿', 'Post work')))),
          actions: [
            if (_isEdit && !_loading && _error == null)
              IconButton(tooltip: tr('削除', 'Delete'), onPressed: busy ? null : _deleteWork, icon: const Icon(Icons.delete_outline_rounded)),
          ],
        ),
        body: _loading
            ? const SkeletonList()
            : _error != null
                ? StateView.error(_error!, onRetry: _load)
                : Column(children: [
                    Expanded(child: _form(context)),
                    _submitBar(context, busy),
                  ]),
      ),
    );
  }

  Future<void> _onBlockedPop(bool didPop, bool busy) async {
    if (didPop) return;
    if (busy) {
      context.toast(tr('送信が終わるまでお待ちください', 'Please wait until sending finishes'));
      return;
    }
    final leave = await showConfirmSheet(
      context,
      title: tr('投稿せずに閉じますか？', 'Close without posting?'),
      message: tr('選んだ動画と入力した内容は消えます', 'The selected video and your input will be discarded'),
      confirmLabel: tr('閉じる', 'Close'),
      destructive: true,
    );
    if (!leave || !mounted) return;
    await _removeVideo();
    if (mounted) context.pop();
  }

  Widget _submitBar(BuildContext context, bool busy) {
    return Container(
      decoration: BoxDecoration(color: context.surfaceCard, border: Border(top: BorderSide(color: context.hairline))),
      padding: EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, Ds.s12 + MediaQuery.paddingOf(context).bottom),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        if (busy) ...[
          LinearProgressIndicator(value: _progress, minHeight: 4, borderRadius: Ds.br(2)),
          const SizedBox(height: Ds.s8),
        ],
        PrimaryButton(
          label: busy
              ? (_phase != null
                  ? '${videoPostPhaseLabel(_phase!)}… ${((_progress ?? 0) * 100).round()}%'
                  : tr('送信中… ${((_progress ?? 0) * 100).round()}%', 'Sending… ${((_progress ?? 0) * 100).round()}%'))
              : (_isEdit ? tr('保存する', 'Save') : (_draft.reservedAt != null ? tr('予約投稿する', 'Schedule') : tr('投稿する', 'Post'))),
          onPressed: busy ? null : _submit,
          loading: busy,
        ),
      ]),
    );
  }

  Widget _form(BuildContext context) {
    final options = _options!;
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, Ds.s32),
      children: [
        ContentWidth(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            if (_isVideo)
              ..._videoSection(context)
            else ...[
              _Label(_isText ? tr('表紙の画像', 'Cover image') : tr('画像（${_images.length}/$maxPostImages）', 'Images (${_images.length}/$maxPostImages)'),
                  hint: _isText ? null : tr('長押しで並べ替え。先頭がサムネイルになります', 'Long-press to reorder. The first image is the thumbnail')),
              _imageGrid(context),
            ],
            const SizedBox(height: Ds.s20),
            _Label(tr('タイトル', 'Title')),
            _Field(_title, hint: tr('タイトルを入力', 'Enter a title'), maxLength: maxTitleLength),
            const SizedBox(height: Ds.s16),
            _Label(tr('キャプション', 'Caption')),
            _Field(_caption, hint: tr('作品の説明', 'Describe your work'), maxLength: maxCaptionLength, lines: 4),
            if (_isText) ...[
              const SizedBox(height: Ds.s16),
              _Label(tr('本文', 'Text'), hint: tr('Markdown が使えます', 'Markdown supported')),
              _Field(_body, hint: tr('本文を入力', 'Enter the text'), lines: 12),
              const SizedBox(height: Ds.s16),
              _Label(tr('種類', 'Type')),
              Wrap(spacing: Ds.s8, children: [
                for (final t in {'NOVEL': tr('小説', 'Novel'), 'COLUMN': tr('コラム', 'Column')}.entries)
                  AppChip(t.value, selected: _draft.workType == t.key, onTap: () => setState(() => _draft.workType = t.key)),
              ]),
            ],
            const SizedBox(height: Ds.s20),
            _Label(tr('タグ（${_draft.tags.length}/$maxPostTags）', 'Tags (${_draft.tags.length}/$maxPostTags)')),
            _tags(context, options),
            // お題はタグのすぐ下（Web b015fb12c と同じ。タグ欄から離れていて使いにくかった）
            if (options.themes.isNotEmpty) ...[
              const SizedBox(height: Ds.s12),
              _Label(tr('お題に参加', 'Join a theme')),
              _Select(
                value: _draft.themeId,
                none: tr('参加しない', 'None'),
                items: [for (final t in options.themes) NamedOption(t.id, '${t.dateText}  ${t.title}')],
                title: tr('お題', 'Theme'),
                onChanged: (v) => setState(() => _draft.themeId = v),
              ),
            ],
            const SizedBox(height: Ds.s20),
            _Label(tr('年齢種別', 'Age rating')),
            _ratingNotice(context),
            const SizedBox(height: Ds.s20),
            // 動画の編集ではテイストを変えない（Web の animation.edit は元の style を送る）
            if (!(_isVideo && _isEdit)) ...[
              _Label(tr('テイスト', 'Style')),
              Wrap(spacing: Ds.s8, children: [
                for (final s in imageStyleLabels.entries)
                  AppChip(s.value, selected: _draft.imageStyle == s.key, onTap: () => setState(() => _draft.imageStyle = s.key)),
              ]),
              const SizedBox(height: Ds.s20),
            ],
            _Label(tr('公開範囲', 'Visibility')),
            Wrap(spacing: Ds.s8, runSpacing: Ds.s8, children: [
              for (final a in accessTypeLabels.entries)
                AppChip(a.value, selected: _draft.accessType == a.key, onTap: () => setState(() => _draft.accessType = a.key)),
            ]),
            const SizedBox(height: Ds.s20),
            _Label(tr('予約投稿', 'Schedule')),
            _Row(
              icon: Icons.schedule_rounded,
              label: _draft.reservedAt == null ? tr('今すぐ投稿', 'Post now') : _formatDate(_draft.reservedAt!),
              onTap: _pickReservation,
              onClear: _draft.reservedAt == null
                  ? null
                  : () => setState(() {
                        _draft.reservedAt = null;
                        _dropOutOfPeriodEvents();
                      }),
            ),
            // イベントは予約投稿の下（Web の PostFormItemDate の下と同じ）
            if (_events.isNotEmpty) ...[
              const SizedBox(height: Ds.s20),
              _Label(tr('イベント', 'Events'), hint: tr('「参加する」で参加タグが付きます', 'Turn on "Join" to add the entry tag')),
              for (final e in _events) ...[
                PostEventCard(
                  event: e,
                  attending: _draft.tags.contains(e.tag),
                  publishAt: eventPublishAt(_draft.reservedAt),
                  onChanged: (on) => _setAttending(e, on),
                ),
                const SizedBox(height: Ds.s8),
              ],
            ],
            const SizedBox(height: Ds.s20),
            _Label(tr('シリーズ', 'Series')),
            _Select(
              value: _draft.albumId,
              none: tr('追加しない', 'None'),
              items: options.albums,
              title: tr('シリーズ', 'Series'),
              onChanged: (v) => setState(() => _draft.albumId = v),
            ),
            if (!_isText) ...[
              const SizedBox(height: Ds.s20),
              _Label(tr('AI モデル', 'AI model')),
              _Select(
                value: _draft.modelId,
                none: tr('選択しない', 'None'),
                items: options.models,
                title: tr('AI モデル', 'AI model'),
                searchable: true,
                onAdd: _addModel,
                onChanged: (v) => setState(() => _draft.modelId = v),
              ),
              // 動画は生成情報を送らない（Web の toVideoWorkInput）
              if (!_isVideo) ...[
                const SizedBox(height: Ds.s8),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  shape: const Border(),
                  title: Text(tr('生成情報（プロンプトなど）', 'Generation info (prompts, etc.)'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                  initiallyExpanded: _prompt.text.isNotEmpty,
                  children: [
                    _Field(_prompt, hint: tr('プロンプト', 'Prompt'), lines: 3),
                    const SizedBox(height: Ds.s8),
                    _Field(_negative, hint: tr('ネガティブプロンプト', 'Negative prompt'), lines: 2),
                    const SizedBox(height: Ds.s8),
                    Row(children: [
                      Expanded(child: _Field(_seed, hint: 'Seed')),
                      const SizedBox(width: Ds.s8),
                      Expanded(child: _Field(_steps, hint: 'Steps')),
                    ]),
                    const SizedBox(height: Ds.s8),
                    _Field(_sampler, hint: 'Sampler'),
                    const SizedBox(height: Ds.s8),
                    _Field(_modelName, hint: tr('モデル名', 'Model name')),
                    _Switch(tr('生成情報を公開する', 'Show generation info'), _draft.publishParams, (v) => setState(() => _draft.publishParams = v)),
                  ],
                ),
              ],
            ],
            const SizedBox(height: Ds.s12),
            _Label(tr('その他', 'Other')),
            _Switch(tr('コメントを受け付ける', 'Allow comments'), _draft.isCommentEditable, (v) => setState(() => _draft.isCommentEditable = v)),
            _Switch(tr('他の人のタグ編集を許可する', 'Let others edit tags'), _draft.isTagEditable, (v) => setState(() => _draft.isTagEditable = v)),
            if (!_isEdit && !_isText && !_isVideo) _Switch(tr('AI に評価してもらう', 'Get AI feedback'), _draft.isBotGradingEnabled, (v) => setState(() => _draft.isBotGradingEnabled = v)),
            const SizedBox(height: Ds.s12),
            _Field(_link, hint: tr('関連リンク（任意）', 'Related link (optional)')),
          ]),
        ),
      ],
    );
  }

  List<Widget> _videoSection(BuildContext context) {
    final player = _player;
    final video = _video;
    final busy = _progress != null;
    final editingThumb = _editing?.json.strOrNull('largeThumbnailImageURL');
    return [
      _Label(tr('動画', 'Video'), hint: _isEdit ? tr('投稿した動画は差し替えられません（Web と同じ）', 'The posted video can\'t be replaced (same as the web)') : (player == null ? null : _videoLimitText())),
      if (player == null && !_isEdit)
        VideoPickPanel(limits: _videoLimits, onPick: _pickVideo, loading: _videoLoading)
      else if (player != null)
        VideoPreviewCard(
          controller: player,
          info: video == null ? null : '${formatVideoDuration(video.duration)} · ${formatVideoBytes(video.bytes)}',
          onReplace: _isEdit || busy ? null : _pickVideo,
          onRemove: _isEdit || busy ? null : _removeVideo,
        ),
      const SizedBox(height: Ds.s16),
      if (video != null || _isEdit) ...[
        _Label(tr('サムネイル', 'Thumbnail'), hint: video != null ? tr('一覧や共有で表示されます', 'Shown in lists and when shared') : null),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoThumbnailTile(image: _videoThumb, url: _videoThumb == null ? editingThumb : null, loading: _thumbLoading),
            const SizedBox(width: Ds.s12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (video != null)
                    VideoFrameStrip(path: video.path, duration: video.duration, value: _thumbAt, onScrub: _onScrub, onScrubEnd: _onScrubEnd)
                  else
                    Text(tr('今のサムネイルのまま保存します', 'The current thumbnail is kept'), style: TextStyle(fontSize: 12.5, color: context.muted)),
                  const SizedBox(height: Ds.s8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(onPressed: busy ? null : _pickThumbnailImage, icon: const Icon(Icons.image_outlined, size: 18), label: Text(tr('別の画像にする', 'Use another image'))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ];
  }

  Widget _ratingNotice(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Ds.s12),
      decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
      child: Text(
        _draft.rating == 'G'
            ? tr('全年齢（アプリからは全年齢の作品だけ投稿できます）', 'All ages (only all-ages works can be posted from the app)')
            : tr('${_draft.rating}（元の設定のまま保存します）', '${_draft.rating} (saved as is)'),
        style: TextStyle(fontSize: 13, color: context.muted),
      ),
    );
  }

  Widget _tags(BuildContext context, PostOptions options) {
    final suggestions = options.recentTags.where((t) => !_draft.tags.contains(t)).take(12).toList();
    final recommended = _recommendedTags.where((t) => !_draft.tags.contains(t) && !suggestions.contains(t)).take(16).toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (_draft.tags.isNotEmpty) ...[
        Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
          for (final t in _draft.tags)
            InputChip(
              label: Text('#$t'),
              visualDensity: VisualDensity.compact,
              onDeleted: () => setState(() => _draft.tags = _draft.tags.where((x) => x != t).toList()),
            ),
        ]),
        const SizedBox(height: Ds.s8),
      ],
      TextField(
        controller: _tag,
        textInputAction: TextInputAction.done,
        onSubmitted: _addTag,
        decoration: _decoration(context, tr('タグを入力して改行', 'Type a tag and press Enter')).copyWith(
          suffixIcon: IconButton(icon: const Icon(Icons.add_rounded), onPressed: () => _addTag(_tag.text)),
        ),
      ),
      if (suggestions.isNotEmpty) ...[
        const SizedBox(height: Ds.s8),
        Text(tr('最近使ったタグ', 'Recent tags'), style: TextStyle(fontSize: 12, color: context.muted)),
        const SizedBox(height: Ds.s4),
        Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
          for (final t in suggestions) AppChip(t, onTap: () => _addTag(t)),
        ]),
      ],
      // プロンプトからのおすすめタグ（Web と同じく最近使ったタグとは分けて出す。付けたタグ・最近使ったタグと重なるものは出さない）
      if (!_isText && !_isVideo) ...[
        const SizedBox(height: Ds.s8),
        Text(tr('おすすめタグ', 'Recommended tags'), style: TextStyle(fontSize: 12, color: context.muted)),
        const SizedBox(height: Ds.s4),
        if (recommended.isEmpty)
          Text(tr('プロンプトのある画像を読み込むと、おすすめのタグが出ます', 'Recommended tags appear when an image with a prompt is loaded'), style: TextStyle(fontSize: 11.5, color: context.muted))
        else
          Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
            for (final t in recommended) AppChip(t, onTap: () => _addTag(t)),
          ]),
      ],
    ]);
  }

  Widget _imageGrid(BuildContext context) {
    return SizedBox(
      height: 124,
      child: ReorderableListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length,
        onReorder: (from, to) {
          setState(() {
            if (to > from) to--;
            _images.insert(to, _images.removeAt(from));
          });
        },
        footer: Padding(
          padding: const EdgeInsets.only(right: Ds.s8),
          child: Pressable(
            onTap: _pick,
            child: Container(
              width: 110,
              decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_photo_alternate_outlined, color: context.muted),
                const SizedBox(height: Ds.s4),
                Text(tr('画像を選ぶ', 'Choose images'), style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
              ]),
            ),
          ),
        ),
        itemBuilder: (context, i) {
          final image = _images[i];
          return Padding(
            key: ObjectKey(image.key),
            padding: const EdgeInsets.only(right: Ds.s8),
            child: SizedBox(
              width: 110,
              child: Stack(fit: StackFit.expand, children: [
                ClipRRect(
                  borderRadius: Ds.br(12),
                  child: image.encoded != null
                      ? Image.memory(image.encoded!.bytes, fit: BoxFit.cover, cacheWidth: 300)
                      : AppImage(image.url, memCacheWidth: 300),
                ),
                if (i == 0) Positioned(left: 4, top: 4, child: Badge2(tr('サムネイル', 'Thumbnail'))),
                Positioned(
                  right: 2,
                  top: 2,
                  child: IconButton.filledTonal(
                    visualDensity: VisualDensity.compact,
                    iconSize: 16,
                    tooltip: tr('取り除く', 'Remove'),
                    onPressed: () => setState(() => _images.removeAt(i)),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${d.year}/${two(d.month)}/${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
  }
}

InputDecoration _decoration(BuildContext context, String hint) => InputDecoration(
      hintText: hint,
      counterText: '',
      filled: true,
      fillColor: context.skeleton,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide.none),
    );

class _Label extends StatelessWidget {
  const _Label(this.text, {this.hint});

  final String text;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Ds.s6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(text, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
        if (hint != null) Text(hint!, style: TextStyle(fontSize: 12, color: context.muted)),
      ]),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field(this.controller, {required this.hint, this.maxLength, this.lines = 1});

  final TextEditingController controller;
  final String hint;
  final int? maxLength;
  final int lines;

  @override
  Widget build(BuildContext context) {
    final field = TextField(
      controller: controller,
      minLines: lines,
      maxLines: lines == 1 ? 1 : lines + 8,
      maxLength: maxLength,
      decoration: _decoration(context, hint),
    );
    final max = maxLength;
    if (max == null) return field;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      field,
      const SizedBox(height: 4),
      ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) => PostCharCount(value.text.length, max),
      ),
    ]);
  }
}

/// 入力欄の下に出す「今の文字数/上限」（上限の 9 割でオレンジ、上限で赤）
class PostCharCount extends StatelessWidget {
  const PostCharCount(this.count, this.max, {super.key});

  final int count;
  final int max;

  static String _comma(int n) => n.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]},');

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = count >= max
        ? scheme.error
        : count >= max * 0.9
            ? Colors.orange
            : scheme.onSurfaceVariant;
    return Text(
      '${_comma(count)}/${_comma(max)}',
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: 12, color: color, fontFeatures: const [FontFeature.tabularFigures()]),
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch(this.label, this.value, this.onChanged);

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(label, style: const TextStyle(fontSize: 14)),
      value: value,
      onChanged: onChanged,
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.icon, required this.label, required this.onTap, this.onClear});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.skeleton,
      borderRadius: Ds.br(12),
      child: InkWell(
        borderRadius: Ds.br(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(children: [
            Icon(icon, size: 18, color: context.muted),
            const SizedBox(width: Ds.s8),
            Expanded(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14))),
            if (onClear != null)
              GestureDetector(onTap: onClear, child: Icon(Icons.close_rounded, size: 18, color: context.muted))
            else
              Icon(Icons.expand_more_rounded, size: 18, color: context.muted),
          ]),
        ),
      ),
    );
  }
}

/// 1 つ選ぶ（下から出るシート）
class _Select extends StatelessWidget {
  const _Select({required this.value, required this.none, required this.items, required this.title, required this.onChanged, this.searchable = false, this.onAdd});

  final String? value;
  final String none;
  final List<NamedOption> items;
  final String title;
  final bool searchable;
  final ValueChanged<String?> onChanged;

  /// 検索語が一覧にないとき「追加」を出す
  final Future<NamedOption?> Function(String name)? onAdd;

  @override
  Widget build(BuildContext context) {
    final current = items.where((i) => i.id == value).map((i) => i.name).firstOrNull;
    final onAdd = this.onAdd;
    return _Row(
      icon: Icons.tune_rounded,
      label: current ?? none,
      onTap: () async {
        final picked = await showModalBottomSheet<_Picked>(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          showDragHandle: true,
          backgroundColor: context.surfaceCard,
          builder: (_) => _SelectSheet(title: title, none: none, items: items, selected: value, searchable: searchable, onAdd: onAdd),
        );
        if (picked != null) onChanged(picked.id);
      },
    );
  }
}

class _Picked {
  const _Picked(this.id);

  final String? id;
}

class _SelectSheet extends StatefulWidget {
  const _SelectSheet({required this.title, required this.none, required this.items, required this.selected, required this.searchable, this.onAdd});

  final String title;
  final String none;
  final List<NamedOption> items;
  final String? selected;
  final bool searchable;
  final Future<NamedOption?> Function(String name)? onAdd;

  @override
  State<_SelectSheet> createState() => _SelectSheetState();
}

class _SelectSheetState extends State<_SelectSheet> {
  String _q = '';
  bool _adding = false;

  Future<void> _add(String name) async {
    setState(() => _adding = true);
    final added = await widget.onAdd!(name);
    if (!mounted) return;
    setState(() => _adding = false);
    if (added != null) Navigator.pop(context, _Picked(added.id));
  }

  @override
  Widget build(BuildContext context) {
    // 検索は表記ゆれ（大文字小文字・全角半角・空白・記号）を無視する（Web の filterAiModels と同じ）
    final items = _q.isEmpty ? widget.items : filterAiModels(widget.items, _q);
    final newName = _q.trim().replaceAll(RegExp(r'\s+'), ' ');
    final addable = widget.onAdd != null && canAddAiModel(widget.items, newName);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s8),
          child: Text(widget.title, style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
        ),
        if (widget.searchable)
          Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s16, 0, Ds.s16, Ds.s8),
            child: TextField(onChanged: (v) => setState(() => _q = v), decoration: _decoration(context, tr('検索', 'Search'))),
          ),
        Expanded(
          child: ListView(children: [
            if (addable)
              ListTile(
                leading: _adding ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.add_rounded),
                title: Text(tr('「$newName」を追加', 'Add "$newName"'), maxLines: 2, overflow: TextOverflow.ellipsis),
                subtitle: Text(
                  tr('一覧にないモデルは名前を入れて追加できます。追加したモデルはみんなの一覧にも出ます。', 'If your model is not listed, type its name to add it. Added models appear in everyone\'s list.'),
                  style: TextStyle(fontSize: 11.5, color: context.muted),
                ),
                onTap: _adding ? null : () => _add(newName),
              ),
            ListTile(title: Text(widget.none), selected: widget.selected == null, onTap: () => Navigator.pop(context, const _Picked(null))),
            for (final i in items)
              ListTile(
                title: Text(i.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                selected: i.id == widget.selected,
                onTap: () => Navigator.pop(context, _Picked(i.id)),
              ),
          ]),
        ),
      ]),
    );
  }
}
