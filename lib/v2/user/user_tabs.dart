import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/my/my_api.dart';
import 'package:aipictors/v2/my/my_screens.dart';
import 'package:aipictors/v2/support/support_ranking_screen.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StickerCell {
  const StickerCell({required this.id, required this.title, required this.imageUrl});

  final String id;
  final String title;
  final String? imageUrl;
}

class BadgeCell {
  const BadgeCell({required this.id, required this.text, required this.imageUrl});

  final String id;
  final String text;
  final String? imageUrl;
}

class EventCell {
  const EventCell({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.mainTag,
    required this.status,
    required this.entryCount,
  });

  final String id;
  final String title;
  final String? thumbnailUrl;
  final String? mainTag;
  final String status;
  final int entryCount;
}

/// ユーザーのページの追加のタブで読むもの
class UserTabsApi {
  UserTabsApi._();

  static Future<List<StickerCell>> stickers(String userId, int offset, int limit) async {
    final data = await Api.query(r'''
query AppUserStickers($offset: Int!, $limit: Int!, $where: StickersWhereInput) {
  stickers(offset: $offset, limit: $limit, where: $where) { id title imageUrl }
}''', variables: {
      'offset': offset,
      'limit': limit,
      'where': {'creatorUserId': userId},
    });
    return data.list('stickers').map((s) => StickerCell(id: s.str('id'), title: s.str('title'), imageUrl: s.strOrNull('imageUrl'))).toList();
  }

  static Future<List<BadgeCell>> badges(String userId, int offset, int limit) async {
    final data = await Api.query(r'''
query AppUserBadges($offset: Int!, $limit: Int!, $where: UserBadgesWhereInput!) {
  userBadges(offset: $offset, limit: $limit, where: $where) { id text imageUrl }
}''', variables: {
      'offset': offset,
      'limit': limit,
      'where': {'userId': userId},
    });
    return data.list('userBadges').map((b) => BadgeCell(id: b.str('id'), text: b.str('text'), imageUrl: b.strOrNull('imageUrl'))).toList();
  }

  static Future<List<EventCell>> events(String userId, int offset, int limit) async {
    final data = await Api.query(r'''
query AppUserEvents($userId: ID!, $offset: Int!, $limit: Int!, $where: UserEventsWhereInput) {
  user(id: $userId) {
    id
    userEvents(offset: $offset, limit: $limit, where: $where) {
      id title thumbnailImageUrl mainTag status entryCount isSensitive
    }
  }
}''', variables: {
      'userId': userId,
      'offset': offset,
      'limit': limit,
      'where': {'isSensitive': false},
    });
    return (data.obj('user')?.list('userEvents') ?? const <Map<String, dynamic>>[])
        .where((e) => !e.boolean('isSensitive'))
        .map((e) => EventCell(
              id: e.str('id'),
              title: e.str('title'),
              thumbnailUrl: e.strOrNull('thumbnailImageUrl'),
              mainTag: e.strOrNull('mainTag'),
              status: e.str('status'),
              entryCount: e.integer('entryCount'),
            ))
        .toList();
  }
}

/// 読み足しつきのタブの中身（sliver）
class _PagedTab<T> extends StatefulWidget {
  const _PagedTab({super.key, required this.fetch, required this.idOf, required this.builder, required this.emptyTitle, required this.emptyIcon});

  final Future<List<T>> Function(int offset, int limit) fetch;
  final String Function(T) idOf;
  final Widget Function(BuildContext context, PagedController<T> controller) builder;
  final String emptyTitle;
  final IconData emptyIcon;

  @override
  State<_PagedTab<T>> createState() => _PagedTabState<T>();
}

class _PagedTabState<T> extends State<_PagedTab<T>> {
  late final PagedController<T> _c = PagedController<T>(pageSize: 30, idOf: widget.idOf, fetch: widget.fetch);

  @override
  void initState() {
    super.initState();
    _c.loadMore();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _c,
      builder: (context, _) {
        if (_c.isInitialLoading) return const SkeletonList(count: 4, sliver: true);
        if (_c.items.isEmpty && _c.error != null) return SliverToBoxAdapter(child: StateView.error(_c.error!, onRetry: _c.refresh));
        if (_c.items.isEmpty) return SliverToBoxAdapter(child: StateView.empty(widget.emptyTitle, icon: widget.emptyIcon));
        return widget.builder(context, _c);
      },
    );
  }
}

String _eventStatus(String status) => switch (status) {
      'ONGOING' => '開催中',
      'UPCOMING' => '開催予定',
      'ENDED' => '終了',
      _ => '',
    };

void _more<T>(PagedController<T> c, int i) {
  if (i >= c.items.length - 4 && c.hasMore && !c.isLoading) {
    WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
  }
}

