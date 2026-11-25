import 'dart:async';

import 'package:aipictors/v2/albums/album_api.dart' show allowedThumbnail;
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/grid_layout.dart';
import 'package:aipictors/v2/core/list_like_count.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/home/home_promotion.dart';
import 'package:aipictors/v2/home/latest_filter.dart';
import 'package:aipictors/v2/support/support_ranking_screen.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:aipictors/v2/work/work_promotion.dart' show WorkPromotionMark;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _worksQuery = '''
query AppWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    $workCardFields
  }
}''';

const _feedQuery = '''
query AppFeed(\$limit: Int!, \$offset: Int!, \$feedWhere: FeedWhereInput!, \$feedPostsWhere: FeedPostsWhereInput) {
  feed(where: \$feedWhere) {
    posts(limit: \$limit, offset: \$offset, where: \$feedPostsWhere) {
      id
      work {
        $workCardFields
      }
    }
  }
}''';

const _homeTopQuery = '''
query AppHomeTop(\$year: Int, \$month: Int, \$day: Int) {
  hotWorks(where: { isSensitive: false }) {
    $workCardFields
  }
  newUserWorks(offset: 0, limit: 16, where: { ratings: [G], isNowCreatedAt: true }) {
    $workCardFields
  }
  recommendedUsers(offset: 0, limit: 12) {
    $userSummaryFields
  }
  dailyTheme(year: \$year, month: \$month, day: \$day) {
    id
    title
    enTitle
    worksCount
    dateText
    year
    month
    day
    firstWork { largeThumbnailImageURL rating isSensitive }
  }
}''';

/// ホームタブ（Web と同じ: おすすめ・新着・フォロー新着・お気に入りタグ新着）
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<String> get _tabs => [tr('おすすめ', 'For you'), tr('新着', 'Latest'), tr('フォロー新着', 'Following'), tr('タグ新着', 'Tags')];

  int _tab = 0;
  final _pageController = PageController();
  StreamSubscription<User?>? _authSub;
  String? _uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();
    _authSub = FirebaseAuth.instance.authStateChanges().listen((u) {
      if (u?.uid != _uid && mounted) setState(() => _uid = u?.uid);
    });
  }

  @override
  void dispose() {
    _authSub?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _select(int i) {
    setState(() => _tab = i);
    _pageController.animateToPage(i, duration: Ds.normal, curve: Ds.curve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _HomeHeader(onSearch: () => context.push('/search')),
            PillTabs(labels: _tabs, index: _tab, onChanged: _select),
            const SizedBox(height: 4),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _tab = i),
                children: [
                  const _KeepAlive(child: _RecommendedView()),
                  const _KeepAlive(child: _LatestView()),
                  _KeepAlive(key: ValueKey('follow-$_uid'), child: const _FollowingView(kind: 0)),
                  _KeepAlive(key: ValueKey('follow-tag-$_uid'), child: const _FollowingView(kind: 1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.onSearch});

  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 8, 10),
      child: Row(
        children: [
          Image.asset('assets/images/aipictors.png', width: 28, height: 28, errorBuilder: (_, __, ___) => const SizedBox(width: 28)),
          const SizedBox(width: 8),
          ShaderMask(
            shaderCallback: (r) => Ds.brandGradient.createShader(r),
            child: const Text('Aipictors', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.5)),
          ),
          const Spacer(),
          ValueListenableBuilder<bool>(
            valueListenable: GridLayout.square,
            builder: (context, square, _) => IconButton(
              tooltip: square ? tr('元の比率で並べる', 'Show original ratio') : tr('正方形にそろえる', 'Align as squares'),
              onPressed: () => GridLayout.toggle(),
              icon: Icon(square ? Icons.dashboard_rounded : Icons.grid_view_rounded, size: 24),
            ),
          ),
          IconButton(
            tooltip: tr('検索', 'Search'),
            onPressed: onSearch,
            icon: const Icon(Icons.search_rounded, size: 26),
          ),
        ],
      ),
    );
  }
}

class _KeepAlive extends StatefulWidget {
  const _KeepAlive({super.key, required this.child});

  final Widget child;

  @override
  State<_KeepAlive> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<_KeepAlive> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

/// おすすめ：人気作品のカルーセル・今日のお題・おすすめ作品
class _RecommendedView extends StatefulWidget {
  const _RecommendedView();

