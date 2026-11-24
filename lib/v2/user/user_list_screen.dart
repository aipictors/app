import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/user/user_widgets.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';

/// フォロー中・フォロワーの一覧。[name] と人数が無ければ（マイページなど URL から開いたとき）取りに行く
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key, required this.userId, this.name, this.initialIndex = 0, this.followCount, this.followersCount, this.followeeOrder = FolloweeOrder.followed});

  final String userId;
  final String? name;

  /// 0: フォロー中 / 1: フォロワー
  final int initialIndex;
  final int? followCount;
  final int? followersCount;

  /// フォロー中の最初の並び順
  final FolloweeOrder followeeOrder;

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late String? _name = widget.name;
  late int? _followCount = widget.followCount;
  late int? _followersCount = widget.followersCount;

  @override
  void initState() {
    super.initState();
    if (_name == null || _followCount == null || _followersCount == null) {
      UserApi.followHeader(widget.userId).then((h) {
        if (!mounted) return;
        setState(() {
          _name ??= h.name;
          _followCount ??= h.followCount;
          _followersCount ??= h.followersCount;
        });
      }).catchError((_) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    String label(String t, int? n) => n == null ? t : '$t ${compactCount(n)}';
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_name ?? '', style: const TextStyle(fontWeight: FontWeight.w800)),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            dividerColor: context.hairline,
            tabs: [Tab(text: label('フォロー中', _followCount)), Tab(text: label('フォロワー', _followersCount))],
          ),
        ),
        body: TabBarView(children: [
          _FolloweesTab(
            userId: widget.userId,
            initialOrder: widget.followeeOrder,
            emptyTitle: 'まだ誰もフォローしていません',
            emptyMessage: 'フォローした人がここに並びます',
          ),
          _UserListTab(
            fetch: (o, l) => UserApi.followers(widget.userId, o, l),
            emptyTitle: 'まだフォロワーはいません',
            emptyMessage: 'フォローしてくれた人がここに並びます',
          ),
        ]),
      ),
    );
  }
}

/// フォロー中のタブ（並び順を選べる）
class _FolloweesTab extends StatefulWidget {
  const _FolloweesTab({required this.userId, required this.initialOrder, required this.emptyTitle, this.emptyMessage});

  final String userId;
  final FolloweeOrder initialOrder;
  final String emptyTitle;
  final String? emptyMessage;

  @override
  State<_FolloweesTab> createState() => _FolloweesTabState();
}

class _FolloweesTabState extends State<_FolloweesTab> {
  late FolloweeOrder _order = widget.initialOrder;

  static String _label(FolloweeOrder order) => switch (order) {
        FolloweeOrder.followed => tr('最近フォローした順', 'Recently followed'),
        FolloweeOrder.posted => tr('最近投稿した順', 'Recently posted'),
      };

  @override
  Widget build(BuildContext context) {
    return _UserListTab(
      key: ValueKey(_order),
      fetch: (o, l) => UserApi.followees(widget.userId, o, l, order: _order),
      emptyTitle: widget.emptyTitle,
      emptyMessage: widget.emptyMessage,
      header: SizedBox(
        height: 34,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            for (final order in FolloweeOrder.values)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(_label(order)),
                  selected: _order == order,
                  onSelected: (_) => setState(() => _order = order),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _UserListTab extends StatefulWidget {
  const _UserListTab({super.key, required this.fetch, required this.emptyTitle, this.emptyMessage, this.header});

  final Future<List<UserRowData>> Function(int offset, int limit) fetch;
  final String emptyTitle;
  final String? emptyMessage;

  /// 一覧の上に出すもの（並び順の切り替えなど）
  final Widget? header;

  @override
  State<_UserListTab> createState() => _UserListTabState();
}

class _UserListTabState extends State<_UserListTab> with AutomaticKeepAliveClientMixin {
  late final PagedController<UserRowData> _c = PagedController(pageSize: 20, idOf: (u) => u.id, fetch: widget.fetch);
  String? _viewerId;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    UserApi.viewerId().then((v) {
      if (mounted) setState(() => _viewerId = v);
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator.adaptive(
      onRefresh: _c.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          if (widget.header != null) SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.only(top: 10, bottom: 2), child: widget.header)),
          SliverPagedUsers(controller: _c, viewerId: _viewerId, emptyTitle: widget.emptyTitle, emptyMessage: widget.emptyMessage),
        ],
      ),
    );
  }
}

/// シリーズ（アルバム）の作品
class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key, required this.album, required this.userName});

  final AlbumSummary album;
  final String userName;

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late final PagedController<WorkSummary> _c = PagedController(
    pageSize: 30,
    idOf: (w) => w.id,
    fetch: (o, l) => UserApi.albumWorks(widget.album.id, o, l),
  );

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: _c.refresh,
        child: CustomScrollView(slivers: [
          SliverAppBar.medium(title: Text(widget.album.title, style: const TextStyle(fontWeight: FontWeight.w800))),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
              child: Text('${widget.userName}のシリーズ・${widget.album.worksCount}作品', style: context.tt.bodySmall?.copyWith(color: context.muted)),
            ),
          ),
          SliverPagedWorks(controller: _c, showUser: false, emptyTitle: 'このシリーズには作品がありません'),
        ]),
      ),
    );
  }
}
