import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/explore/work_filter_sheet.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

/// タグの作品一覧
class TagScreen extends StatefulWidget {
  const TagScreen({super.key, required this.name});

  final String name;

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  WorkFilter _filter = const WorkFilter();
  late PagedController<WorkSummary> _c = _make();
  int? _count;
  bool? _following;
  bool _followBusy = false;
  String? _cover;
  final _scroll = ScrollController();
  bool _collapsed = false;

  String get _name => widget.name.trim().replaceFirst(RegExp(r'^#+'), '');

  PagedController<WorkSummary> _make() {
    final c = PagedController<WorkSummary>(
      pageSize: 32,
      idOf: (w) => w.id,
      fetch: (o, l) => ExploreApi.tagWorks(_name, _filter, o, l),
    );
    c.addListener(() {
      if (_cover == null && c.items.isNotEmpty && mounted) setState(() => _cover = c.items.first.imageUrl);
    });
    return c;
  }

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      final c = _scroll.offset > 130;
      if (c != _collapsed) setState(() => _collapsed = c);
    });
    _loadMeta();
  }

  void _loadMeta() {
    ExploreApi.tagWorksCount(_name, _filter).then((v) {
      if (mounted) setState(() => _count = v);
    }).catchError((_) {});
    if (Nav.isLoggedIn) {
      ExploreApi.isFollowingTag(_name).then((v) {
        if (mounted) setState(() => _following = v);
      }).catchError((_) {});
    } else {
      _following = false;
    }
  }

  @override
  void dispose() {
    _c.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _setFilter(WorkFilter f) {
    final old = _c;
    setState(() {
      _filter = f;
      _count = null;
      _c = _make();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
    ExploreApi.tagWorksCount(_name, f).then((v) {
      if (mounted && f == _filter) setState(() => _count = v);
    }).catchError((_) {});
  }

  Future<void> _toggleFollow() async {
    if (_followBusy || !Nav.requireLogin(context)) return;
    final next = !(_following ?? false);
    Ds.impact();
    setState(() {
      _following = next;
      _followBusy = true;
    });
    try {
      await ExploreApi.followTag(_name, next);
      if (mounted) context.toast(next ? '#$_name をフォローしました' : 'フォローを解除しました', icon: next ? Icons.bookmark_added_rounded : Icons.bookmark_remove_rounded);
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => _following = !next);
        context.toast(e.message, error: true);
      }
    } finally {
      if (mounted) setState(() => _followBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final colors = tagColors(_name);
    return Scaffold(
      body: RefreshIndicator.adaptive(
        edgeOffset: top + kToolbarHeight,
        onRefresh: () async {
          _loadMeta();
          await _c.refresh();
        },
        child: CustomScrollView(
          controller: _scroll,
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              expandedHeight: 200,
              foregroundColor: Colors.white,
              backgroundColor: Color.lerp(colors.first, Colors.black, 0.35),
              title: AnimatedOpacity(
                duration: Ds.fast,
                opacity: _collapsed ? 1 : 0,
                child: Text('#$_name', style: const TextStyle(fontWeight: FontWeight.w800)),
              ),
              actions: [
                IconButton(
                  tooltip: '共有',
                  icon: const Icon(Icons.ios_share_rounded),
                  onPressed: () => Share.share('#$_name のAIイラスト https://www.aipictors.com/tags/${Uri.encodeComponent(_name)}'),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(fit: StackFit.expand, children: [
                  DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight))),
                  if (_cover != null) AnimatedOpacity(opacity: 1, duration: Ds.slow, child: AppImage(_cover, memCacheWidth: 900)),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x66000000), Color(0x22000000), Color(0xCC000000)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 16,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            '#$_name',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.15),
                          ),
                          const SizedBox(height: 4),
                          AnimatedSwitcher(
                            duration: Ds.fast,
                            child: Text(
                              _count == null ? '　' : '${_formatCount(_count!)}作品',
                              key: ValueKey(_count),
                              style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontWeight: FontWeight.w700),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(width: 12),
                      _followButton(),
                    ]),
                  ),
                ]),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: WorkFilterBar(
                filter: _filter,
                sorts: const [WorkSort.likes, WorkSort.latest, WorkSort.views, WorkSort.bookmarks, WorkSort.comments],
                onChanged: _setFilter,
              ),
            ),
            SliverPagedWorks(
              key: ObjectKey(_c),
              controller: _c,
              emptyTitle: 'このタグの作品はまだありません',
              emptyMessage: _filter.activeCount > 0 ? '絞り込みを変えると見つかるかもしれません' : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _followButton() {
    final f = _following;
    if (f == null) return const SizedBox(width: 40, height: 40);
    return Pressable(
      onTap: _toggleFollow,
      child: AnimatedContainer(
        duration: Ds.normal,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: f ? Colors.white.withValues(alpha: 0.2) : Colors.white,
          borderRadius: Ds.br(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.7)),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(f ? Icons.check_rounded : Icons.add_rounded, size: 18, color: f ? Colors.white : Colors.black87),
          const SizedBox(width: 4),
          Text(f ? 'フォロー中' : 'フォロー', style: TextStyle(fontWeight: FontWeight.w800, color: f ? Colors.white : Colors.black87)),
        ]),
      ),
    );
  }
}

String _formatCount(int n) {
  final s = n.toString();
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return b.toString();
}