  @override
  State<_RecommendedView> createState() => _RecommendedViewState();
}

class _RecommendedViewState extends State<_RecommendedView> {
  List<WorkSummary> _hot = [];
  List<WorkSummary> _firstPosts = [];
  List<UserSummary> _users = [];
  Map<String, dynamic>? _theme;
  List<PromotionWork> _promotions = [];
  bool _topLoading = true;
  // 開発用: /tmp/aipictors-debug の 2 行目が scroll:<px> なら、読み込みのあとその位置まで送る（表示の確認用）
  final ScrollController? _debugScroll = DebugBoot.screenTab?.startsWith('scroll:') == true ? ScrollController() : null;

  late final _controller = PagedController<WorkSummary>(
    idOf: (w) => w.id,
    fetch: (offset, limit) async {
      final data = await Api.query(_worksQuery, variables: {
        'offset': offset,
        'limit': limit,
        'where': {'isRecommended': true, 'sort': 'DESC', 'ratings': appRatings},
      }, cacheFor: const Duration(minutes: 3));
      final recommended = WorkSummary.listFrom(data.list('works'));
      if (recommended.isNotEmpty || offset > 0) return recommended;
      // おすすめが無い日は人気順で埋める
      final popular = await Api.query(_worksQuery, variables: {
        'offset': offset,
        'limit': limit,
        'where': {'orderBy': 'LIKES_COUNT', 'sort': 'DESC', 'ratings': appRatings, 'isNowCreatedAt': true},
      }, cacheFor: const Duration(minutes: 3));
      return WorkSummary.listFrom(popular.list('works'));
    },
  );

  @override
  void initState() {
    super.initState();
    _loadTop();
    _loadPromotions();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadTop() async {
    final now = DateTime.now();
    try {
      final data = await Api.query(_homeTopQuery, variables: {
        'year': now.year,
        'month': now.month,
        'day': now.day,
      }, cacheFor: const Duration(minutes: 3));
      if (!mounted) return;
      setState(() {
        _hot = WorkSummary.listFrom(data.list('hotWorks')).take(10).toList();
        _firstPosts = WorkSummary.listFrom(data.list('newUserWorks'));
        _users = data.list('recommendedUsers').map(UserSummary.fromJson).toList();
        _theme = data.obj('dailyTheme');
        _topLoading = false;
      });
      final c = _debugScroll;
      if (c != null) {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted && c.hasClients) c.jumpTo(double.tryParse(DebugBoot.screenTab!.substring(7)) ?? 0);
        });
      }
    } catch (_) {
      if (mounted) setState(() => _topLoading = false);
    }
  }

  /// クリエイターの宣伝（失敗しても欄を出さないだけで、ほかの欄は止めない）
  Future<void> _loadPromotions() async {
    try {
      final works = await fetchHomePromotionWorks();
      if (mounted) setState(() => _promotions = works);
    } catch (_) {}
  }

  Future<void> _refresh() async {
    Api.clearCache();
    await Future.wait([_loadTop(), _loadPromotions(), _controller.refresh()]);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: _refresh,
      child: CustomScrollView(
        controller: _debugScroll,
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          // クリエイターの宣伝は Web のホームと同じく一番上（Web はお知らせのすぐ下・いま人気の上）。宣伝中の作品が無ければ出さない
          if (_promotions.isNotEmpty) SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.only(bottom: 12), child: HomePromotionSection(works: _promotions))),
          SliverToBoxAdapter(
            child: _topLoading
                ? const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Skeleton(height: 300, radius: 24),
                  )
                : _hot.isEmpty
                    ? const SizedBox.shrink()
                    : _HotCarousel(works: _hot),
          ),
          if (_theme != null) SliverToBoxAdapter(child: _ThemeCard(theme: _theme!)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(children: [
                Expanded(
                  child: _QuickLink(
                    icon: Icons.emoji_events_rounded,
                    label: tr('ランキング', 'Ranking'),
                    color: Ds.gold,
                    onTap: () => Nav.rankings(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _QuickLink(
                    icon: Icons.auto_awesome_rounded,
                    label: tr('プラン', 'Plans'),
                    color: Ds.purple,
                    onTap: () => Nav.plans(context),
                  ),
                ),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SupportRankingPreview()),
          if (_firstPosts.isNotEmpty)
            SliverToBoxAdapter(child: _WorkStrip(title: tr('新規クリエイターの初投稿作品', 'First posts from new creators'), icon: Icons.fiber_new_rounded, works: _firstPosts)),
          if (_users.isNotEmpty) SliverToBoxAdapter(child: _UserStrip(users: _users)),
          SliverToBoxAdapter(child: SectionHeader(tr('おすすめ作品', 'Recommended works'), icon: Icons.favorite_rounded)),
          SliverPagedWorks(controller: _controller),
        ],
      ),
    );
  }
}

