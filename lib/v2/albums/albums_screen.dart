import 'package:aipictors/v2/albums/album_api.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/user_name_row.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

/// 作品をシリーズに足す
Future<void> showAddToAlbumSheet(BuildContext context, String workId) async {
  final List<Map<String, dynamic>> albums;
  try {
    albums = await AlbumApi.mine(0, 64);
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
      child: albums.isEmpty
          ? const StateView(icon: Icons.collections_bookmark_outlined, title: 'シリーズがありません', message: 'マイページのシリーズから作れます', compact: true)
          : ListView(shrinkWrap: true, children: [
              for (final a in albums)
                ListTile(
                  leading: AppImage(a.strOrNull('thumbnailImageURL'), width: 44, height: 44, radius: 8, memCacheWidth: 132),
                  title: Text(a.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text('${a.integer('worksCount')}作品'),
                  onTap: () => Navigator.pop(context, a.str('id')),
                ),
            ]),
    ),
  );
  if (id == null || !context.mounted) return;
  try {
    await AlbumApi.addWork(id, workId);
    if (context.mounted) context.toast('シリーズに追加しました');
  } on ApiException catch (e) {
    if (context.mounted) context.toast(e.message, error: true);
  }
}

/// 自分のシリーズ
class MyAlbumsScreen extends StatefulWidget {
  const MyAlbumsScreen({super.key});

  @override
  State<MyAlbumsScreen> createState() => _MyAlbumsScreenState();
}

class _MyAlbumsScreenState extends State<MyAlbumsScreen> {
  final _controller = PagedController<Map<String, dynamic>>(pageSize: 24, idOf: (a) => a.str('id'), fetch: AlbumApi.mine);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('シリーズ')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await context.push('/albums/create');
          _controller.refresh();
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('作成'),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          final c = _controller;
          if (c.isInitialLoading) return const SkeletonGrid();
          if (c.items.isEmpty && c.error != null) return StateView.error(c.error!, onRetry: c.refresh);
          if (c.items.isEmpty) {
            return StateView.empty('シリーズがありません', message: '作品をまとめてシリーズにできます', icon: Icons.collections_bookmark_outlined);
          }
          return AppRefresh(
            onRefresh: c.refresh,
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, 96),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220, mainAxisSpacing: Ds.s12, crossAxisSpacing: Ds.s12, childAspectRatio: 0.82),
              itemCount: c.items.length + (c.hasMore ? 1 : 0),
              itemBuilder: (context, i) {
                if (i >= c.items.length) {
                  if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
                final a = c.items[i];
                return Pressable(
                  onTap: () async {
                    await context.push('/albums/${a.str('id')}');
                    c.refresh();
                  },
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Expanded(child: AppImage(a.strOrNull('thumbnailImageURL'), radius: 12, memCacheWidth: 500)),
                    const SizedBox(height: Ds.s6),
                    Text(a.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text('${a.integer('worksCount')}作品', style: TextStyle(color: context.muted, fontSize: 12)),
                  ]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// シリーズの中身
class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key, required this.id});

  final String id;

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  Map<String, dynamic>? _album;
  String? _viewerId;
  String? _error;

  late final _works = PagedController<WorkSummary>(
    pageSize: 24,
    idOf: (w) => w.id,
    fetch: (offset, limit) => AlbumApi.works(widget.id, offset, limit),
  );

  bool get _isMine => _viewerId != null && _album?.obj('user')?.str('id') == _viewerId;

  @override
  void initState() {
    super.initState();
    _load();
    _works.loadMore();
  }

  @override
  void dispose() {
    _works.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final r = await AlbumApi.detail(widget.id);
      if (!mounted) return;
      final rating = r.album?.str('rating');
      setState(() {
        _album = r.album;
        _viewerId = r.viewerId;
        if (r.album == null) _error = 'シリーズが見つかりませんでした';
        // R18 はモバイルでは出さない
        if (rating == 'R18' || rating == 'R18G') _error = 'このシリーズはアプリでは表示できません';
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final a = _album;
    if (_error != null) return Scaffold(appBar: AppBar(), body: StateView.error(_error!, onRetry: _load));
    return Scaffold(
      appBar: AppBar(
        title: Text(a?.str('title') ?? ''),
        actions: [
          if (a != null) ...[
            IconButton(
              icon: const Icon(Icons.ios_share_rounded),
              onPressed: () {
                final box = context.findRenderObject() as RenderBox?;
                Share.share(
                  '${a.str('title')}\nhttps://www.aipictors.com/${a.obj('user')?.str('login')}/albums/${a.str('slug')}',
                  sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
                );
              },
            ),
            if (_isMine)
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () async {
                  final result = await context.push('/albums/${widget.id}/update');
                  if (!mounted) return;
                  if (result == 'deleted') {
                    context.pop();
                  } else if (result != null) {
                    _load();
                    _works.refresh();
                  }
                },
              )
            else
              IconButton(
                tooltip: '通報',
                icon: const Icon(Icons.flag_outlined),
                onPressed: () {
                  if (Nav.requireLogin(context)) context.push('/albums/${widget.id}/report');
                },
              ),
          ],
        ],
      ),
      body: CustomScrollView(slivers: [
        if (a != null)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s4, Ds.s16, Ds.s12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                InkWell(
                  onTap: () => Nav.user(context, a.obj('user')!.str('id')),
                  child: Row(children: [
                    UserAvatar.json(a.obj('user'), size: 32),
                    const SizedBox(width: Ds.s8),
                    Expanded(child: UserNameRow.json(a.obj('user'))),
                  ]),
                ),
                if (a.str('description').trim().isNotEmpty) ...[
                  const SizedBox(height: Ds.s8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(Ds.s12),
                    decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.7), borderRadius: Ds.br(12)),
                    child: Text(a.str('description').trim(), style: const TextStyle(height: 1.5, fontSize: 14)),
                  ),
                ],
                const SizedBox(height: Ds.s8),
                Text('${a.integer('worksCount')}作品', style: TextStyle(color: context.muted, fontSize: 13)),
              ]),
            ),
          ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Ds.s8),
          sliver: SliverPagedWorks(controller: _works, emptyTitle: 'まだ作品がありません'),
        ),
      ]),
    );
  }
}

