import 'package:aipictors/v2/community/app_markdown.dart';
import 'package:aipictors/v2/community/paged_list.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _listQuery = r'''
query AppEvents($offset: Int!, $limit: Int!) {
  appEvents(offset: $offset, limit: $limit) { slug title status startAt endAt headerImageUrl thumbnailImageUrl worksCount }
}''';

const _userListQuery = r'''
query AppUserEvents($offset: Int!, $limit: Int!, $where: UserEventsWhereInput) {
  userEvents(offset: $offset, limit: $limit, where: $where) { slug title status startAt endAt headerImageUrl thumbnailImageUrl worksCount isSensitive ratings }
}''';

const _appEventQuery = r'''
query AppEventDetail($slug: String) {
  appEvent(slug: $slug) { slug title status startAt endAt headerImageUrl description wayToJoin tag worksCount }
}''';

const _userEventQuery = r'''
query AppUserEventDetail($slug: String!) {
  userEvent(slug: $slug) { slug title status startAt endAt headerImageUrl description participationGuide mainTag worksCount isSensitive ratings userName }
}''';

String _statusLabel(String s) => switch (s) { 'ONGOING' => '開催中', 'UPCOMING' => '開催予定', 'ENDED' => '終了', _ => '' };

/// イベントの一覧
class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final _official = PagedController<Map<String, dynamic>>(
    pageSize: 16,
    idOf: (e) => e.str('slug'),
    fetch: (offset, limit) async {
      final data = await Api.query(_listQuery, variables: {'offset': offset, 'limit': limit}, cacheFor: const Duration(minutes: 5));
      return data.list('appEvents');
    },
  );
  final _user = PagedController<Map<String, dynamic>>(
    pageSize: 16,
    idOf: (e) => e.str('slug'),
    fetch: (offset, limit) async {
      final data = await Api.query(_userListQuery, variables: {
        'offset': offset,
        'limit': limit,
        'where': {'isSensitive': false},
      }, cacheFor: const Duration(minutes: 5));
      // R18 を含むイベントはアプリに出さない
      return data.list('userEvents').where((e) => !e.boolean('isSensitive') && !(e['ratings'] as List? ?? const []).contains('R18')).toList();
    },
  );

  @override
  void dispose() {
    _official.dispose();
    _user.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('イベント', style: TextStyle(fontWeight: FontWeight.w800)),
          bottom: TabBar(dividerColor: context.hairline, tabs: const [Tab(text: '公式'), Tab(text: 'ユーザー企画')]),
        ),
        body: TabBarView(children: [
          PagedList<Map<String, dynamic>>(controller: _official, emptyTitle: 'イベントはまだありません', itemBuilder: (context, e) => _EventCard(event: e)),
          PagedList<Map<String, dynamic>>(controller: _user, emptyTitle: 'イベントはまだありません', itemBuilder: (context, e) => _EventCard(event: e)),
        ]),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event});

  final Map<String, dynamic> event;

  @override
  Widget build(BuildContext context) {
    final e = event;
    final status = _statusLabel(e.str('status'));
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 0),
      child: Pressable(
        onTap: () => context.push('/events/${e.str('slug')}'),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AspectRatio(
            aspectRatio: 2.2,
            child: AppImage(e.strOrNull('headerImageUrl') ?? e.strOrNull('thumbnailImageUrl'), radius: 14, memCacheWidth: 900),
          ),
          const SizedBox(height: Ds.s6),
          Text(e.str('title'), maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
          const SizedBox(height: Ds.s2),
          Row(children: [
            if (status.isNotEmpty) ...[Badge2(status, color: e.str('status') == 'ONGOING' ? Ds.pink : Ds.blue), const SizedBox(width: Ds.s6)],
            Expanded(
              child: Text('${formatYmd(e.integer('startAt'))}〜・${e.integer('worksCount')} 作品', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 12)),
            ),
          ]),
        ]),
      ),
    );
  }
}

/// イベントの詳細（概要・作品・受賞）
class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key, required this.slug});

  final String slug;

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  Map<String, dynamic>? _event;
  bool _isUserEvent = false;
  String? _error;
  int _tab = 0;
  PagedController<WorkSummary>? _works;
  PagedController<WorkSummary>? _awards;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _works?.dispose();
    _awards?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(_appEventQuery, variables: {'slug': widget.slug}, cacheFor: const Duration(minutes: 5));
      var event = data.obj('appEvent');
      var isUser = false;
      if (event == null) {
        final u = await Api.query(_userEventQuery, variables: {'slug': widget.slug}, cacheFor: const Duration(minutes: 5));
        event = u.obj('userEvent');
        isUser = true;
      }
      if (!mounted) return;
      if (event == null || event.boolean('isSensitive') || (event['ratings'] as List? ?? const []).contains('R18')) {
        setState(() => _error = 'イベントが見つかりませんでした');
        return;
      }
      setState(() {
        _event = event;
        _isUserEvent = isUser;
        _error = null;
        _works = _make('works', '\$offset, \$limit');
        _awards = _make('awardWorks', '');
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  PagedController<WorkSummary> _make(String kind, String _) {
    final root = _isUserEvent ? 'userEvent' : 'appEvent';
    final slugType = _isUserEvent ? 'String!' : 'String';
    final args = kind == 'works'
        ? 'offset: \$offset, limit: \$limit, where: { ratings: [G, R15] }'
        : 'offset: \$offset, limit: \$limit, isSensitive: false';
    final doc = 'query AppEventWorks(\$slug: $slugType, \$offset: Int!, \$limit: Int!) { $root(slug: \$slug) { id $kind($args) { $workCardFields } } }';
    return PagedController(
      idOf: (w) => w.id,
      fetch: (offset, limit) async {
        final data = await Api.query(doc, variables: {'slug': widget.slug, 'offset': offset, 'limit': limit}, cacheFor: const Duration(minutes: 3));
        return WorkSummary.listFrom(data.obj(root)?.list(kind) ?? const []);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final e = _event;
    if (_error != null) return Scaffold(appBar: AppBar(), body: StateView.error(_error!, onRetry: _load));
    if (e == null) return Scaffold(appBar: AppBar(), body: const SkeletonGrid());
    final guide = e.strOrNull('wayToJoin') ?? e.strOrNull('participationGuide');
    return Scaffold(
      appBar: AppBar(title: Text(e.str('title'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: AspectRatio(aspectRatio: 2.2, child: AppImage(e.strOrNull('headerImageUrl'), memCacheWidth: 1200))),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, Ds.s8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(e.str('title'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, height: 1.35)),
              const SizedBox(height: Ds.s4),
              Text(
                '${_statusLabel(e.str('status'))}・${formatYmd(e.integer('startAt'))}〜${formatYmd(e.integer('endAt'))}・${e.integer('worksCount')} 作品',
                style: TextStyle(color: context.muted, fontSize: 12),
              ),
            ]),
          ),
        ),
        SliverToBoxAdapter(child: PillTabs(labels: const ['概要', '作品', '受賞'], index: _tab, onChanged: (i) => setState(() => _tab = i))),
        const SliverToBoxAdapter(child: SizedBox(height: Ds.s8)),
        if (_tab == 0)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Ds.s16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                AppHtmlOrText(e.str('description')),
                if (guide != null) ...[
                  const SizedBox(height: Ds.s16),
                  const Text('参加のしかた', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: Ds.s6),
                  AppHtmlOrText(guide),
                ],
              ]),
            ),
          )
        else if (_tab == 1)
          SliverPagedWorks(key: const ValueKey('works'), controller: _works!, emptyTitle: '作品はまだありません')
        else
          SliverPagedWorks(key: const ValueKey('awards'), controller: _awards!, emptyTitle: '受賞作品はまだありません', emptyIcon: Icons.emoji_events_outlined),
        const SliverToBoxAdapter(child: SizedBox(height: Ds.s32)),
      ]),
    );
  }
}

/// HTML か Markdown か分からない本文
class AppHtmlOrText extends StatelessWidget {
  const AppHtmlOrText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => RegExp(r'<[a-z][^>]*>').hasMatch(text) ? AppHtmlBody(text) : AppMarkdown(text);
}
