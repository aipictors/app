import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/explore/ranking_screen.dart';
import 'package:aipictors/v2/explore/search_input_screen.dart';
import 'package:aipictors/v2/explore/theme_works_screen.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';

export 'package:aipictors/v2/explore/ranking_screen.dart' show RankingScreen;
export 'package:aipictors/v2/explore/search_result_screen.dart' show SearchResultScreen;
export 'package:aipictors/v2/explore/tag_screen.dart' show TagScreen;

/// 「探す」タブ（検索の入口・人気タグ・ランキング・お題・話題の作品）
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Future<List<TagSummary>> _tags;
  late Future<List<RankedWork>> _ranking;
  late Future<DailyTheme?> _theme;
  late final PagedController<WorkSummary> _hot = PagedController(
    pageSize: 200,
    idOf: (w) => w.id,
    fetch: (offset, limit) async => offset == 0 ? ExploreApi.hotWorks() : const <WorkSummary>[],
  );

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    _tags = ExploreApi.popularTags(limit: 20);
    _ranking = RankingLoader.latest(RankingPeriod.daily, limit: 12, tries: 4).then((r) => r.items);
    _theme = ExploreApi.todayTheme();
  }

  @override
  void dispose() {
    _hot.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    setState(_load);
    await Future.wait([_hot.refresh(), _tags.then((_) {}, onError: (_) {})]);
  }

  Future<void> _openSearch() async {
    final text = await SearchInputScreen.open(context);
    if (text != null && mounted) Nav.search(context, text);
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 700;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator.adaptive(
        onRefresh: _refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 12, 12),
                child: Row(children: [
                  ShaderMask(
                    shaderCallback: (r) => Ds.brandGradient.createShader(r),
                    child: const Icon(Icons.explore_rounded, size: 30, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text('探す', style: context.tt.headlineSmall?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5))),
                  IconButton(
                    tooltip: 'ランキング',
                    onPressed: () => Nav.rankings(context),
                    icon: const Icon(Icons.emoji_events_rounded),
                  ),
                ]),
              ),
            ),
            SliverPersistentHeader(pinned: true, delegate: _SearchHeader(onTap: _openSearch)),
            SliverToBoxAdapter(child: _themeCard()),
            SliverToBoxAdapter(child: _tagsSection(wide)),
            SliverToBoxAdapter(child: _rankingSection()),
            const SliverToBoxAdapter(child: SectionHeader('いま話題の作品', icon: Icons.local_fire_department_rounded)),
            SliverPagedWorks(controller: _hot, emptyTitle: '話題の作品がまだありません'),
          ],
        ),
      ),
      ),
    );
  }

  Widget _themeCard() {
    return FutureBuilder<DailyTheme?>(
      future: _theme,
      builder: (context, snap) {
        final t = snap.data;
        if (snap.connectionState != ConnectionState.done) {
          return const Padding(padding: EdgeInsets.fromLTRB(16, 12, 16, 0), child: Skeleton(height: 96, radius: 20));
        }
        if (t == null) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Pressable(
            scale: 0.98,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ThemeWorksScreen(theme: t))),
            child: Container(
              height: 96,
              decoration: BoxDecoration(
                borderRadius: Ds.br(20),
                gradient: const LinearGradient(colors: [Color(0xFFFF8A5B), Color(0xFFFF5C8A), Color(0xFF8B5CF6)]),
                boxShadow: [BoxShadow(color: const Color(0xFFFF5C8A).withValues(alpha: 0.25), blurRadius: 18, offset: const Offset(0, 8))],
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: t.thumbnailUrl != null
                        ? AppImage(t.thumbnailUrl, radius: 14, memCacheWidth: 240)
                        : Container(
                            decoration: BoxDecoration(color: Colors.white24, borderRadius: Ds.br(14)),
                            child: const Icon(Icons.lightbulb_rounded, color: Colors.white, size: 34),
                          ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: Ds.br(8)),
                        child: const Text('今日のお題', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
                      ),
                      const SizedBox(height: 4),
                      Text(t.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
                      Text('${compactCount(t.worksCount)}作品が参加中', style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.chevron_right_rounded, color: Colors.white)),
              ]),
            ),
          ),
        );
      },
    );
  }

  Widget _tagsSection(bool wide) {
    return FutureBuilder<List<TagSummary>>(
      future: _tags,
      builder: (context, snap) {
        final loading = snap.connectionState != ConnectionState.done;
        final tags = snap.data ?? const [];
        if (!loading && tags.isEmpty) return const SizedBox.shrink();
        final h = wide ? 104.0 : 88.0;
        final w = wide ? 160.0 : 132.0;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SectionHeader('人気のタグ', icon: Icons.tag_rounded),
          SizedBox(
            height: h * 2 + 10,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: h / w,
              ),
              itemCount: loading ? 10 : tags.length,
              itemBuilder: (context, i) {
                if (loading) return const Skeleton(radius: 16);
                final t = tags[i];
                return TagCard(tag: t, width: null, height: h, onTap: () => Nav.tag(context, t.name));
              },
            ),
          ),
        ]);
      },
    );
  }

  Widget _rankingSection() {
    return FutureBuilder<List<RankedWork>>(
      future: _ranking,
      builder: (context, snap) {
        final loading = snap.connectionState != ConnectionState.done;
        final items = snap.data ?? const [];
        if (!loading && items.isEmpty) return const SizedBox.shrink();
        const h = 220.0;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SectionHeader('デイリーランキング', icon: Icons.emoji_events_rounded, onMore: () => Nav.rankings(context)),
          SizedBox(
            height: h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: loading ? 5 : items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                if (loading) return const SizedBox(width: h * 0.72, child: Skeleton(radius: 14));
                final r = items[i];
                return SizedBox(
                  width: h * 0.72,
                  child: Pressable(
                    onTap: () => Nav.work(context, r.work.id),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(
                        child: Stack(fit: StackFit.expand, children: [
                          AppImage(r.work.imageUrl, radius: 14, memCacheWidth: 450),
                          Positioned(left: 6, top: 6, child: RankBadge(rank: r.rank, size: 30)),
                        ]),
                      ),
                      const SizedBox(height: 6),
                      Text(r.work.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(fontWeight: FontWeight.w700)),
                      Text(r.work.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.labelSmall?.copyWith(color: context.muted)),
                    ]),
                  ),
                );
              },
            ),
          ),
        ]);
      },
    );
  }
}

/// 上に貼りつく検索欄
class _SearchHeader extends SliverPersistentHeaderDelegate {
  _SearchHeader({required this.onTap});

  final VoidCallback onTap;

  @override
  double get maxExtent => 66;

  @override
  double get minExtent => 66;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: SearchPill(onTap: onTap),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _SearchHeader old) => false;
}
