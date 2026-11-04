import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
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
        ListTile(leading: const Icon(Icons.image_outlined), title: const Text('画像を投稿'), onTap: () => Navigator.pop(context, '/works/create')),
        ListTile(leading: const Icon(Icons.article_outlined), title: const Text('小説・コラムを投稿'), onTap: () => Navigator.pop(context, '/works/create/text')),
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
  static const _tabs = {'すべて': null, '公開': 'PUBLIC', '下書き': 'DRAFT', '非公開': 'PRIVATE'};

  int _tab = 0;
  String _search = '';
  String? _userId;

  late final _controller = PagedController<Map<String, dynamic>>(
    pageSize: 24,
    idOf: (w) => w.str('id'),
    fetch: (offset, limit) async {
      _userId ??= (await Api.query('query AppViewerId { viewer { id user { id } } }', cacheFor: const Duration(minutes: 10))).obj('viewer')?.obj('user')?.str('id');
      final access = _tabs.values.elementAt(_tab);
      final data = await Api.query(r'''
query AppMyWorks($offset: Int!, $limit: Int!, $where: WorksWhereInput) {
  works(offset: $offset, limit: $limit, where: $where) {
    id title type rating accessType createdAt likesCount commentsCount viewsCount smallThumbnailImageURL
  }
}''', variables: {
        'offset': offset,
        'limit': limit,
        'where': {
          'userId': _userId,
          'isIncludePrivate': true,
          'orderBy': 'DATE_CREATED',
          'sort': 'DESC',
          'ratings': appRatings,
          if (access != null) 'accessTypes': [access],
          if (_search.isNotEmpty) ...{'search': _search, 'searchInTags': true, 'searchInDescription': true},
          'createdAtAfter': DateTime.utc(1999).toIso8601String(),
          'beforeCreatedAt': DateTime.utc(2099).toIso8601String(),
        },
      });
      return data.list('works');
    },
  );

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

  Future<void> _edit(Map<String, dynamic> w) async {
    final result = await context.push('/works/${w.str('id')}/update');
    if (result != null) _controller.refresh();
  }

  Future<void> _delete(Map<String, dynamic> w) async {
    if (!await showConfirmSheet(context, title: '「${w.str('title')}」を削除しますか？', message: '元に戻せません', destructive: true)) return;
    try {
      await PostApi.delete(w.str('id'));
      _controller.removeWhere((x) => x.str('id') == w.str('id'));
      if (mounted) context.toast('削除しました');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('自分の作品')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openNewPost(context),
        icon: const Icon(Icons.add_rounded),
        label: const Text('投稿'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s4, Ds.s16, Ds.s8),
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (v) {
              _search = v.trim();
              _controller.refresh();
            },
            decoration: InputDecoration(
              hintText: 'タイトル・タグで検索',
              prefixIcon: const Icon(Icons.search_rounded, size: 20),
              filled: true,
              fillColor: context.skeleton,
              isDense: true,
              border: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide.none),
            ),
          ),
        ),
        PillTabs(
          labels: _tabs.keys.toList(),
          index: _tab,
          onChanged: (i) {
            setState(() => _tab = i);
            _controller.refresh();
          },
        ),
        Expanded(
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              final c = _controller;
              if (c.isInitialLoading) return const SkeletonList();
              if (c.items.isEmpty && c.error != null) return StateView.error(c.error!, onRetry: c.refresh);
              if (c.items.isEmpty) {
                return StateView.empty('作品がありません', message: '画像や小説を投稿すると、ここで管理できます', icon: Icons.image_outlined);
              }
              return AppRefresh(
                onRefresh: c.refresh,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, 96),
                  itemCount: c.items.length + 1,
                  separatorBuilder: (_, __) => Divider(height: 16, color: context.hairline),
                  itemBuilder: (context, i) {
                    if (i == c.items.length) {
                      if (c.hasMore && !c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                      return c.isLoading ? const Padding(padding: EdgeInsets.all(Ds.s16), child: Center(child: CircularProgressIndicator.adaptive())) : const SizedBox();
                    }
                    final w = c.items[i];
                    return _MyWorkTile(work: w, onEdit: () => _edit(w), onDelete: () => _delete(w));
                  },
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

class _MyWorkTile extends StatelessWidget {
  const _MyWorkTile({required this.work, required this.onEdit, required this.onDelete});

  final Map<String, dynamic> work;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final reserved = work.integer('createdAt') * 1000 > DateTime.now().millisecondsSinceEpoch;
    return InkWell(
      onTap: () => Nav.work(context, work.str('id')),
      child: Row(children: [
        AppImage(work.strOrNull('smallThumbnailImageURL'), width: 72, height: 72, radius: 10, memCacheWidth: 216),
        const SizedBox(width: Ds.s12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(work.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: Ds.s4),
            Wrap(spacing: Ds.s4, children: [
              Badge2(reserved ? '予約' : (accessTypeLabels[work.str('accessType')] ?? work.str('accessType'))),
              if (work.str('rating') != 'G') Badge2(work.str('rating')),
            ]),
            const SizedBox(height: Ds.s4),
            Text(
              '${relativeTime(work.integer('createdAt'))}・♡${work.integer('likesCount')}・コメント${work.integer('commentsCount')}・閲覧${work.integer('viewsCount')}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: context.muted, fontSize: 12),
            ),
          ]),
        ),
        PopupMenuButton<String>(
          onSelected: (v) => v == 'edit' ? onEdit() : onDelete(),
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'edit', child: Text('編集')),
            PopupMenuItem(value: 'delete', child: Text('削除')),
          ],
        ),
      ]),
    );
  }
}
