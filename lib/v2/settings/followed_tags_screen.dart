import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// お気に入りタグは Web と同じく 20 個まで
const maxFollowedTags = 20;

/// 入力の候補に出すタグ（Web の FollowedTagEditor と同じ: 20 文字まで、登録済みを除いて 6 つ）
List<String> followedTagSuggestions(Iterable<String> names, List<String> followed) {
  final seen = <String>{};
  return names.where((n) => n.isNotEmpty && n.length <= 20 && !followed.contains(n) && seen.add(n)).take(6).toList();
}

/// お気に入りタグ（Web の /settings/followed/tags）
class FollowedTagsScreen extends StatefulWidget {
  const FollowedTagsScreen({super.key});

  @override
  State<FollowedTagsScreen> createState() => _FollowedTagsScreenState();
}

class _FollowedTagsScreenState extends State<FollowedTagsScreen> {
  final _input = TextEditingController();
  List<String>? _tags;
  String? _error;
  bool _busy = false;
  Timer? _debounce;
  List<String> _suggestions = const [];
  List<({String name, String? thumbnail})> _recommended = const [];

  /// この画面で足したおすすめは消さずにチェックを付けて残す
  final _added = <String>{};

  @override
  void initState() {
    super.initState();
    _load();
    _loadRecommended();
    _input.addListener(_onInput);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _input.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final tags = await SettingsApi.followedTags(0, maxFollowedTags);
      if (mounted) {
        setState(() {
          _tags = tags;
          _error = null;
        });
      }
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _loadRecommended() async {
    try {
      final data = await Api.query(r'''
query AppRecommendedFollowTags {
  recommendedTags(limit: 16, where: { isSensitive: false }) { tagName thumbnailUrl }
}''', cacheFor: const Duration(minutes: 10));
      if (!mounted) return;
      setState(() => _recommended = [
            for (final t in data.list('recommendedTags'))
              if (t.str('tagName').isNotEmpty) (name: t.str('tagName'), thumbnail: t.strOrNull('thumbnailUrl')),
          ]);
    } catch (_) {
      // おすすめは無くても使える
    }
  }

  void _onInput() {
    setState(() {});
    _debounce?.cancel();
    final text = _input.text.trim().replaceFirst(RegExp(r'^#'), '');
    if (text.isEmpty) {
      setState(() => _suggestions = const []);
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 250), () async {
      try {
        final data = await Api.query(r'''
query AppFollowedTagSearch($search: String!) {
  tags(limit: 12, offset: 0, where: { search: $search }) { id name }
}''', variables: {'search': text}, cacheFor: const Duration(minutes: 5));
        if (!mounted || _input.text.trim().replaceFirst(RegExp(r'^#'), '') != text) return;
        setState(() => _suggestions = followedTagSuggestions(data.list('tags').map((t) => t.str('name')), _tags ?? const []));
      } catch (_) {}
    });
  }

  bool get _isFull => (_tags?.length ?? 0) >= maxFollowedTags;

  Future<void> _add(String raw) async {
    final name = raw.trim().replaceFirst(RegExp(r'^#'), '');
    if (name.isEmpty || _busy) return;
    if (_tags?.contains(name) ?? false) {
      context.toast(tr('登録済みのタグです', 'Already added'));
      return;
    }
    if (_isFull) return;
    setState(() => _busy = true);
    try {
      await SettingsApi.followTag(name, true);
      Api.clearCache();
      _input.clear();
      setState(() {
        _tags = [...?_tags, name];
        _added.add(name);
        _suggestions = const [];
      });
      Ds.success();
      if (mounted) context.toast(tr('#$name を追加しました', 'Added #$name'));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// 返事を待たずに消し、「元に戻す」を出す
  Future<void> _remove(String name) async {
    final before = _tags;
    setState(() => _tags = [...?_tags]..remove(name));
    try {
      await SettingsApi.followTag(name, false);
      Api.clearCache();
      if (!mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(tr('#$name を解除しました', 'Removed #$name')),
        action: SnackBarAction(label: tr('元に戻す', 'Undo'), onPressed: () => _undo(name)),
      ));
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _tags = before);
      context.toast(e.message, error: true);
    }
  }

