import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/explore/search_input_screen.dart';
import 'package:aipictors/v2/explore/work_filter_sheet.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/user/user_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';

/// 検索結果（作品・ユーザー・タグ）
class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key, required this.text});

  final String text;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late String _text = _normalize(widget.text);

  static String _normalize(String t) => t.trim().replaceFirst(RegExp(r'^#+'), '');

  @override
  void initState() {
    super.initState();
    if (_text.isNotEmpty) RecentSearches.add(_text);
  }

  Future<void> _edit() async {
    final t = await SearchInputScreen.open(context, initialText: _text);
    if (t != null && mounted && t != _text) setState(() => _text = _normalize(t));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: Navigator.of(context).canPop() ? 0 : 16,
          title: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SearchPill(text: _text, onTap: _edit, height: 42),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            dividerColor: context.hairline,
            tabs: const [Tab(text: '作品'), Tab(text: 'ユーザー'), Tab(text: 'タグ')],
          ),
        ),
        body: KeyedSubtree(
          key: ValueKey(_text),
          child: TabBarView(children: [
            _WorksTab(text: _text),
            _UsersTab(text: _text),
            _TagsTab(text: _text),
          ]),
        ),
      ),
    );
  }
}

class _WorksTab extends StatefulWidget {
  const _WorksTab({required this.text});

  final String text;

  @override
  State<_WorksTab> createState() => _WorksTabState();
}

class _WorksTabState extends State<_WorksTab> with AutomaticKeepAliveClientMixin {
  WorkFilter _filter = const WorkFilter();
  SearchMode? _mode;
  int? _tagCount;
  PagedController<WorkSummary>? _c;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _decideMode();
  }

  /// タグの完全一致があればタグ、無ければキーワード（Web と同じ考え方）
  Future<void> _decideMode() async {
    int tagCount = 0;
    try {
      tagCount = await ExploreApi.tagWorksCount(widget.text);
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _tagCount = tagCount;
      _mode = tagCount > 0 ? SearchMode.tag : SearchMode.keyword;
      _c = _make();
    });
    _loadCounts();
  }

  void _loadCounts() {
    final f = _filter;
    ExploreApi.tagWorksCount(widget.text, f).then((v) {
      if (mounted && f == _filter) setState(() => _tagCount = v);
    }).catchError((_) {});
  }

  PagedController<WorkSummary> _make() {
    final mode = _mode!;
    final f = _filter;
    return PagedController(
      pageSize: 30,
      idOf: (w) => w.id,
      fetch: (o, l) => mode == SearchMode.tag ? ExploreApi.tagWorks(widget.text, f, o, l) : ExploreApi.keywordWorks(widget.text, f, o, l),
    );
  }

  void _reset({WorkFilter? filter, SearchMode? mode}) {
    final old = _c;
    setState(() {
      if (filter != null) {
        _filter = filter;
        _tagCount = null;
      }
      if (mode != null) _mode = mode;
      _c = _make();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => old?.dispose());
    if (filter != null) _loadCounts();
  }

  @override
  void dispose() {
    _c?.dispose();
    _placeholder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final c = _c;
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        _loadCounts();
        await c?.refresh();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverToBoxAdapter(child: _modeRow(context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: WorkFilterBar(
                filter: _filter,
                sorts: const [WorkSort.likes, WorkSort.latest, WorkSort.views, WorkSort.bookmarks],
                onChanged: (f) => _reset(filter: f),
              ),
            ),
          ),
          if (c == null)
            SliverPagedWorks(controller: _placeholder)
          else
            SliverPagedWorks(
              key: ObjectKey(c),
              controller: c,
              emptyTitle: '「${widget.text}」の作品は見つかりませんでした',
              emptyMessage: _mode == SearchMode.tag ? '「キーワード」に切り替えるとタイトルや説明からも探せます' : '別の言葉や、絞り込みを変えて試してみてください',
            ),
        ],
      ),
    );
  }

  // モードが決まるまでスケルトンを出すための空の一覧
  late final PagedController<WorkSummary> _placeholder = PagedController(fetch: (_, __) => Future.delayed(const Duration(days: 1), () => const []));

  Widget _modeRow(BuildContext context) {
    Widget seg(SearchMode m, String label, {int? count, String? caption}) {
      final sel = _mode == m;
      return Expanded(
        child: GestureDetector(
          onTap: _mode == null || sel
              ? null
              : () {
                  Ds.tap();
                  _reset(mode: m);
                },
          child: AnimatedContainer(
            duration: Ds.normal,
            curve: Ds.curve,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: sel ? context.surfaceCard : Colors.transparent,
              borderRadius: Ds.br(12),
              boxShadow: sel ? [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 2))] : null,
            ),
            child: Column(children: [
              Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: sel ? context.cs.onSurface : context.muted)),
              const SizedBox(height: 2),
              Text(caption ?? (count == null ? '…' : '${compactCount(count)}件'), style: TextStyle(fontSize: 11, color: context.muted, fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(15)),
        child: Row(children: [
          seg(SearchMode.tag, 'タグ「${widget.text}」', count: _tagCount),
          seg(SearchMode.keyword, 'キーワード', caption: 'タイトル・説明・タグから'),
        ]),
      ),
    );
  }
}

class _UsersTab extends StatefulWidget {
  const _UsersTab({required this.text});

  final String text;

  @override
  State<_UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<_UsersTab> with AutomaticKeepAliveClientMixin {
  late final PagedController<UserRowData> _c = PagedController(
    pageSize: 20,
    idOf: (u) => u.id,
    fetch: (o, l) => UserApi.search(widget.text, o, l),
  );
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
          SliverPagedUsers(
            controller: _c,
            viewerId: _viewerId,
            emptyTitle: '「${widget.text}」のユーザーは見つかりませんでした',
            emptyMessage: '名前やユーザーIDの一部でも探せます',
          ),
        ],
      ),
    );
  }
}

class _TagsTab extends StatefulWidget {
  const _TagsTab({required this.text});

  final String text;

  @override
  State<_TagsTab> createState() => _TagsTabState();
}

class _TagsTabState extends State<_TagsTab> with AutomaticKeepAliveClientMixin {
  late final PagedController<TagSummary> _c = PagedController(
    pageSize: 40,
    idOf: (t) => t.name,
    fetch: (o, l) => ExploreApi.searchTags(widget.text, o, l).then((v) => v.where((t) => t.name.length <= 40).toList()),
  );

  @override
  bool get wantKeepAlive => true;

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
          ListenableBuilder(
            listenable: _c,
            builder: (context, _) {
              final c = _c;
              const delegate = SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
              );
              if (c.items.isEmpty && c.hasMore && c.error == null) {
                if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                return SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid.builder(gridDelegate: delegate, itemCount: 12, itemBuilder: (_, __) => const Skeleton(radius: 16)),
                );
              }
              if (c.items.isEmpty && c.error != null) {
                return SliverToBoxAdapter(child: StateView.error(c.error!, onRetry: c.refresh));
              }
              if (c.items.isEmpty) {
                return SliverToBoxAdapter(
                  child: StateView(icon: Icons.tag_rounded, title: '「${widget.text}」を含むタグは見つかりませんでした'),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
                sliver: SliverGrid.builder(
                  gridDelegate: delegate,
                  itemCount: c.items.length,
                  itemBuilder: (context, i) {
                    if (i >= c.items.length - 6 && c.hasMore && !c.isLoading && c.error == null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                    }
                    final t = c.items[i];
                    return TagCard(tag: t, width: null, onTap: () => Nav.tag(context, t.name));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