/// シリーズの作成と編集
class AlbumEditScreen extends StatefulWidget {
  const AlbumEditScreen({super.key, this.id});

  final String? id;

  @override
  State<AlbumEditScreen> createState() => _AlbumEditScreenState();
}

class _AlbumEditScreenState extends State<AlbumEditScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final Set<String> _selected = {};
  final _works = PagedController<WorkSummary>(pageSize: 24, idOf: (w) => w.id, fetch: AlbumApi.myWorks);
  EncodedImage? _image;
  String? _currentImage;
  bool _loading = false;
  bool _sending = false;

  bool get _isEdit => widget.id != null;

  @override
  void initState() {
    super.initState();
    _works.loadMore();
    if (_isEdit) _load();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _works.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final r = await AlbumApi.detail(widget.id!);
      final a = r.album;
      if (a == null || a.obj('user')?.str('id') != r.viewerId) throw const ApiException('自分のシリーズだけ編集できます');
      _title.text = a.str('title');
      _description.text = a.str('description');
      _currentImage = a.strOrNull('thumbnailImageURL');
      _selected.addAll((a['workIds'] as List? ?? const []).map((id) => id.toString()));
    } on ApiException catch (e) {
      if (mounted) {
        context.toast(e.message, error: true);
        context.pop();
      }
    }
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _pickImage() async {
    try {
      final files = await pickSystemImages(multiple: false);
      if (files.isEmpty) return;
      final image = await ImageTools.normalize(await files.first.readAsBytes());
      if (mounted) setState(() => _image = image);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (_) {
      if (mounted) context.toast('写真を開けませんでした', error: true);
    }
  }

  Future<void> _submit() async {
    final title = _title.text.trim();
    if (title.isEmpty) {
      context.toast('タイトルを入力してください', error: true);
      return;
    }
    if (_selected.isEmpty) {
      context.toast('作品を 1 つ以上選んでください', error: true);
      return;
    }
    setState(() => _sending = true);
    try {
      if (_isEdit) {
        await AlbumApi.update(widget.id!, title: title, description: _description.text.trim(), workIds: _selected.toList(), header: _image);
      } else {
        await AlbumApi.create(title: title, description: _description.text.trim(), workIds: _selected.toList(), thumbnail: _image);
      }
      if (!mounted) return;
      Ds.success();
      context.toast(_isEdit ? 'シリーズを更新しました' : 'シリーズを作成しました');
      context.pop(true);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _sending = false);
      context.toast(e.message, error: true);
    }
  }

  Future<void> _delete() async {
    if (!await showConfirmSheet(context, title: 'シリーズを削除しますか？', message: '作品は消えません', destructive: true)) return;
    try {
      await AlbumApi.delete(widget.id!);
      if (!mounted) return;
      context.toast('削除しました');
      context.pop('deleted');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  InputDecoration _decoration(String hint) => InputDecoration(
        hintText: hint,
        counterText: '',
        filled: true,
        fillColor: context.skeleton,
        isDense: true,
        border: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide.none),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'シリーズを編集' : 'シリーズを作成'),
        actions: [
          if (_isEdit) IconButton(tooltip: '削除', onPressed: _delete, icon: const Icon(Icons.delete_outline_rounded)),
        ],
      ),
      body: _loading
          ? const SkeletonList()
          : Column(children: [
              Expanded(
                child: CustomScrollView(slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(Ds.s16),
                    sliver: SliverToBoxAdapter(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        Pressable(
                          onTap: _pickImage,
                          child: AspectRatio(
                            aspectRatio: 16 / 7,
                            child: ClipRRect(
                              borderRadius: Ds.br(12),
                              child: _image != null
                                  ? Image.memory(_image!.bytes, fit: BoxFit.cover)
                                  : _currentImage != null
                                      ? AppImage(_currentImage)
                                      : Container(
                                          color: context.skeleton,
                                          alignment: Alignment.center,
                                          child: Text('カバー画像を選ぶ（任意）', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700)),
                                        ),
                            ),
                          ),
                        ),
                        const SizedBox(height: Ds.s12),
                        TextField(controller: _title, maxLength: 120, decoration: _decoration('タイトル')),
                        const SizedBox(height: Ds.s8),
                        TextField(controller: _description, maxLength: 1000, minLines: 2, maxLines: 6, decoration: _decoration('説明（任意）')),
                        const SizedBox(height: Ds.s16),
                        Text('作品を選ぶ（${_selected.length}）', style: const TextStyle(fontWeight: FontWeight.w800)),
                      ]),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: Ds.s16),
                    sliver: ListenableBuilder(
                      listenable: _works,
                      builder: (context, _) {
                        final c = _works;
                        return SliverGrid.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 120, mainAxisSpacing: Ds.s6, crossAxisSpacing: Ds.s6),
                          itemCount: c.items.length + (c.hasMore ? 1 : 0),
                          itemBuilder: (context, i) {
                            if (i >= c.items.length) {
                              if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                              return const Center(child: CircularProgressIndicator.adaptive());
                            }
                            final w = c.items[i];
                            final on = _selected.contains(w.id);
                            return Pressable(
                              onTap: () => setState(() => on ? _selected.remove(w.id) : _selected.add(w.id)),
                              child: Stack(fit: StackFit.expand, children: [
                                AppImage(w.imageUrl, radius: 10, memCacheWidth: 300),
                                if (on)
                                  DecoratedBox(
                                    decoration: BoxDecoration(borderRadius: Ds.br(10), border: Border.all(color: context.cs.primary, width: 3), color: Colors.black26),
                                    child: const Center(child: Icon(Icons.check_circle_rounded, color: Colors.white)),
                                  ),
                              ]),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: Ds.s16)),
                ]),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(Ds.s12),
                  child: PrimaryButton(label: _isEdit ? '保存する' : '作成する', loading: _sending, onPressed: _sending ? null : _submit),
                ),
              ),
            ]),
    );
  }
}