  Future<void> _undo(String name) async {
    try {
      await SettingsApi.followTag(name, true);
      Api.clearCache();
      if (mounted && !(_tags?.contains(name) ?? true)) setState(() => _tags = [...?_tags, name]);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message.isEmpty ? tr('戻せませんでした', 'Failed') : e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tags = _tags;
    return Scaffold(
      appBar: AppBar(title: Text(tr('お気に入りタグ', 'Favorite tags'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: tags == null
          ? (_error != null
              ? Center(child: StateView.error(_error!, onRetry: _load))
              : const Padding(padding: EdgeInsets.all(Ds.s16), child: Column(children: [Skeleton(height: 110, radius: 18), SizedBox(height: Ds.s16), Skeleton(height: 52, radius: 14)])))
          : AppRefresh(
              onRefresh: _load,
              child: ContentWidth(
                child: ListView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, 60),
                  children: [
                    _summary(context, tags.length),
                    const SizedBox(height: Ds.s16),
                    _editor(context),
                    const SizedBox(height: Ds.s24),
                    Text(tr('登録中のタグ', 'Your tags'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
                    const SizedBox(height: Ds.s8),
                    if (tags.isEmpty)
                      Container(
                        padding: const EdgeInsets.all(Ds.s24),
                        decoration: BoxDecoration(borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
                        child: Text(
                          tr('まだ登録していません。上から好きなタグを追加してみましょう', 'No tags yet. Add one you like above.'),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: context.muted, fontSize: 13),
                        ),
                      )
                    else
                      for (final t in tags) Padding(padding: const EdgeInsets.only(bottom: Ds.s12), child: _FollowedTagCard(key: ValueKey(t), name: t, onRemove: () => _remove(t))),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _summary(BuildContext context, int count) {
    return Container(
      padding: const EdgeInsets.all(Ds.s16),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          count == 0 ? tr('好きなタグを集めよう', 'Collect tags you love') : tr('$count 個のタグをお気に入り中', 'Following $count tags'),
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
        ),
        const SizedBox(height: Ds.s4),
        Text(
          tr('登録したタグの新しい作品が、ホームの「タグ新着」に届きます。', 'New works with your favorite tags appear in the Tags tab on Home.'),
          style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.45),
        ),
        const SizedBox(height: Ds.s8),
        Row(children: [
          Expanded(
            child: ClipRRect(
              borderRadius: Ds.br(99),
              child: LinearProgressIndicator(value: (count / maxFollowedTags).clamp(0, 1).toDouble(), minHeight: 8, backgroundColor: context.skeleton),
            ),
          ),
          const SizedBox(width: Ds.s8),
          Text('$count / $maxFollowedTags', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12, fontFeatures: [FontFeature.tabularFigures()])),
        ]),
      ]),
    );
  }

  Widget _editor(BuildContext context) {
    final text = _input.text.trim();
    final followed = _tags ?? const <String>[];
    final recommended = _recommended.where((t) => !followed.contains(t.name) || _added.contains(t.name)).take(12).toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Expanded(
          child: TextField(
            controller: _input,
            enabled: !_isFull,
            maxLength: 40,
            textInputAction: TextInputAction.done,
            onSubmitted: _add,
            decoration: settingsField(
              context,
              _isFull ? tr('登録できるのは $maxFollowedTags 個までです', 'Up to $maxFollowedTags tags') : tr('好きなタグを探す', 'Find a tag you like'),
              prefix: '#',
            ).copyWith(counterText: ''),
          ),
        ),
        const SizedBox(width: Ds.s8),
        FilledButton.icon(
          onPressed: _isFull || _busy || text.isEmpty ? null : () => _add(_input.text),
          icon: const Icon(Icons.add_rounded, size: 18),
          label: Text(tr('追加', 'Add')),
        ),
      ]),
      if (text.isNotEmpty && _suggestions.isNotEmpty) ...[
        const SizedBox(height: Ds.s8),
        Wrap(spacing: Ds.s8, runSpacing: Ds.s8, children: [
          for (final name in _suggestions) AppChip(name, icon: Icons.add_rounded, onTap: _isFull || _busy ? null : () => _add(name)),
        ]),
      ],
      if (text.isEmpty && recommended.isNotEmpty) ...[
        const SizedBox(height: Ds.s12),
        Text(tr('人気のタグ・押すだけで追加できます', 'Popular tags · tap to add'), style: TextStyle(color: context.muted, fontWeight: FontWeight.w600, fontSize: 12)),
        const SizedBox(height: Ds.s8),
        GridView.count(
          crossAxisCount: MediaQuery.sizeOf(context).width >= 600 ? 4 : 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: Ds.s8,
          crossAxisSpacing: Ds.s8,
          children: [
            for (final t in recommended)
              _RecommendedTile(
                name: t.name,
                thumbnail: t.thumbnail,
                added: followed.contains(t.name),
                onTap: followed.contains(t.name) || _isFull || _busy ? null : () => _add(t.name),
              ),
          ],
        ),
      ],
    ]);
  }
}

class _RecommendedTile extends StatelessWidget {
  const _RecommendedTile({required this.name, required this.thumbnail, required this.added, required this.onTap});

