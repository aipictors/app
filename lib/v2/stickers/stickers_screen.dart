import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/stickers/sticker_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_name_row.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// スタンプの格子。読み足しと空の表示をまとめる
class StickerGrid extends StatelessWidget {
  const StickerGrid({super.key, required this.controller, required this.onTap, this.emptyTitle = 'スタンプがありません', this.emptyMessage});

  final PagedController<Sticker> controller;
  final ValueChanged<Sticker> onTap;
  final String emptyTitle;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final c = controller;
        if (c.isInitialLoading) return const SkeletonGrid();
        if (c.items.isEmpty && c.error != null) return StateView.error(c.error!, onRetry: c.refresh);
        if (c.items.isEmpty) return StateView.empty(emptyTitle, message: emptyMessage, icon: Icons.emoji_emotions_outlined);
        return AppRefresh(
          onRefresh: c.refresh,
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(Ds.s12, Ds.s8, Ds.s12, 96),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 116, mainAxisSpacing: Ds.s8, crossAxisSpacing: Ds.s8, childAspectRatio: 0.82),
            itemCount: c.items.length + (c.hasMore ? 1 : 0),
            itemBuilder: (context, i) {
              if (i >= c.items.length) {
                if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              return StickerCell(sticker: c.items[i], onTap: () => onTap(c.items[i]));
            },
          ),
        );
      },
    );
  }
}

class StickerCell extends StatelessWidget {
  const StickerCell({super.key, required this.sticker, required this.onTap});

  final Sticker sticker;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(Ds.s6),
            decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
            child: AppImage(sticker.imageUrl, fit: BoxFit.contain, memCacheWidth: 300),
          ),
        ),
        const SizedBox(height: Ds.s4),
        Text(sticker.title.isEmpty ? '無題' : sticker.title, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ]),
    );
  }
}

/// スタンプ広場（Web の stickers）
class StickersScreen extends StatefulWidget {
  const StickersScreen({super.key});

  @override
  State<StickersScreen> createState() => _StickersScreenState();
}

class _StickersScreenState extends State<StickersScreen> {
  int _sort = 0;
  String? _genre;
  String _search = '';

  late final _controller = PagedController<Sticker>(
    pageSize: stickersPerPage,
    idOf: (s) => s.id,
    fetch: (offset, limit) => StickerApi.plaza(offset, limit, sort: stickerSorts.values.elementAt(_sort), search: _search, genre: _genre),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタンプ広場'),
        actions: [
          TextButton(
            onPressed: () {
              if (Nav.requireLogin(context)) context.push('/my/stickers');
            },
            child: const Text('マイスタンプ'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (Nav.requireLogin(context)) context.push('/my/stickers/create');
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('作る'),
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
              hintText: 'スタンプを検索',
              prefixIcon: const Icon(Icons.search_rounded, size: 20),
              filled: true,
              fillColor: context.skeleton,
              isDense: true,
              border: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide.none),
            ),
          ),
        ),
        PillTabs(
          labels: stickerSorts.keys.toList(),
          index: _sort,
          onChanged: (i) {
            setState(() => _sort = i);
            _controller.refresh();
          },
        ),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Ds.s16, vertical: Ds.s4),
            children: [
              for (final g in {null: 'すべて', ...stickerGenres}.entries)
                Padding(
                  padding: const EdgeInsets.only(right: Ds.s6),
                  child: AppChip(g.value, selected: _genre == g.key, onTap: () {
                    setState(() => _genre = g.key);
                    _controller.refresh();
                  }),
                ),
            ],
          ),
        ),
        Expanded(
          child: StickerGrid(
            controller: _controller,
            emptyMessage: '別の言葉で探してみてください',
            onTap: (s) => context.push('/stickers/${s.id}'),
          ),
        ),
      ]),
    );
  }
}

/// スタンプの詳細
class StickerDetailScreen extends StatefulWidget {
  const StickerDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<StickerDetailScreen> createState() => _StickerDetailScreenState();
}

class _StickerDetailScreenState extends State<StickerDetailScreen> {
  Sticker? _sticker;
  String? _error;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final s = await StickerApi.detail(widget.id);
      if (!mounted) return;
      setState(() {
        _sticker = s;
        if (s == null) _error = 'スタンプが見つかりませんでした';
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _toggle() async {
    if (!Nav.requireLogin(context)) return;
    final s = _sticker!;
    setState(() => _busy = true);
    try {
      if (s.isDownloaded) {
        await StickerApi.removeFromMine(s.id);
      } else {
        await StickerApi.addToMine(s.id);
      }
      Ds.success();
      if (!mounted) return;
      setState(() => s.isDownloaded = !s.isDownloaded);
      context.toast(s.isDownloaded ? 'マイスタンプに追加しました' : 'マイスタンプから外しました');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _sticker;
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタンプ'),
        actions: [
          if (s != null)
            IconButton(
              tooltip: '通報',
              onPressed: () {
                if (Nav.requireLogin(context)) context.push('/stickers/${s.id}/report');
              },
              icon: const Icon(Icons.flag_outlined),
            ),
        ],
      ),
      body: _error != null
          ? StateView.error(_error!, onRetry: _load)
          : s == null
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ContentWidth(
                  child: ListView(padding: const EdgeInsets.all(Ds.s20), children: [
                    Center(
                      child: Container(
                        width: 240,
                        height: 240,
                        padding: const EdgeInsets.all(Ds.s12),
                        decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(20)),
                        child: AppImage(s.imageUrl, fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: Ds.s16),
                    Text(s.title.isEmpty ? '無題' : s.title, textAlign: TextAlign.center, style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: Ds.s8),
                    Text('追加 ${s.downloadsCount}・使用 ${s.usesCount}・いいね ${s.likesCount}', textAlign: TextAlign.center, style: TextStyle(color: context.muted, fontSize: 13)),
                    const SizedBox(height: Ds.s12),
                    Wrap(alignment: WrapAlignment.center, spacing: Ds.s6, children: [
                      if (stickerGenres[s.genre] != null) Badge2(stickerGenres[s.genre]!),
                      for (final c in s.categories) Badge2(c),
                    ]),
                    const SizedBox(height: Ds.s20),
                    if (s.user != null)
                      InkWell(
                        onTap: () => Nav.user(context, s.user!.str('id')),
                        child: Row(children: [
                          UserAvatar.json(s.user, size: 36),
                          const SizedBox(width: Ds.s8),
                          Expanded(child: UserNameRow.json(s.user!)),
                        ]),
                      ),
                    const SizedBox(height: Ds.s20),
                    s.isDownloaded
                        ? SecondaryButton(label: 'マイスタンプから外す', icon: Icons.remove_circle_outline_rounded, loading: _busy, onPressed: _busy ? null : _toggle)
                        : PrimaryButton(label: 'マイスタンプに追加', icon: Icons.add_rounded, loading: _busy, onPressed: _busy ? null : _toggle),
                  ]),
                ),
    );
  }
}