/// 横に流れる作品の列
class _WorkStrip extends StatelessWidget {
  const _WorkStrip({required this.title, required this.icon, required this.works});

  final String title;
  final IconData icon;
  final List<WorkSummary> works;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SectionHeader(title, icon: icon),
      SizedBox(
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: works.length,
          separatorBuilder: (_, __) => const SizedBox(width: Ds.s8),
          itemBuilder: (context, i) => Pressable(
            onTap: () => Nav.work(context, works[i].id),
            child: Stack(children: [
              AppImage(works[i].imageUrl, width: 120, height: 150, radius: 12, memCacheWidth: 360),
              if (works[i].isPromotion) const Positioned(left: 6, top: 6, child: WorkPromotionMark()),
            ]),
          ),
        ),
      ),
    ]);
  }
}

/// おすすめのユーザー
class _UserStrip extends StatelessWidget {
  const _UserStrip({required this.users});

  final List<UserSummary> users;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SectionHeader(tr('おすすめのユーザー', 'Recommended creators'), icon: Icons.group_rounded),
      SizedBox(
        height: 92,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: users.length,
          separatorBuilder: (_, __) => const SizedBox(width: Ds.s12),
          itemBuilder: (context, i) => SizedBox(
            width: 68,
            child: Pressable(
              onTap: () => Nav.user(context, users[i].id),
              child: Column(children: [
                UserAvatar.summary(users[i], size: 56),
                const SizedBox(height: Ds.s6),
                Text(users[i].name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}

class _QuickLink extends StatelessWidget {
  const _QuickLink({required this.icon, required this.label, required this.color, required this.onTap});

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: context.isDark ? 0.18 : 0.1),
          borderRadius: Ds.br(16),
        ),
        child: Row(children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800))),
          Icon(Icons.chevron_right_rounded, color: context.muted),
        ]),
      ),
    );
  }
}

/// 人気作品の大きなカルーセル
class _HotCarousel extends StatefulWidget {
  const _HotCarousel({required this.works});

  final List<WorkSummary> works;

  @override
  State<_HotCarousel> createState() => _HotCarouselState();
}

