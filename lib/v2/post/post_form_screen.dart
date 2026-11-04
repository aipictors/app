import 'dart:convert';
import 'dart:typed_data';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

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
  const PostFormScreen({super.key, this.workId, this.workType = 'WORK', this.debugImages, this.debugAutoSubmit = false});

  final String? workId;
  final String workType;

  /// デバッグでピッカーを通さずに試すための画像
  final List<Uint8List>? debugImages;
  final bool debugAutoSubmit;

  @override
  State<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  PostDraft _draft = PostDraft();
  EditingWork? _editing;
  PostOptions? _options;
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

  bool get _isEdit => widget.workId != null;

  bool get _isText => _draft.workType != 'WORK';

  @override
  void initState() {
    super.initState();
    _draft.workType = widget.workType;
    _load();
  }

  @override
  void dispose() {
    for (final c in [_title, _caption, _tag, _link, _body, _prompt, _negative, _seed, _sampler, _steps, _modelName]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final options = await PostApi.options();
      if (_isEdit) {
        final editing = await PostApi.loadForEdit(widget.workId!);
        if (editing == null) throw const ApiException('作品が見つかりませんでした');
        _editing = editing;
        _draft = PostApi.draftFrom(editing);
        if (_draft.rating == 'R18' || _draft.rating == 'R18G') {
          throw const ApiException('この作品はアプリから編集できません');
        }
        _images
          ..clear()
          ..addAll(editing.imageUrls.map(PostImage.remote));
        _fillControllers();
        if (editing.mdUrl != null) {
          final res = await http.get(Uri.parse(editing.mdUrl!));
          if (res.statusCode == 200) _body.text = utf8.decode(res.bodyBytes, allowMalformed: true);
        }
      }
      for (final bytes in widget.debugImages ?? const <Uint8List>[]) {
        _images.add(PostImage.local(await ImageTools.normalize(bytes)));
      }
      if (widget.debugAutoSubmit) _debugFill();
      if (!mounted) return;
      setState(() {
        _options = options;
        _loading = false;
      });
      if (widget.debugAutoSubmit) WidgetsBinding.instance.addPostFrameCallback((_) => _submit());
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _error = e.message;
          _loading = false;
        });
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
      context.toast(_isText ? '表紙は 1 枚です' : '最大$maxPostImages枚までです', error: true);
      return;
    }
    final List<XFile> files;
    try {
      files = await pickSystemImages(multiple: !_isText);
    } catch (_) {
      if (mounted) context.toast('写真を開けませんでした', error: true);
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
    if (failed > 0) context.toast('$failed枚は読み込めませんでした（32MB まで）', error: true);
    if (files.length > room) context.toast('最大$maxPostImages枚までです');
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
      context.toast('タグは$maxPostTags個までです', error: true);
      return;
    }
    setState(() {
      _draft.tags = [..._draft.tags, tag];
      _tag.clear();
    });
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
      context.toast('これからの日時を選んでください', error: true);
      return;
    }
    setState(() => _draft.reservedAt = picked);
  }

  Future<void> _submit() async {
    if (_progress != null) return;
    if (!Nav.requireLogin(context)) return;
    _readControllers();
    if (_tag.text.trim().isNotEmpty) _addTag(_tag.text);
    final invalid = PostApi.validate(_draft, _images);
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
      context.toast(_isEdit ? '作品を更新しました' : '作品を投稿しました');
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
      context.toast('投稿に失敗しました。もう一度お試しください', error: true);
    }
  }

  Future<void> _showDryRun() {
    final input = PostApi.lastDryRunInput ?? const {};
    final lines = input.entries.where((e) => e.value != null).map((e) => '${e.key}: ${e.value}').join('\n');
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('dry run（作品は作っていません）'),
        content: SingleChildScrollView(child: Text(lines, style: const TextStyle(fontSize: 10.5))),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('閉じる'))],
      ),
    );
  }

  Future<void> _deleteWork() async {
    if (!await showConfirmSheet(context, title: 'この作品を削除しますか？', message: '元に戻せません', destructive: true)) return;
    try {
      await PostApi.delete(widget.workId!);
      if (!mounted) return;
      context.toast('削除しました');
      context.pop('deleted');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final busy = _progress != null;
    return PopScope(
      canPop: !busy,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_isEdit ? '作品を編集' : (_isText ? '文章を投稿' : '作品を投稿')),
          actions: [
            if (_isEdit && !_loading && _error == null)
              IconButton(tooltip: '削除', onPressed: busy ? null : _deleteWork, icon: const Icon(Icons.delete_outline_rounded)),
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
          label: busy ? '送信中… ${((_progress ?? 0) * 100).round()}%' : (_isEdit ? '保存する' : (_draft.reservedAt != null ? '予約投稿する' : '投稿する')),
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
            _Label(_isText ? '表紙の画像' : '画像（${_images.length}/$maxPostImages）', hint: _isText ? null : '長押しで並べ替え。先頭がサムネイルになります'),
            _imageGrid(context),
            const SizedBox(height: Ds.s20),
            const _Label('タイトル'),
            _Field(_title, hint: 'タイトルを入力', maxLength: maxTitleLength),
            const SizedBox(height: Ds.s16),
            const _Label('キャプション'),
            _Field(_caption, hint: '作品の説明', maxLength: maxCaptionLength, lines: 4),
            if (_isText) ...[
              const SizedBox(height: Ds.s16),
              const _Label('本文', hint: 'Markdown が使えます'),
              _Field(_body, hint: '本文を入力', lines: 12),
              const SizedBox(height: Ds.s16),
              const _Label('種類'),
              Wrap(spacing: Ds.s8, children: [
                for (final t in const {'NOVEL': '小説', 'COLUMN': 'コラム'}.entries)
                  AppChip(t.value, selected: _draft.workType == t.key, onTap: () => setState(() => _draft.workType = t.key)),
              ]),
            ],
            const SizedBox(height: Ds.s20),
            _Label('タグ（${_draft.tags.length}/$maxPostTags）'),
            _tags(context, options),
            const SizedBox(height: Ds.s20),
            const _Label('年齢種別'),
            _ratingNotice(context),
            const SizedBox(height: Ds.s20),
            const _Label('テイスト'),
            Wrap(spacing: Ds.s8, children: [
              for (final s in imageStyleLabels.entries)
                AppChip(s.value, selected: _draft.imageStyle == s.key, onTap: () => setState(() => _draft.imageStyle = s.key)),
            ]),
            const SizedBox(height: Ds.s20),
            const _Label('公開範囲'),
            Wrap(spacing: Ds.s8, runSpacing: Ds.s8, children: [
              for (final a in accessTypeLabels.entries)
                AppChip(a.value, selected: _draft.accessType == a.key, onTap: () => setState(() => _draft.accessType = a.key)),
            ]),
            const SizedBox(height: Ds.s20),
            const _Label('予約投稿'),
            _Row(
              icon: Icons.schedule_rounded,
              label: _draft.reservedAt == null ? '今すぐ投稿' : _formatDate(_draft.reservedAt!),
              onTap: _pickReservation,
              onClear: _draft.reservedAt == null ? null : () => setState(() => _draft.reservedAt = null),
            ),
            if (options.themes.isNotEmpty) ...[
              const SizedBox(height: Ds.s20),
              const _Label('お題'),
              _Select(
                value: _draft.themeId,
                none: '参加しない',
                items: [for (final t in options.themes) NamedOption(t.id, '${t.dateText}  ${t.title}')],
                title: 'お題',
                onChanged: (v) => setState(() => _draft.themeId = v),
              ),
            ],
            const SizedBox(height: Ds.s20),
            const _Label('シリーズ'),
            _Select(
              value: _draft.albumId,
              none: '追加しない',
              items: options.albums,
              title: 'シリーズ',
              onChanged: (v) => setState(() => _draft.albumId = v),
            ),
            if (!_isText) ...[
              const SizedBox(height: Ds.s20),
              const _Label('AI モデル'),
              _Select(
                value: _draft.modelId,
                none: '選択しない',
                items: options.models,
                title: 'AI モデル',
                searchable: true,
                onChanged: (v) => setState(() => _draft.modelId = v),
              ),
              const SizedBox(height: Ds.s8),
              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                shape: const Border(),
                title: const Text('生成情報（プロンプトなど）', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                initiallyExpanded: _prompt.text.isNotEmpty,
                children: [
                  _Field(_prompt, hint: 'プロンプト', lines: 3),
                  const SizedBox(height: Ds.s8),
                  _Field(_negative, hint: 'ネガティブプロンプト', lines: 2),
                  const SizedBox(height: Ds.s8),
                  Row(children: [
                    Expanded(child: _Field(_seed, hint: 'Seed')),
                    const SizedBox(width: Ds.s8),
                    Expanded(child: _Field(_steps, hint: 'Steps')),
                  ]),
                  const SizedBox(height: Ds.s8),
                  _Field(_sampler, hint: 'Sampler'),
                  const SizedBox(height: Ds.s8),
                  _Field(_modelName, hint: 'モデル名'),
                  _Switch('生成情報を公開する', _draft.publishParams, (v) => setState(() => _draft.publishParams = v)),
                ],
              ),
            ],
            const SizedBox(height: Ds.s12),
            const _Label('その他'),
            _Switch('コメントを受け付ける', _draft.isCommentEditable, (v) => setState(() => _draft.isCommentEditable = v)),
            _Switch('他の人のタグ編集を許可する', _draft.isTagEditable, (v) => setState(() => _draft.isTagEditable = v)),
            if (!_isEdit && !_isText) _Switch('AI に評価してもらう', _draft.isBotGradingEnabled, (v) => setState(() => _draft.isBotGradingEnabled = v)),
            const SizedBox(height: Ds.s12),
            _Field(_link, hint: '関連リンク（任意）'),
          ]),
        ),
      ],
    );
  }

  Widget _ratingNotice(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Ds.s12),
      decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
      child: Text(
        _draft.rating == 'G' ? '全年齢（アプリからは全年齢の作品だけ投稿できます）' : '${_draft.rating}（元の設定のまま保存します）',
        style: TextStyle(fontSize: 13, color: context.muted),
      ),
    );
  }

  Widget _tags(BuildContext context, PostOptions options) {
    final suggestions = options.recentTags.where((t) => !_draft.tags.contains(t)).take(12).toList();
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
        decoration: _decoration(context, 'タグを入力して改行').copyWith(
          suffixIcon: IconButton(icon: const Icon(Icons.add_rounded), onPressed: () => _addTag(_tag.text)),
        ),
      ),
      if (suggestions.isNotEmpty) ...[
        const SizedBox(height: Ds.s8),
        Text('最近使ったタグ', style: TextStyle(fontSize: 12, color: context.muted)),
        const SizedBox(height: Ds.s4),
        Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
          for (final t in suggestions) AppChip(t, onTap: () => _addTag(t)),
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
                Text('画像を選ぶ', style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
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
                if (i == 0) const Positioned(left: 4, top: 4, child: Badge2('サムネイル')),
                Positioned(
                  right: 2,
                  top: 2,
                  child: IconButton.filledTonal(
                    visualDensity: VisualDensity.compact,
                    iconSize: 16,
                    tooltip: '取り除く',
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
    return TextField(
      controller: controller,
      minLines: lines,
      maxLines: lines == 1 ? 1 : lines + 8,
      maxLength: maxLength,
      decoration: _decoration(context, hint),
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
  const _Select({required this.value, required this.none, required this.items, required this.title, required this.onChanged, this.searchable = false});

  final String? value;
  final String none;
  final List<NamedOption> items;
  final String title;
  final bool searchable;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final current = items.where((i) => i.id == value).map((i) => i.name).firstOrNull;
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
          builder: (_) => _SelectSheet(title: title, none: none, items: items, selected: value, searchable: searchable),
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
  const _SelectSheet({required this.title, required this.none, required this.items, required this.selected, required this.searchable});

  final String title;
  final String none;
  final List<NamedOption> items;
  final String? selected;
  final bool searchable;

  @override
  State<_SelectSheet> createState() => _SelectSheetState();
}

class _SelectSheetState extends State<_SelectSheet> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final items = _q.isEmpty ? widget.items : widget.items.where((i) => i.name.toLowerCase().contains(_q.toLowerCase())).toList();
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
            child: TextField(onChanged: (v) => setState(() => _q = v), decoration: _decoration(context, '検索')),
          ),
        Expanded(
          child: ListView(children: [
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
