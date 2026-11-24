import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/my/my_filters.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

/// 投稿の種類を選んでフォームを開く
Future<void> openNewPost(BuildContext context) async {
  if (!Nav.requireLogin(context)) return;
  final path = await showModalBottomSheet<String>(
    context: context,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (context) => SafeArea(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(leading: const Icon(Icons.image_outlined), title: Text(tr('画像を投稿', 'Post an image')), onTap: () => Navigator.pop(context, '/works/create')),
        ListTile(leading: const Icon(Icons.movie_outlined), title: Text(tr('動画を投稿', 'Post a video')), onTap: () => Navigator.pop(context, '/works/create/video')),
        ListTile(leading: const Icon(Icons.article_outlined), title: Text(tr('小説・コラムを投稿', 'Post a novel or column')), onTap: () => Navigator.pop(context, '/works/create/text')),
        const SizedBox(height: Ds.s8),
      ]),
    ),
  );
  if (path != null && context.mounted) context.push(path);
}

/// 自分の作品の管理（Web の my.posts）
class MyPostsScreen extends StatefulWidget {
  const MyPostsScreen({super.key});

  @override
  State<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  final _query = MyPostsQuery();
  String? _userId;
  int? _count;
  int _countSeq = 0;

  /// 選んで消すモード（Web の「選択」）
  bool _selecting = false;
  final Set<String> _selected = {};
  (int, int)? _deleting;

  late final _controller = PagedController<Map<String, dynamic>>(
    pageSize: 24,
    idOf: (w) => w.str('id'),
    fetch: (offset, limit) async {
      _userId ??= (await Api.query('query AppViewerId { viewer { id user { id } } }', cacheFor: const Duration(minutes: 10))).obj('viewer')?.obj('user')?.str('id');
      final where = _query.where(_userId);
      if (offset == 0) _loadCount(where, ++_countSeq);
      final data = await Api.query(r'''
query AppMyWorks($offset: Int!, $limit: Int!, $where: WorksWhereInput) {
  works(offset: $offset, limit: $limit, where: $where) {
    id uuid title type rating accessType createdAt isPromotion likesCount bookmarksCount commentsCount viewsCount smallThumbnailImageURL
  }
}''', variables: {'offset': offset, 'limit': limit, 'where': where});
      return data.list('works');
    },
  );