class _HotCarouselState extends State<_HotCarousel> {
  final _pc = PageController(viewportFraction: 0.86);
  double _page = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pc.addListener(() => setState(() => _page = _pc.page ?? 0));
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!_pc.hasClients || widget.works.isEmpty) return;
      final next = ((_pc.page ?? 0).round() + 1) % widget.works.length;
      _pc.animateToPage(next, duration: Ds.slow, curve: Ds.curve);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.sizeOf(context).width * 0.95).clamp(260.0, 420.0);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
          child: Row(children: [
            const Icon(Icons.local_fire_department_rounded, color: Color(0xFFFF6A3D), size: 20),
            const SizedBox(width: 6),
            Text(tr('いま人気', 'Trending now'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
          ]),
        ),
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: _pc,
            itemCount: widget.works.length,
            itemBuilder: (context, i) {
              final w = widget.works[i];
              final delta = (i - _page).abs().clamp(0.0, 1.0);
              return Transform.scale(
                scale: 1 - delta * 0.06,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Pressable(
                    scale: 0.98,
                    onTap: () => Nav.work(context, w.id),
                    child: ClipRRect(
                      borderRadius: Ds.br(24),
                      child: Stack(fit: StackFit.expand, children: [
                        AppImage(w.imageUrl, memCacheWidth: 900),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.55, 1],
                              colors: [Colors.transparent, Color(0xCC000000)],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 14,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(
                              w.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 6),
                            Row(children: [
                              UserAvatar.summary(w.user, size: 22),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(w.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                              ),
                              ValueListenableBuilder<bool>(
                                valueListenable: ListLikeCount.hidden,
                                builder: (context, hidden, _) => hidden
                                    ? const SizedBox.shrink()
                                    : Row(mainAxisSize: MainAxisSize.min, children: [
                                        const Icon(Icons.favorite_rounded, color: Ds.pink, size: 16),
                                        const SizedBox(width: 4),
                                        Text(compactCount(w.likesCount), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                      ]),
                              ),
                            ]),
                          ]),
                        ),
                        Positioned(top: 12, left: 12, child: Badge2('#${i + 1}', color: i < 3 ? const Color(0xE6E2A21B) : null)),
                      ]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.works.length, (i) {
            final active = (_page.round() == i);
            return AnimatedContainer(
              duration: Ds.normal,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: Ds.br(3),
                color: active ? context.cs.primary : context.hairline,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _ThemeCard extends StatelessWidget {
  const _ThemeCard({required this.theme});

  final Map<String, dynamic> theme;

  @override
  Widget build(BuildContext context) {
    // 先頭の作品が出せない年齢区分なら絵は出さない
    final image = allowedThumbnail(theme.obj('firstWork'), 'largeThumbnailImageURL');
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Pressable(
        onTap: () => context.push('/themes/${theme.integer('year')}/${theme.integer('month')}/${theme.integer('day')}'),
        child: Container(
          height: 92,
          decoration: BoxDecoration(
            borderRadius: Ds.br(20),
            gradient: const LinearGradient(colors: [Color(0xFFFFE7B0), Color(0xFFFFC2D4)]),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr('今日のお題', "Today's theme"), style: const TextStyle(color: Color(0xFF8A4B00), fontWeight: FontWeight.w800, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(localizedContent(theme.str('title'), theme.strOrNull('enTitle')),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Color(0xFF2B1A00), fontWeight: FontWeight.w900, fontSize: 20)),
                  const SizedBox(height: 2),
                  Text(tr('${theme.integer('worksCount')}作品が参加中・参加してみよう', '${theme.integer('worksCount')} works so far · Join in'),
                      style: const TextStyle(color: Color(0xFF6B4A1F), fontSize: 12)),
                ],
              ),
            ),
            if (image != null)
              SizedBox(
                width: 92,
                height: 92,
                child: AppImage(image, memCacheWidth: 300),
              ),
          ]),
        ),
      ),
    );
  }
}

/// フォロー中のユーザー・タグの新着
class _FollowingView extends StatefulWidget {
  const _FollowingView({required this.kind});

  /// 0: ユーザー 1: タグ
  final int kind;

