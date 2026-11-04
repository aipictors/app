import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';

const _worksQuery = '''
query AppBrowseWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    $workCardFields
  }
}''';

/// 条件を決めて作品を並べる画面（新着・2D/2.5D/3D・小説・ノート・動画）
class WorksBrowseScreen extends StatefulWidget {
  const WorksBrowseScreen({super.key, required this.title, this.where = const {}});

  final String title;
  final Map<String, dynamic> where;

  @override
  State<WorksBrowseScreen> createState() => _WorksBrowseScreenState();
}

class _WorksBrowseScreenState extends State<WorksBrowseScreen> {
  static const _labels = ['新着', '人気'];
  int _sort = 0;
  late PagedController<WorkSummary> _c = _make();

  PagedController<WorkSummary> _make() {
    final sort = _sort;
    return PagedController(
      idOf: (w) => w.id,
      fetch: (offset, limit) async {
        final data = await Api.query(_worksQuery, variables: {
          'offset': offset,
          'limit': limit,
          'where': {
            'ratings': appRatings,
            'orderBy': sort == 0 ? 'DATE_CREATED' : 'LIKES_COUNT',
            'sort': 'DESC',
            ...widget.where,
          },
        }, cacheFor: const Duration(minutes: 3));
        return WorkSummary.listFrom(data.list('works'));
      },
    );
  }

  void _select(int i) {
    if (i == _sort) return;
    setState(() {
      _c.dispose();
      _sort = i;
      _c = _make();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w800))),
      body: AppRefresh(
        onRefresh: _c.refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Ds.s8),
                child: PillTabs(labels: _labels, index: _sort, onChanged: _select),
              ),
            ),
            SliverPagedWorks(key: ValueKey(_sort), controller: _c),
            const SliverToBoxAdapter(child: SizedBox(height: Ds.s32)),
          ],
        ),
      ),
    );
  }
}

const _tagsQuery = '''
query AppTagsIndex {
  hotTags { id name firstWork { smallThumbnailImageURL rating } }
}''';

/// タグの一覧（いま人気・よく使われる）。写真は全年齢の作品だけ
class TagsScreen extends StatefulWidget {
  const TagsScreen({super.key});

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  late Future<List<List<TagSummary>>> _f = _load();

  Future<List<List<TagSummary>>> _load() async {
    final results = await Future.wait([
      Api.query(_tagsQuery, cacheFor: const Duration(minutes: 10)).then((d) => d
          .list('hotTags')
          .map((t) => TagSummary(name: t.str('name'), thumbnailUrl: t.obj('firstWork')?.str('rating') == 'G' ? t.obj('firstWork')?.strOrNull('smallThumbnailImageURL') : null))
          .where((t) => t.name.isNotEmpty)
          .toList()),
      ExploreApi.popularTags(limit: 48),
    ]);
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('タグ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: FutureBuilder<List<List<TagSummary>>>(
        future: _f,
        builder: (context, snap) {
          if (snap.hasError) {
            return StateView.error('タグを読み込めませんでした', onRetry: () => setState(() => _f = _load()));
          }
          if (!snap.hasData) return const SkeletonGrid();
          final hot = snap.data![0];
          final seen = hot.map((t) => t.name).toSet();
          final popular = snap.data![1].where((t) => !seen.contains(t.name)).toList();
          Widget grid(List<TagSummary> tags) => SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: Ds.s16),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: Ds.s8,
                    crossAxisSpacing: Ds.s8,
                    childAspectRatio: 2,
                  ),
                  itemCount: tags.length,
                  itemBuilder: (context, i) => TagCard(tag: tags[i], width: null, onTap: () => Nav.tag(context, tags[i].name)),
                ),
              );
          return CustomScrollView(slivers: [
            if (hot.isNotEmpty) ...[
              const SliverToBoxAdapter(child: SectionHeader('いま人気のタグ', icon: Icons.local_fire_department_rounded)),
              grid(hot),
            ],
            if (popular.isNotEmpty) ...[
              const SliverToBoxAdapter(child: SectionHeader('よく使われるタグ', icon: Icons.tag_rounded)),
              grid(popular),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: Ds.s32)),
          ]);
        },
      ),
    );
  }
}