  final String name;
  final String? thumbnail;
  final bool added;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: AnimatedScale(
        scale: added ? 0.96 : 1,
        duration: Ds.fast,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Ds.br(16),
            color: context.skeleton,
            border: added ? Border.all(color: context.cs.primary, width: 3) : null,
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(fit: StackFit.expand, children: [
            AppImage(thumbnail, memCacheWidth: 320),
            const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.center, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black87]))),
            Positioned(
              left: 6,
              right: 6,
              bottom: 6,
              child: Text('#$name', maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(shape: BoxShape.circle, color: added ? context.cs.primary : Colors.black45),
                child: Icon(added ? Icons.check_rounded : Icons.add_rounded, size: 15, color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

/// お気に入りタグのカード。新しい作品を 3 つ見せる（Web の FollowedTag）
class _FollowedTagCard extends StatefulWidget {
  const _FollowedTagCard({super.key, required this.name, required this.onRemove});

  final String name;
  final VoidCallback onRemove;

  @override
  State<_FollowedTagCard> createState() => _FollowedTagCardState();
}

class _FollowedTagCardState extends State<_FollowedTagCard> {
  List<String?>? _thumbs;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(r'''
query AppFollowedTagLatestWorks($where: WorksWhereInput!) {
  tagWorks(limit: 3, offset: 0, where: $where) { id smallThumbnailImageURL }
}''', variables: {
        'where': {
          'tagNames': [widget.name],
          'ratings': ['G', if (AppContentFilter.showR15) 'R15'],
          'isNowCreatedAt': true,
        },
      }, cacheFor: const Duration(minutes: 5));
      if (mounted) setState(() => _thumbs = data.list('tagWorks').map((w) => w.strOrNull('smallThumbnailImageURL')).toList());
    } catch (_) {
      if (mounted) setState(() => _thumbs = const []);
    }
  }

  @override
  Widget build(BuildContext context) {
    final thumbs = _thumbs;
    return Pressable(
      scale: 0.98,
      onTap: () => Nav.tag(context, widget.name),
      child: Container(
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
        clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 92,
              child: Row(children: [
                for (var i = 0; i < 3; i++) ...[
                  if (i > 0) const SizedBox(width: 1),
                  Expanded(
                    child: thumbs != null && i < thumbs.length
                        ? AppImage(thumbs[i], memCacheWidth: 240)
                        : ColoredBox(color: context.skeleton),
                  ),
                ],
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(Ds.s12, Ds.s8, Ds.s12, Ds.s8),
              child: Row(children: [
                Text('#', style: TextStyle(color: context.muted, fontWeight: FontWeight.w800)),
                Flexible(child: Text(widget.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14))),
                if (thumbs != null && thumbs.isEmpty) ...[
                  const SizedBox(width: Ds.s8),
                  Text(tr('まだ作品がありません', 'No works yet'), style: TextStyle(color: context.muted, fontSize: 12)),
                ],
              ]),
            ),
          ]),
          Positioned(
            top: 6,
            right: 6,
            child: Material(
              color: Colors.black54,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: widget.onRemove,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(Icons.close_rounded, size: 17, color: Colors.white, semanticLabel: tr('#${widget.name} を解除', 'Remove #${widget.name}')),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
