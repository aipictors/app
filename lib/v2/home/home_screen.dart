import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
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
  dailyTheme(year: \$year, month: \$month, day: \$day) {
    id
    title
    worksCount
    dateText
    firstWork { largeThumbnailImageURL }
  }
}''';

/// ホームタブ（おすすめ・フォロー中・新着）
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _tabs = ['おすすめ', 'フォロー中', '新着'];

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
                  _KeepAlive(key: ValueKey('follow-$_uid'), child: const _FollowingView()),
                  const _KeepAlive(child: _LatestView()),
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
          IconButton(
            tooltip: '検索',
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
  Map<String, dynamic>? _theme;
  bool _topLoading = true;

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
        _theme = data.obj('dailyTheme');
        _topLoading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _topLoading = false);
    }
  }

  Future<void> _refresh() async {
    Api.clearCache();
    await Future.wait([_loadTop(), _controller.refresh()]);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: _refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
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
                    label: 'ランキング',
                    color: Ds.gold,
                    onTap: () => Nav.rankings(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _QuickLink(
                    icon: Icons.auto_awesome_rounded,
                    label: 'プラン',
                    color: Ds.purple,
                    onTap: () => Nav.plans(context),
                  ),
                ),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SectionHeader('おすすめ作品', icon: Icons.favorite_rounded)),
          SliverPagedWorks(controller: _controller),
        ],
      ),
    );
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
            Text('いま人気', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
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
                              Avatar(w.user.iconUrl, size: 22),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(w.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                              ),
                              const Icon(Icons.favorite_rounded, color: Ds.pink, size: 16),
                              const SizedBox(width: 4),
                              Text(compactCount(w.likesCount), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
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
    final image = theme.obj('firstWork')?.strOrNull('largeThumbnailImageURL');
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Pressable(
        onTap: () => context.push('/daily_themes/${theme.str('id')}'),
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
                  const Text('今日のお題', style: TextStyle(color: Color(0xFF8A4B00), fontWeight: FontWeight.w800, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(theme.str('title'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Color(0xFF2B1A00), fontWeight: FontWeight.w900, fontSize: 20)),
                  const SizedBox(height: 2),
                  Text('${theme.integer('worksCount')}作品が参加中・参加してみよう',
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
  const _FollowingView();

  @override
  State<_FollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends State<_FollowingView> {
  int _kind = 0; // 0: ユーザー 1: タグ

  late PagedController<WorkSummary> _controller = _create();

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

  void _switch(int k) {
    if (k == _kind) return;
    setState(() {
      _controller.dispose();
      _kind = k;
      _controller = _create();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!Nav.isLoggedIn) {
      return LoginRequiredView(
        icon: Icons.people_alt_rounded,
        title: 'フォローした人の新着が届きます',
        message: 'ログインすると、フォローしたクリエイターやタグの新しい作品がここに並びます。',
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
              child: SegmentedButton<int>(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(value: 0, icon: Icon(Icons.person_rounded, size: 18), label: Text('ユーザー')),
                  ButtonSegment(value: 1, icon: Icon(Icons.tag_rounded, size: 18), label: Text('タグ')),
                ],
                selected: {_kind},
                onSelectionChanged: (s) => _switch(s.first),
              ),
            ),
          ),
          SliverPagedWorks(
            key: ValueKey(_kind),
            controller: _controller,
            emptyIcon: _kind == 0 ? Icons.person_add_alt_1_rounded : Icons.tag_rounded,
            emptyTitle: _kind == 0 ? 'まだ新着がありません' : 'フォロー中のタグの新着がありません',
            emptyMessage: _kind == 0
                ? '気になるクリエイターをフォローすると、新しい作品がここに届きます。'
                : '作品ページのタグからタグをフォローできます。',
          ),
        ],
      ),
    );
  }
}

/// 新着（全体）
class _LatestView extends StatefulWidget {
  const _LatestView();

  @override
  State<_LatestView> createState() => _LatestViewState();
}

class _LatestViewState extends State<_LatestView> {
  static const _types = [
    ('すべて', null),
    ('イラスト', 'WORK'),
    ('小説', 'NOVEL'),
    ('動画', 'VIDEO'),
  ];

  int _type = 0;
  late PagedController<WorkSummary> _controller = _create();

  PagedController<WorkSummary> _create() {
    final t = _types[_type];
    return PagedController<WorkSummary>(
      idOf: (w) => w.id,
      fetch: (offset, limit) async {
        final where = <String, dynamic>{'ratings': appRatings, 'sort': 'DESC'};
        if (t.$2 != null) where['workType'] = t.$2;
        final data = await Api.query(_worksQuery, variables: {'offset': offset, 'limit': limit, 'where': where});
        return WorkSummary.listFrom(data.list('works'));
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 10, bottom: 2),
              child: SizedBox(
                height: 34,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    for (var i = 0; i < _types.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(_types[i].$1),
                            selected: _type == i,
                            onSelected: (_) => setState(() {
                              _controller.dispose();
                              _type = i;
                              _controller = _create();
                            }),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
          SliverPagedWorks(key: ValueKey(_type), controller: _controller),
        ],
      ),
    );
  }
}