  /// 条件に合う件数（Web の「n件の作品」）
  Future<void> _loadCount(Map<String, dynamic> where, int seq) async {
    try {
      final data = await Api.query(r'query AppMyWorksCount($where: WorksWhereInput) { worksCount(where: $where) }', variables: {'where': where});
      // 条件を変えたあとに前の件数が届いたら捨てる
      if (mounted && seq == _countSeq) setState(() => _count = data.integer('worksCount'));
    } on ApiException {
      // 件数が取れなくても一覧は出す
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.loadMore();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _exitSelect() {
    _selecting = false;
    _selected.clear();
  }

  void _reload() {
    setState(() {
      _count = null;
      _selected.clear();
    });
    _controller.refresh();
  }

  Future<void> _edit(Map<String, dynamic> w) async {
    // 動画も同じフォームで開く（type が VIDEO なら動画の編集になる。Web の /posts/:id/animation/edit）
    final result = await context.push('/works/${w.str('id')}/update');
    if (result != null) _reload();
  }

  Future<void> _delete(Map<String, dynamic> w) async {
    if (!await showConfirmSheet(context, title: tr('「${w.str('title')}」を削除しますか？', 'Delete "${w.str('title')}"?'), message: tr('元に戻せません', 'This can\'t be undone'), destructive: true)) return;
    try {
      await PostApi.delete(w.str('id'));
      _controller.removeWhere((x) => x.str('id') == w.str('id'));
      if (mounted) {
        setState(() => _count = _count == null ? null : _count! - 1);
        context.toast(tr('削除しました', 'Deleted'));
      }
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  Future<void> _copyUrl(String url) async {
    await Clipboard.setData(ClipboardData(text: url));
    if (mounted) context.toast(tr('URLをコピーしました', 'URL copied'));
  }

  /// 選んだ作品をまとめて削除する。サーバーの負荷を避けて 1 件ずつ（Web の works-list と同じ）
  Future<void> _deleteSelected() async {
    final targets = _controller.items.where((w) => _selected.contains(w.str('id'))).toList();
    if (targets.isEmpty) return;
    final ok = await showConfirmSheet(
      context,
      title: tr('${targets.length}件の作品を削除しますか？', 'Delete ${targets.length} works?'),
      message: tr('元に戻せません', 'This can\'t be undone'),
      confirmLabel: tr('削除する', 'Delete'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    final deleted = <String>[];
    setState(() => _deleting = (0, targets.length));
    for (final w in targets) {
      try {
        await PostApi.delete(w.str('id'));
        deleted.add(w.str('id'));
      } on ApiException {
        // 消せなかったものは残す
      }
      if (mounted) setState(() => _deleting = (deleted.length, targets.length));
    }
    _controller.removeWhere((x) => deleted.contains(x.str('id')));
    if (!mounted) return;
    setState(() {
      _deleting = null;
      _selecting = false;
      _selected.clear();
      if (_count != null) _count = _count! - deleted.length;
    });
    context.toast(deleted.length == targets.length
        ? tr('${deleted.length}件の作品を削除しました。反映まで少しかかることがあります。', 'Deleted ${deleted.length} works')
        : tr('${deleted.length}件を削除しました（${targets.length - deleted.length}件は削除できませんでした）', 'Deleted ${deleted.length} works (${targets.length - deleted.length} failed)'));
  }

  Future<void> _pickSort() async {
    final picked = await showChoiceSheet<WorkSortOption>(context, title: tr('並び順', 'Sort'), options: [for (final o in myWorkSortOptions) (o, o.label)], selected: _query.sort);
    if (picked == null) return;
    _query.sort = picked.$1;
    _reload();
  }

  Future<void> _pickWorkType() async {
    final picked = await showChoiceSheet<String?>(context, title: tr('種類', 'Type'), options: myPostWorkTypes, selected: _query.workType);
    if (picked == null) return;
    _query.workType = picked.$1;
    _reload();
  }

  Future<void> _pickRating() async {
    final picked = await showChoiceSheet<String?>(context, title: tr('年齢制限', 'Rating'), options: myRatingFilters, selected: _query.rating);
    if (picked == null) return;
    _query.rating = picked.$1;
    _reload();
  }

  String _labelOf(List<(String?, String)> options, String? value) => options.firstWhere((o) => o.$1 == value, orElse: () => options.first).$2;

  @override
  Widget build(BuildContext context) {
    final tabs = myPostAccessTabs;
    final deleting = _deleting;
    return PopScope(
      canPop: !_selecting && deleting == null,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && deleting == null) setState(_exitSelect);
      },
      child: Scaffold(
        appBar: _selecting
            ? AppBar(
                leading: IconButton(
                  tooltip: tr('やめる', 'Cancel'),
                  onPressed: deleting != null ? null : () => setState(_exitSelect),
                  icon: const Icon(Icons.close_rounded),
                ),
                title: Text(tr('${_selected.length}件を選択中', '${_selected.length} selected')),
                actions: [
                  TextButton(
                    onPressed: deleting != null
                        ? null
                        : () => setState(() {
                              final all = _controller.items.every((w) => _selected.contains(w.str('id')));
                              _selected.clear();
                              if (!all) _selected.addAll(_controller.items.map((w) => w.str('id')));
                            }),
                    child: Text(_controller.items.isNotEmpty && _controller.items.every((w) => _selected.contains(w.str('id'))) ? tr('選択を解除', 'Clear') : tr('すべて選択', 'Select all')),
                  ),
                ],
              )
            : AppBar(
                title: Text(tr('自分の作品', 'My works')),
                actions: [
                  IconButton(tooltip: tr('選択', 'Select'), onPressed: _controller.items.isEmpty ? null : () => setState(() => _selecting = true), icon: const Icon(Icons.checklist_rounded)),
                ],
              ),
        floatingActionButton: _selecting
            ? null
            : FloatingActionButton.extended(
                onPressed: () => openNewPost(context),
                icon: const Icon(Icons.add_rounded),
                label: Text(tr('投稿', 'Post')),
              ),
        bottomNavigationBar: !_selecting
            ? null
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s8),
                  child: PrimaryButton(
                    label: deleting != null ? tr('削除中… ${deleting.$1}/${deleting.$2}', 'Deleting… ${deleting.$1}/${deleting.$2}') : tr('削除（${_selected.length}件）', 'Delete (${_selected.length})'),
                    icon: Icons.delete_outline_rounded,
                    destructive: true,
                    loading: deleting != null,
                    onPressed: _selected.isEmpty || deleting != null ? null : _deleteSelected,
                  ),
                ),
              ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s4, Ds.s16, Ds.s8),
            child: DebouncedSearchField(
              hint: tr('タイトル・説明・タグで探す', 'Search by title, description or tag'),
              value: _query.search,
              onSearch: (v) {
                _query.search = v;
                _reload();
              },
            ),
          ),
          PillTabs(
            labels: [for (final t in tabs) t.$2],
            index: tabs.indexWhere((t) => t.$1 == _query.accessType),
            onChanged: (i) {
              _query.accessType = tabs[i].$1;
              _reload();
            },
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, 0),
            child: Row(children: [
              FilterButton(label: _query.sort.label, icon: Icons.swap_vert_rounded, active: _query.sort != myWorkSortOptions.first, onTap: _pickSort),
              const SizedBox(width: Ds.s6),
              FilterButton(label: _labelOf(myPostWorkTypes, _query.workType), active: _query.workType != null, onTap: _pickWorkType),
              const SizedBox(width: Ds.s6),
              FilterButton(label: _labelOf(myRatingFilters, _query.rating), active: _query.rating != null, onTap: _pickRating),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s8, 0),
            child: Row(children: [
              Expanded(
                child: Text(
                  _count == null ? '' : tr('${commaCount(_count!)}件の作品', '${commaCount(_count!)} works'),
                  style: TextStyle(color: context.muted, fontSize: 12.5, fontWeight: FontWeight.w600),
                ),
              ),
              if (_query.isFiltered)
                TextButton.icon(
                  style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                  onPressed: () {
                    _query.clearFilters();
                    _reload();
                  },
                  icon: const Icon(Icons.filter_alt_off_outlined, size: 16),
                  label: Text(tr('絞り込みを解除', 'Clear filters'), style: const TextStyle(fontSize: 12.5)),
                ),
            ]),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: _controller,
              builder: (context, _) {
                final c = _controller;
                if (c.isInitialLoading) return const SkeletonList();
                if (c.items.isEmpty && c.error != null) return StateView.error(c.error!, onRetry: c.refresh);
                if (c.items.isEmpty) {
                  if (_query.isFiltered) {
                    return StateView(
                      icon: Icons.search_off_rounded,
                      title: tr('条件に合う作品がありません', 'No works match these filters'),
                      actionLabel: tr('絞り込みを解除', 'Clear filters'),
                      onAction: () {
                        _query.clearFilters();
                        _reload();
                      },
                    );
                  }
                  return StateView.empty(tr('まだ作品がありません', 'No works yet'), message: tr('画像や小説を投稿すると、ここで管理できます', 'Works you post will appear here'), icon: Icons.image_outlined);
                }
                return AppRefresh(
                  onRefresh: () async => _reload(),
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, _selecting ? Ds.s24 : 96),
                    itemCount: c.items.length + 1,
                    separatorBuilder: (_, __) => Divider(height: 16, color: context.hairline),
                    itemBuilder: (context, i) {
                      if (i == c.items.length) {
                        if (c.hasMore && !c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                        return c.isLoading ? const Padding(padding: EdgeInsets.all(Ds.s16), child: Center(child: CircularProgressIndicator.adaptive())) : const SizedBox();
                      }
                      final w = c.items[i];
                      final id = w.str('id');
                      final url = shareableWorkUrl(id: id, accessType: w.str('accessType'), uuid: w.strOrNull('uuid'), createdAt: w.integer('createdAt'));
                      return _MyWorkTile(
                        work: w,
                        selecting: _selecting,
                        selected: _selected.contains(id),
                        onToggle: () => setState(() => _selected.contains(id) ? _selected.remove(id) : _selected.add(id)),
                        onLongPress: _selecting
                            ? null
                            : () => setState(() {
                                  _selecting = true;
                                  _selected.add(id);
                                }),
                        onEdit: () => _edit(w),
                        onDelete: () => _delete(w),
                        onCopyUrl: url == null ? null : () => _copyUrl(url),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class _MyWorkTile extends StatelessWidget {
  const _MyWorkTile({
    required this.work,
    required this.selecting,
    required this.selected,
    required this.onToggle,
    required this.onLongPress,
    required this.onEdit,
    required this.onDelete,
    required this.onCopyUrl,
  });

  final Map<String, dynamic> work;
  final bool selecting;
  final bool selected;
  final VoidCallback onToggle;
  final VoidCallback? onLongPress;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback? onCopyUrl;

  static Map<String, String> get _typeLabels => {'VIDEO': tr('動画', 'Video'), 'NOVEL': tr('小説', 'Novel'), 'COLUMN': tr('コラム', 'Column')};

  @override
  Widget build(BuildContext context) {
    final reserved = work.integer('createdAt') * 1000 > DateTime.now().millisecondsSinceEpoch;
    final type = work.str('type');
    return InkWell(
      onTap: selecting ? onToggle : () => Nav.work(context, work.str('id')),
      onLongPress: onLongPress,
      child: Row(children: [
        if (selecting) Checkbox.adaptive(value: selected, onChanged: (_) => onToggle()),
        AppImage(work.strOrNull('smallThumbnailImageURL'), width: 72, height: 72, radius: 10, memCacheWidth: 216),
        const SizedBox(width: Ds.s12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(work.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: Ds.s4),
            Wrap(spacing: Ds.s4, runSpacing: Ds.s4, children: [
              Badge2(reserved ? tr('予約投稿', 'Scheduled') : (accessTypeLabels[work.str('accessType')] ?? work.str('accessType'))),
              if (work.str('rating') != 'G') Badge2(work.str('rating') == 'R15' ? 'R-15' : work.str('rating')),
              if (_typeLabels[type] != null) Badge2(_typeLabels[type]!),
              if (work.boolean('isPromotion')) Badge2(tr('宣伝', 'Promotion')),
            ]),
            const SizedBox(height: Ds.s4),
            Text(
              tr('${relativeTime(work.integer('createdAt'))}・♡${work.integer('likesCount')}・ブクマ${work.integer('bookmarksCount')}・コメント${work.integer('commentsCount')}・閲覧${work.integer('viewsCount')}',
                  '${relativeTime(work.integer('createdAt'))} · ♡${work.integer('likesCount')} · ${work.integer('bookmarksCount')} bookmarks · ${work.integer('commentsCount')} comments · ${work.integer('viewsCount')} views'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: context.muted, fontSize: 12),
            ),
          ]),
        ),
        if (!selecting)
          PopupMenuButton<String>(
            tooltip: tr('その他の操作', 'More actions'),
            onSelected: (v) => switch (v) {
              'open' => Nav.work(context, work.str('id')),
              'edit' => onEdit(),
              'copy' => onCopyUrl?.call(),
              _ => onDelete(),
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'open', child: Text(tr('作品を開く', 'Open'))),
              PopupMenuItem(value: 'edit', child: Text(tr('編集する', 'Edit'))),
              if (onCopyUrl != null) PopupMenuItem(value: 'copy', child: Text(tr('URLをコピー', 'Copy URL'))),
              const PopupMenuDivider(),
              PopupMenuItem(value: 'delete', child: Text(tr('削除する', 'Delete'), style: TextStyle(color: context.cs.error))),
            ],
          ),
      ]),
    );
  }
}
