import 'package:aipictors/v2/albums/album_api.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<String?> _askTitle(BuildContext context, {required String title, String initial = ''}) async {
  final controller = TextEditingController(text: initial);
  final value = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: TextField(controller: controller, autofocus: true, maxLength: 60, decoration: const InputDecoration(hintText: 'フォルダ名')),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('キャンセル')),
        TextButton(onPressed: () => Navigator.pop(context, controller.text.trim()), child: const Text('保存')),
      ],
    ),
  );
  // 閉じるアニメーションの間も TextField が使うので dispose しない
  return value == null || value.isEmpty ? null : value;
}

/// 作品をフォルダに保存する
Future<void> showAddToFolderSheet(BuildContext context, String workId) async {
  final List<Map<String, dynamic>> folders;
  try {
    folders = await AlbumApi.folders(0, 64);
  } on ApiException catch (e) {
    if (context.mounted) context.toast(e.message, error: true);
    return;
  }
  if (!context.mounted) return;
  final id = await showModalBottomSheet<String>(
    context: context,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (context) => SafeArea(
      child: ListView(shrinkWrap: true, children: [
        ListTile(leading: const Icon(Icons.create_new_folder_outlined), title: const Text('新しいフォルダ'), onTap: () => Navigator.pop(context, '')),
        for (final f in folders)
          ListTile(
            leading: const Icon(Icons.folder_outlined),
            title: Text(f.str('title').isEmpty ? 'ブックマーク' : f.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text('${f.integer('worksCount')}作品'),
            onTap: () => Navigator.pop(context, f.str('id')),
          ),
      ]),
    ),
  );
  if (id == null || !context.mounted) return;
  try {
    var folderId = id;
    if (folderId.isEmpty) {
      final title = await _askTitle(context, title: '新しいフォルダ');
      if (title == null) return;
      folderId = await AlbumApi.createFolder(title);
    }
    await AlbumApi.addToFolder(folderId, workId);
    if (context.mounted) context.toast('フォルダに保存しました');
  } on ApiException catch (e) {
    if (context.mounted) context.toast(e.message, error: true);
  }
}

/// 自分のブックマークフォルダ
class MyFoldersScreen extends StatefulWidget {
  const MyFoldersScreen({super.key});

  @override
  State<MyFoldersScreen> createState() => _MyFoldersScreenState();
}

class _MyFoldersScreenState extends State<MyFoldersScreen> {
  final _controller = PagedController<Map<String, dynamic>>(pageSize: 32, idOf: (f) => f.str('id'), fetch: AlbumApi.folders);

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

  Future<void> _run(Future<void> Function() action, String done) async {
    try {
      await action();
      if (!mounted) return;
      context.toast(done);
      _controller.refresh();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  Future<void> _create() async {
    final title = await _askTitle(context, title: '新しいフォルダ');
    if (title != null) await _run(() => AlbumApi.createFolder(title), '作成しました');
  }

  Future<void> _rename(Map<String, dynamic> f) async {
    final title = await _askTitle(context, title: 'フォルダ名を変更', initial: f.str('title'));
    if (title != null) await _run(() => AlbumApi.renameFolder(f.str('id'), title), '変更しました');
  }

  Future<void> _delete(Map<String, dynamic> f) async {
    if (await showConfirmSheet(context, title: '「${f.str('title')}」を削除しますか？', message: '作品は消えません', destructive: true)) {
      await _run(() => AlbumApi.deleteFolder(f.str('id')), '削除しました');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ブックマーク・フォルダ')),
      floatingActionButton: FloatingActionButton.extended(onPressed: _create, icon: const Icon(Icons.add_rounded), label: const Text('作成')),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          final c = _controller;
          if (c.isInitialLoading) return const SkeletonList();
          if (c.items.isEmpty && c.error != null) return StateView.error(c.error!, onRetry: c.refresh);
          if (c.items.isEmpty) {
            return StateView.empty('フォルダがありません', message: '作品画面のメニューからフォルダに保存できます', icon: Icons.folder_outlined);
          }
          return AppRefresh(
            onRefresh: c.refresh,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 96),
              itemCount: c.items.length + (c.hasMore ? 1 : 0),
              itemBuilder: (context, i) {
                if (i >= c.items.length) {
                  if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                  return const Padding(padding: EdgeInsets.all(Ds.s16), child: Center(child: CircularProgressIndicator.adaptive()));
                }
                final f = c.items[i];
                // 名前のないフォルダはいいね・ブックマーク用の既定のもの。変更も削除もさせない
                final isDefault = f.str('title').isEmpty;
                return ListTile(
                  leading: AppImage(f.strOrNull('thumbnailImageURL'), width: 52, height: 52, radius: 8, memCacheWidth: 156),
                  title: Text(isDefault ? 'ブックマーク' : f.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text('${f.integer('worksCount')}作品'),
                  onTap: () async {
                    await context.push('/folders/${f.str('id')}');
                    c.refresh();
                  },
                  trailing: isDefault
                      ? null
                      : PopupMenuButton<String>(
                          onSelected: (v) => v == 'rename' ? _rename(f) : _delete(f),
                          itemBuilder: (_) => const [
                            PopupMenuItem(value: 'rename', child: Text('名前を変更')),
                            PopupMenuItem(value: 'delete', child: Text('削除')),
                          ],
                        ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// フォルダの中身
class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key, required this.id});

  final String id;

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  Map<String, dynamic>? _folder;

  late final _works = PagedController<WorkSummary>(
    pageSize: 24,
    idOf: (w) => w.id,
    fetch: (offset, limit) => AlbumApi.folderWorks(widget.id, offset, limit),
  );

  @override
  void initState() {
    super.initState();
    _works.loadMore();
    AlbumApi.folder(widget.id).then((f) {
      if (mounted) setState(() => _folder = f);
    }, onError: (_) {});
  }

  @override
  void dispose() {
    _works.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final f = _folder;
    return Scaffold(
      appBar: AppBar(
        title: Text(f == null ? 'フォルダ' : (f.str('title').isEmpty ? 'ブックマーク' : f.str('title'))),
        actions: [
          if (f != null)
            IconButton(
              tooltip: '通報',
              icon: const Icon(Icons.flag_outlined),
              onPressed: () => context.push('/folders/${widget.id}/report'),
            ),
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(Ds.s8),
          sliver: SliverPagedWorks(controller: _works, emptyTitle: 'まだ作品がありません'),
        ),
      ]),
    );
  }
}