  @override
  State<_FollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends State<_FollowingView> {
  int get _kind => widget.kind;

  late final PagedController<WorkSummary> _controller = _create();

  PagedController<WorkSummary> _create() {
    final type = _kind == 0 ? 'FOLLOW_USER' : 'FOLLOW_TAG';
    return PagedController<WorkSummary>(
      idOf: (w) => w.id,
      fetch: (offset, limit) async {
        final uid = await _viewerId();
        if (uid == null) return [];
        final data = await Api.query(_feedQuery, variables: {
          'offset': offset,
          'limit': limit,
          'feedWhere': {'userId': uid, 'type': type},
          'feedPostsWhere': {'ratings': appRatings},
        });
        final posts = data.obj('feed')?.list('posts') ?? const [];
        return WorkSummary.listFrom(posts.map((p) => p.obj('work')).whereType<Map<String, dynamic>>().toList());
      },
    );
  }

  static String? _cachedViewerId;
  static String? _cachedUid;

  Future<String?> _viewerId() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    if (_cachedUid == uid && _cachedViewerId != null) return _cachedViewerId;
    final data = await Api.query('query AppViewerId { viewer { user { id } } }');
    _cachedUid = uid;
    _cachedViewerId = data.obj('viewer')?.obj('user')?.strOrNull('id');
    return _cachedViewerId;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!Nav.isLoggedIn) {
      return LoginRequiredView(
        icon: Icons.people_alt_rounded,
        title: tr('フォローした人の新着が届きます', 'New works from people you follow'),
        message: tr('ログインすると、フォローしたクリエイターやタグの新しい作品がここに並びます。', 'Log in to see new works from creators and tags you follow.'),
        onLogin: () => Nav.login(context),
      );
    }
    return RefreshIndicator.adaptive(
      onRefresh: () {
        Api.clearCache();
        return _controller.refresh();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          // フォロー中の人を投稿者ごとに、最近投稿した順で見る（Web のフォロー新着の 👤 と同じ）
          if (_kind == 0)
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton.icon(
                    onPressed: () async {
                      final id = await _viewerId();
                      if (id == null || !context.mounted) return;
                      context.push('/users/$id/followees?order=posted');
                    },
                    icon: const Icon(Icons.people_outline_rounded, size: 18),
                    label: Text(tr('投稿者ごとに見る', 'By creator')),
                  ),
                ),
              ),
            ),
          SliverPagedWorks(
            controller: _controller,
            emptyIcon: _kind == 0 ? Icons.person_add_alt_1_rounded : Icons.tag_rounded,
            emptyTitle: _kind == 0 ? tr('まだ新着がありません', 'Nothing new yet') : tr('フォロー中のタグの新着がありません', 'No new works in followed tags'),
            emptyMessage: _kind == 0
                ? tr('気になるクリエイターをフォローすると、新しい作品がここに届きます。', 'Follow creators you like and their new works will show up here.')
                : tr('作品ページのタグからタグをフォローできます。', 'You can follow tags from the tags on a work page.'),
          ),
        ],
      ),
    );
  }
}

/// 新着（Web の新着タブ: 新着 / 人気 / 新規ユーザと、新着の絞り込み）
class _LatestView extends StatefulWidget {
  const _LatestView();

  @override
  State<_LatestView> createState() => _LatestViewState();
}

class _LatestViewState extends State<_LatestView> {
  LatestView _view = LatestView.latest;
  LatestFilter _filter = const LatestFilter();
  late PagedController<WorkSummary> _controller = _create();

  PagedController<WorkSummary> _create() {
    final view = _view;
    final f = _filter;
    return PagedController<WorkSummary>(
      idOf: (w) => w.id,
      pageSize: view == LatestView.latest ? 24 : 100,
      fetch: (offset, limit) async {
        switch (view) {
          case LatestView.latest:
            final data = await Api.query(_worksQuery, variables: {'offset': offset, 'limit': limit, 'where': f.where(appRatings, DateTime.now())});
            return WorkSummary.listFrom(data.list('works'));
          case LatestView.popular:
            // 最近の人気作品（Web の「人気」と同じ hotWorks）
            if (offset > 0) return const [];
            final data = await Api.query(_latestHotQuery, cacheFor: const Duration(minutes: 3));
            return WorkSummary.listFrom(data.list('hotWorks'));
          case LatestView.newUsers:
            // 新規登録されたユーザの作品（Web の「新規ユーザ」と同じ newUserWorks）
            if (offset > 0) return const [];
            final data = await Api.query(_latestNewUsersQuery, variables: {
              'where': {'ratings': appRatings, 'isNowCreatedAt': true},
            }, cacheFor: const Duration(minutes: 3));
            return WorkSummary.listFrom(data.list('newUserWorks'));
        }
      },
    );
  }

