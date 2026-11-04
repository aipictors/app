import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/stickers/sticker_api.dart';
import 'package:aipictors/v2/stickers/stickers_screen.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// タイトル・ジャンル・タグの入力（公開するときに必要）
class StickerPublishFields extends StatelessWidget {
  const StickerPublishFields({super.key, required this.title, required this.genre, required this.tag, required this.onGenre, required this.onTag});

  final TextEditingController title;
  final String genre;
  final String? tag;
  final ValueChanged<String> onGenre;
  final ValueChanged<String> onTag;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      TextField(
        controller: title,
        maxLength: 60,
        decoration: InputDecoration(
          hintText: 'タイトル',
          counterText: '',
          filled: true,
          fillColor: context.skeleton,
          isDense: true,
          border: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide.none),
        ),
      ),
      const SizedBox(height: Ds.s12),
      const Text('ジャンル', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
      const SizedBox(height: Ds.s6),
      Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
        for (final g in stickerGenres.entries) AppChip(g.value, selected: genre == g.key, onTap: () => onGenre(g.key)),
      ]),
      const SizedBox(height: Ds.s12),
      const Text('タグ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
      const SizedBox(height: Ds.s6),
      Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
        for (final t in stickerTags) AppChip(t, selected: tag == t, onTap: () => onTag(t)),
      ]),
    ]);
  }
}

/// マイスタンプ（Web の settings.sticker）
class MyStickersScreen extends StatefulWidget {
  const MyStickersScreen({super.key});

  @override
  State<MyStickersScreen> createState() => _MyStickersScreenState();
}

class _MyStickersScreenState extends State<MyStickersScreen> {
  static const _tabs = {'追加した': 'DOWNLOADED', '公開中': 'PUBLIC_CREATED', '非公開': 'PRIVATE_CREATED'};

  int _tab = 0;

  String get _savedType => _tabs.values.elementAt(_tab);

  late final _controller = PagedController<Sticker>(
    pageSize: stickersPerPage,
    idOf: (s) => s.id,
    fetch: (offset, limit) => StickerApi.mine(_savedType, offset, limit),
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

  Future<void> _menu(Sticker s) async {
    final own = _savedType != 'DOWNLOADED';
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(leading: const Icon(Icons.open_in_new_rounded), title: const Text('詳細を見る'), onTap: () => Navigator.pop(context, 'open')),
          if (own) ...[
            ListTile(leading: const Icon(Icons.edit_outlined), title: const Text('タイトルを変更'), onTap: () => Navigator.pop(context, 'title')),
            if (s.isPublic)
              ListTile(leading: const Icon(Icons.visibility_off_outlined), title: const Text('非公開にする'), onTap: () => Navigator.pop(context, 'private'))
            else
              ListTile(leading: const Icon(Icons.public_rounded), title: const Text('公開する'), onTap: () => Navigator.pop(context, 'publish')),
            ListTile(
              leading: Icon(Icons.delete_outline_rounded, color: context.cs.error),
              title: Text('削除', style: TextStyle(color: context.cs.error)),
              onTap: () => Navigator.pop(context, 'delete'),
            ),
          ] else
            ListTile(leading: const Icon(Icons.remove_circle_outline_rounded), title: const Text('マイスタンプから外す'), onTap: () => Navigator.pop(context, 'remove')),
          const SizedBox(height: Ds.s8),
        ]),
      ),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case 'open':
        context.push('/stickers/${s.id}');
      case 'title':
        await _retitle(s);
      case 'private':
        if (await showConfirmSheet(context, title: '非公開にしますか？', message: '他の人の一覧に出なくなります')) {
          await _run(() => StickerApi.update(s.id, access: 'PRIVATE', title: s.title, genre: s.genre, categories: s.categories), '非公開にしました');
        }
      case 'publish':
        await _publish(s);
      case 'delete':
        if (await showConfirmSheet(context, title: 'スタンプを削除しますか？', message: '元に戻せません', destructive: true)) {
          await _run(() => StickerApi.deleteOwn(s.id), '削除しました');
        }
      case 'remove':
        await _run(() => StickerApi.removeFromMine(s.id), 'マイスタンプから外しました');
    }
  }

  Future<void> _retitle(Sticker s) async {
    final controller = TextEditingController(text: s.title);
    final title = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('タイトルを変更'),
        content: TextField(controller: controller, autofocus: true, maxLength: 60),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('キャンセル')),
          TextButton(onPressed: () => Navigator.pop(context, controller.text.trim()), child: const Text('保存')),
        ],
      ),
    );
    // 閉じるアニメーションの間も TextField が使うので dispose しない
    if (title == null || title.isEmpty || !mounted) return;
    await _run(() => StickerApi.update(s.id, access: s.isPublic ? 'PUBLIC' : 'PRIVATE', title: title, genre: s.genre, categories: s.categories), 'タイトルを変更しました');
  }

  Future<void> _publish(Sticker s) async {
    final result = await showModalBottomSheet<(String, String, String)>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (_) => _PublishSheet(sticker: s),
    );
    if (result == null || !mounted) return;
    await _run(() => StickerApi.update(s.id, access: 'PUBLIC', title: result.$1, genre: result.$2, categories: [result.$3]), '公開しました');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイスタンプ'),
        actions: [TextButton(onPressed: () => context.push('/stickers'), child: const Text('広場'))],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await context.push('/my/stickers/create');
          _controller.refresh();
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('作る'),
      ),
      body: Column(children: [
        PillTabs(
          labels: _tabs.keys.toList(),
          index: _tab,
          onChanged: (i) {
            setState(() => _tab = i);
            _controller.refresh();
          },
        ),
        Expanded(
          child: StickerGrid(
            controller: _controller,
            emptyMessage: _savedType == 'DOWNLOADED' ? 'スタンプ広場で気に入ったスタンプを追加しましょう' : '画像からスタンプを作れます',
            onTap: _menu,
          ),
        ),
      ]),
    );
  }
}

class _PublishSheet extends StatefulWidget {
  const _PublishSheet({required this.sticker});

  final Sticker sticker;

  @override
  State<_PublishSheet> createState() => _PublishSheetState();
}

class _PublishSheetState extends State<_PublishSheet> {
  late final _title = TextEditingController(text: widget.sticker.title);
  String _genre = 'CHARACTER';
  String? _tag;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s16 + MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('スタンプを公開', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: Ds.s12),
          StickerPublishFields(title: _title, genre: _genre, tag: _tag, onGenre: (g) => setState(() => _genre = g), onTag: (t) => setState(() => _tag = t)),
          const SizedBox(height: Ds.s16),
          PrimaryButton(
            label: '公開する',
            onPressed: () {
              if (_title.text.trim().isEmpty) {
                context.toast('タイトルを入力してください', error: true);
              } else if (_tag == null) {
                context.toast('タグを選択してください', error: true);
              } else {
                Navigator.pop(context, (_title.text.trim(), _genre, _tag!));
              }
            },
          ),
        ]),
      ),
    );
  }
}