class UserFoldersTab extends StatelessWidget {
  const UserFoldersTab({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return _PagedTab<FolderSummary>(
      fetch: (o, l) => MyApi.userFolders(userId, o, l),
      idOf: (f) => f.id,
      emptyTitle: 'コレクションはありません',
      emptyIcon: Icons.folder_outlined,
      builder: (context, c) => SliverPadding(
        padding: const EdgeInsets.only(top: Ds.s8, bottom: 80),
        sliver: SliverList.builder(
          itemCount: c.items.length,
          itemBuilder: (context, i) {
            _more(c, i);
            return FolderTile(folder: c.items[i]);
          },
        ),
      ),
    );
  }
}

class UserStickersTab extends StatelessWidget {
  const UserStickersTab({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return _PagedTab<StickerCell>(
      fetch: (o, l) => UserTabsApi.stickers(userId, o, l),
      idOf: (s) => s.id,
      emptyTitle: 'スタンプはありません',
      emptyIcon: Icons.emoji_emotions_outlined,
      builder: (context, c) => SliverPadding(
        padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s16, Ds.s16, 80),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 110, mainAxisSpacing: Ds.s12, crossAxisSpacing: Ds.s12),
          itemCount: c.items.length,
          itemBuilder: (context, i) {
            _more(c, i);
            final s = c.items[i];
            return Pressable(
              onTap: () => context.push('/stickers/${s.id}'),
              child: AppImage(s.imageUrl, fit: BoxFit.contain, radius: 8, memCacheWidth: 300),
            );
          },
        ),
      ),
    );
  }
}

class UserBadgesTab extends StatelessWidget {
  const UserBadgesTab({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return _PagedTab<BadgeCell>(
      fetch: (o, l) => UserTabsApi.badges(userId, o, l),
      idOf: (b) => b.id,
      emptyTitle: 'バッジはありません',
      emptyIcon: Icons.military_tech_outlined,
      builder: (context, c) => SliverPadding(
        padding: const EdgeInsets.only(top: Ds.s8, bottom: 80),
        sliver: SliverList.builder(
          itemCount: c.items.length,
          itemBuilder: (context, i) {
            _more(c, i);
            final b = c.items[i];
            return ListTile(
              leading: SizedBox(width: 48, height: 48, child: AppImage(b.imageUrl, fit: BoxFit.contain, memCacheWidth: 144)),
              title: Text(b.text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            );
          },
        ),
      ),
    );
  }
}

class UserEventsTab extends StatelessWidget {
  const UserEventsTab({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return _PagedTab<EventCell>(
      fetch: (o, l) => UserTabsApi.events(userId, o, l),
      idOf: (e) => e.id,
      emptyTitle: 'イベントはありません',
      emptyIcon: Icons.celebration_outlined,
      builder: (context, c) => SliverPadding(
        padding: const EdgeInsets.only(top: Ds.s8, bottom: 80),
        sliver: SliverList.builder(
          itemCount: c.items.length,
          itemBuilder: (context, i) {
            _more(c, i);
            final e = c.items[i];
            final tag = e.mainTag;
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: Ds.s16, vertical: Ds.s4),
              leading: SizedBox(width: 72, height: 48, child: AppImage(e.thumbnailUrl, radius: 10, memCacheWidth: 216)),
              title: Text(e.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              subtitle: Text(
                [_eventStatus(e.status), if (tag != null) '#$tag', if (e.entryCount > 0) '${e.entryCount}作品'].where((t) => t.isNotEmpty).join('・'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: context.muted, fontSize: 12),
              ),
              // イベントの画面はアプリにないので、投稿先のタグの作品へ
              onTap: tag == null ? null : () => Nav.tag(context, tag),
            );
          },
        ),
      ),
    );
  }
}

/// この人を応援した人（Web の /users/:user/supports）
class UserSupportersTab extends StatefulWidget {
  const UserSupportersTab({super.key, required this.userId});

  final String userId;

  @override
  State<UserSupportersTab> createState() => _UserSupportersTabState();
}

class _UserSupportersTabState extends State<UserSupportersTab> {
  List<SupportRankItem>? _items;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final r = await SupportRanking.fetch('sent', recipientUserId: widget.userId);
      if (mounted) setState(() => _items = r.items);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } catch (_) {
      if (mounted) setState(() => _error = '読み込みに失敗しました');
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    if (_error != null) return SliverToBoxAdapter(child: StateView.error(_error!, onRetry: _load));
    if (items == null) return const SkeletonList(count: 4, sliver: true);
    if (items.isEmpty) return SliverToBoxAdapter(child: StateView.empty('まだ応援はありません', icon: Icons.volunteer_activism_outlined));
    return SliverPadding(
      padding: const EdgeInsets.only(top: Ds.s8, bottom: 80),
      sliver: SliverList.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final r = items[i];
          final canOpen = r.userId.isNotEmpty && r.userId != '0';
          return ListTile(
            leading: UserAvatar(url: r.iconUrl, size: 40),
            title: Text(r.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
            subtitle: Text('${r.rank}位', style: TextStyle(color: context.muted, fontSize: 12)),
            trailing: Badge2('${compactCount(r.coins)}コイン', icon: Icons.monetization_on_rounded, color: Ds.gold),
            onTap: canOpen ? () => Nav.user(context, r.userId) : null,
          );
        },
      ),
    );
  }
}