  void _reset({LatestView? view, LatestFilter? filter}) {
    final old = _controller;
    setState(() {
      if (view != null) _view = view;
      if (filter != null) _filter = filter;
      _controller = _create();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openFilter() async {
    final f = await _showLatestFilterSheet(context, _filter);
    if (f != null) _reset(filter: f);
  }

  @override
  Widget build(BuildContext context) {
    final active = _filter.activeCount;
    return RefreshIndicator.adaptive(
      onRefresh: () {
        Api.clearCache();
        return _controller.refresh();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 12, 2),
              child: Row(children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SegmentedButton<LatestView>(
                      showSelectedIcon: false,
                      style: const ButtonStyle(visualDensity: VisualDensity.compact),
                      segments: [
                        ButtonSegment(value: LatestView.latest, label: Text(tr('新着', 'New'))),
                        ButtonSegment(value: LatestView.popular, label: Text(tr('人気', 'Popular')), tooltip: tr('最近投稿された人気作品', 'Recently popular works')),
                        ButtonSegment(value: LatestView.newUsers, label: Text(tr('新規ユーザ', 'New users')), tooltip: tr('新規登録されたユーザの作品', 'Works by newly registered users')),
                      ],
                      selected: {_view},
                      onSelectionChanged: (v) {
                        Ds.tap();
                        _reset(view: v.first);
                      },
                    ),
                  ),
                ),
                if (_view == LatestView.latest) ...[
                  const SizedBox(width: 8),
                  ActionChip(
                    avatar: Icon(Icons.tune_rounded, size: 16, color: active > 0 ? context.cs.onPrimary : null),
                    label: Text(active > 0 ? tr('絞り込み $active', 'Filters $active') : tr('絞り込み', 'Filters')),
                    labelStyle: TextStyle(fontWeight: FontWeight.w700, color: active > 0 ? context.cs.onPrimary : null),
                    backgroundColor: active > 0 ? context.cs.primary : null,
                    shape: RoundedRectangleBorder(borderRadius: Ds.br(18)),
                    onPressed: _openFilter,
                  ),
                ],
              ]),
            ),
          ),
          SliverPagedWorks(
            key: ObjectKey(_controller),
            controller: _controller,
            emptyMessage: _view == LatestView.latest && active > 0 ? tr('絞り込みを変えると見つかるかもしれません', 'Try changing the filters') : null,
          ),
        ],
      ),
    );
  }
}

const _latestHotQuery = '''
query AppLatestHotWorks {
  hotWorks(where: { isSensitive: false }) {
    $workCardFields
  }
}''';

const _latestNewUsersQuery = '''
query AppLatestNewUserWorks(\$where: NewUsersWorksWhereInput) {
  newUserWorks(offset: 0, limit: 20, where: \$where) {
    $workCardFields
  }
}''';

/// 新着の絞り込み（種類・プロンプト・並び順・期間・ユーザー毎に1作品）
Future<LatestFilter?> _showLatestFilterSheet(BuildContext context, LatestFilter initial) {
  return showModalBottomSheet<LatestFilter>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      var f = initial;
      return StatefulBuilder(builder: (context, set) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(child: Text(tr('絞り込み', 'Filters'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900))),
                TextButton(onPressed: () => set(() => f = const LatestFilter()), child: Text(tr('リセット', 'Reset'))),
              ]),
              const SizedBox(height: 12),
              ChoiceRow<(String?, String, String)>(
                title: tr('種類', 'Type'),
                values: latestWorkTypes,
                labelOf: (v) => tr(v.$2, v.$3),
                selected: latestWorkTypes.firstWhere((v) => v.$1 == f.workType),
                onChanged: (v) => set(() => f = f.copyWith(workType: () => v.$1)),
              ),
              ChoiceRow<bool?>(
                title: tr('プロンプト', 'Prompt'),
                values: const [null, true, false],
                labelOf: (v) => v == null ? tr('すべて', 'All') : (v ? tr('あり', 'Yes') : tr('なし', 'No')),
                selected: f.hasPrompt,
                onChanged: (v) => set(() => f = f.copyWith(hasPrompt: () => v)),
              ),
              ChoiceRow<LatestSort>(title: tr('並び順', 'Sort'), values: LatestSort.values, labelOf: (v) => v.label, selected: f.sort, onChanged: (v) => set(() => f = f.copyWith(sort: v))),
              ChoiceRow<LatestRange>(title: tr('期間', 'Period'), values: LatestRange.values, labelOf: (v) => v.label, selected: f.range, onChanged: (v) => set(() => f = f.copyWith(range: v))),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: Text(tr('ユーザー毎に1作品', 'One work per user'), style: const TextStyle(fontWeight: FontWeight.w700)),
                value: f.oneWorkPerUser,
                onChanged: (v) => set(() => f = f.copyWith(oneWorkPerUser: v)),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(50), shape: RoundedRectangleBorder(borderRadius: Ds.br(25))),
                  onPressed: () => Navigator.pop(context, f),
                  child: Text(tr('この条件で表示', 'Apply'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                ),
              ),
            ]),
          ),
        );
      });
    },
  );
}
