import 'package:aipictors/v2/community/messages_screen.dart' show mockSend;
import 'package:aipictors/v2/community/paged_list.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _monthQuery = r'''
query AppThemesMonth($offset: Int!, $limit: Int!, $where: DailyThemesWhereInput) {
  dailyThemes(offset: $offset, limit: $limit, where: $where) {
    id title day month year worksCount firstWork { smallThumbnailImageURL }
  }
}''';

const _dayQuery = '''
query AppThemeDay(\$year: Int, \$month: Int, \$day: Int) {
  dailyTheme(year: \$year, month: \$month, day: \$day) {
    id title dateText worksCount note proposer { $userSummaryFields }
  }
}''';

/// お題（カレンダー。過ぎた日を押すと結果）
class ThemesScreen extends StatefulWidget {
  const ThemesScreen({super.key});

  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  late DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);
  late Future<Map<int, Map<String, dynamic>>> _f = _load();

  Future<Map<int, Map<String, dynamic>>> _load() async {
    final data = await Api.query(_monthQuery, variables: {
      'offset': 0,
      'limit': 40,
      'where': {'year': _month.year, 'month': _month.month},
    }, cacheFor: const Duration(minutes: 5));
    return {for (final t in data.list('dailyThemes')) t.integer('day'): t};
  }

  void _move(int delta) => setState(() {
        _month = DateTime(_month.year, _month.month + delta);
        _f = _load();
      });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('お題', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [TextButton(onPressed: () => context.push('/themes/proposals'), child: const Text('お題の提案'))],
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(Ds.s12, 0, Ds.s12, Ds.s32), children: [
        Row(children: [
          IconButton(tooltip: '前の月', onPressed: () => _move(-1), icon: const Icon(Icons.chevron_left_rounded)),
          Expanded(child: Center(child: Text('${_month.year}年${_month.month}月', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)))),
          IconButton(tooltip: '次の月', onPressed: () => _move(1), icon: const Icon(Icons.chevron_right_rounded)),
        ]),
        Row(children: [
          for (final w in const ['日', '月', '火', '水', '木', '金', '土'])
            Expanded(child: Center(child: Text(w, style: TextStyle(fontSize: 12, color: context.muted, fontWeight: FontWeight.w700)))),
        ]),
        const SizedBox(height: Ds.s4),
        FutureBuilder<Map<int, Map<String, dynamic>>>(
          future: _f,
          builder: (context, snap) {
            if (snap.hasError) return StateView.error('お題を読み込めませんでした', onRetry: () => setState(() => _f = _load()));
            if (!snap.hasData) return const Skeleton(height: 420, radius: 12);
            final themes = snap.data!;
            final leading = DateTime(_month.year, _month.month, 1).weekday % 7;
            final days = DateTime(_month.year, _month.month + 1, 0).day;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 3, crossAxisSpacing: 3, childAspectRatio: 0.62),
              itemCount: leading + days,
              itemBuilder: (context, i) {
                if (i < leading) return const SizedBox.shrink();
                final day = i - leading + 1;
                final isToday = _month.year == now.year && _month.month == now.month && day == now.day;
                return _DayCell(day: day, theme: themes[day], isToday: isToday, month: _month);
              },
            );
          },
        ),
      ]),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({required this.day, required this.theme, required this.isToday, required this.month});

  final int day;
  final Map<String, dynamic>? theme;
  final bool isToday;
  final DateTime month;

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Pressable(
      onTap: t == null ? null : () => context.push('/themes/${month.year}/${month.month}/$day'),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.surfaceCard,
          borderRadius: Ds.br(8),
          border: Border.all(color: isToday ? context.cs.primary : context.hairline, width: isToday ? 1.5 : 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 2),
            child: Text('$day', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: isToday ? context.cs.primary : null)),
          ),
          if (t != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text(t.str('title'), maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 9.5, height: 1.2, fontWeight: FontWeight.w600)),
            ),
          const SizedBox(height: 2),
          if (t?.obj('firstWork')?.strOrNull('smallThumbnailImageURL') != null)
            Expanded(child: AppImage(t!.obj('firstWork')!.str('smallThumbnailImageURL'), memCacheWidth: 150)),
        ]),
      ),
    );
  }
}

/// その日のお題の作品（結果）
class ThemeDayScreen extends StatefulWidget {
  const ThemeDayScreen({super.key, required this.year, required this.month, required this.day});

  final int year;
  final int month;
  final int day;

  @override
  State<ThemeDayScreen> createState() => _ThemeDayScreenState();
}

class _ThemeDayScreenState extends State<ThemeDayScreen> {
  Map<String, dynamic>? _theme;
  String? _error;
  PagedController<WorkSummary>? _c;
  int _sort = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(_dayQuery, variables: {'year': widget.year, 'month': widget.month, 'day': widget.day}, cacheFor: const Duration(minutes: 5));
      if (!mounted) return;
      setState(() {
        _theme = data.obj('dailyTheme');
        _error = _theme == null ? 'この日のお題はありません' : null;
        _c = _theme == null ? null : _make();
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  PagedController<WorkSummary> _make() {
    final id = _theme!.str('id');
    final sort = _sort == 0 ? WorkSort.likes : WorkSort.latest;
    return PagedController(idOf: (w) => w.id, fetch: (o, l) => ExploreApi.themeWorks(id, sort, o, l));
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = _theme;
    return Scaffold(
      appBar: AppBar(title: Text(t?.str('title') ?? 'お題', style: const TextStyle(fontWeight: FontWeight.w800))),
      body: _error != null
          ? StateView.error(_error!, onRetry: _load)
          : _c == null
              ? const SkeletonGrid()
              : CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(Ds.s16),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('${t!.str('dateText')}・${t.integer('worksCount')} 作品', style: TextStyle(color: context.muted, fontSize: 13)),
                        if (t.strOrNull('note') != null) ...[const SizedBox(height: Ds.s6), Text(t.str('note'), style: const TextStyle(height: 1.5))],
                        if (t.obj('proposer') != null) ...[
                          const SizedBox(height: Ds.s4),
                          Text('提案: ${t.obj('proposer')!.str('name')}さん', style: TextStyle(color: context.muted, fontSize: 12)),
                        ],
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PillTabs(
                      labels: const ['人気順（結果）', '新着'],
                      index: _sort,
                      onChanged: (i) => setState(() {
                        _c?.dispose();
                        _sort = i;
                        _c = _make();
                      }),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: Ds.s8)),
                  SliverPagedWorks(key: ValueKey(_sort), controller: _c!),
                  const SliverToBoxAdapter(child: SizedBox(height: Ds.s32)),
                ]),
    );
  }
}

const _proposalFields = 'id title inputTheme status targetDate likesCount isLiked proposerName note decisionComment canCancel';

/// お題の提案
class ThemeProposalsScreen extends StatefulWidget {
  const ThemeProposalsScreen({super.key});

  @override
  State<ThemeProposalsScreen> createState() => _ThemeProposalsScreenState();
}

class _ThemeProposalsScreenState extends State<ThemeProposalsScreen> {
  static const _statuses = [null, 'PENDING', 'ADOPTED', 'REJECTED'];
  static const _labels = ['すべて', '検討中', '採用', '見送り'];
  int _status = 0;
  late PagedController<Map<String, dynamic>> _c = _make();

  PagedController<Map<String, dynamic>> _make() {
    final status = _statuses[_status];
    return PagedController(
      pageSize: 30,
      idOf: (p) => p.str('id'),
      fetch: (offset, limit) async {
        final data = await Api.query(
          'query AppThemeProposals(\$offset: Int!, \$limit: Int!, \$status: String) { themeProposals(offset: \$offset, limit: \$limit, status: \$status) { $_proposalFields } }',
          variables: {'offset': offset, 'limit': limit, 'status': status},
        );
        return data.list('themeProposals');
      },
    );
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Future<void> _like(Map<String, dynamic> p) async {
    if (!Nav.requireLogin(context)) return;
    final liked = p.boolean('isLiked');
    setState(() {
      p['isLiked'] = !liked;
      p['likesCount'] = p.integer('likesCount') + (liked ? -1 : 1);
    });
    if (mockSend) return;
    try {
      await Api.mutate(
        liked
            ? r'mutation AppThemeProposalUnlike($id: ID!) { deleteThemeProposalLike(proposalId: $id) { id } }'
            : r'mutation AppThemeProposalLike($id: ID!) { createThemeProposalLike(proposalId: $id) { id } }',
        variables: {'id': p.str('id')},
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        p['isLiked'] = liked;
        p['likesCount'] = p.integer('likesCount') + (liked ? 1 : -1);
      });
      context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お題の提案', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          TextButton(
            onPressed: () {
              if (Nav.requireLogin(context)) context.push('/themes/proposals/new');
            },
            child: const Text('提案する'),
          ),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Ds.s8),
          child: PillTabs(
            labels: _labels,
            index: _status,
            onChanged: (i) => setState(() {
              _c.dispose();
              _status = i;
              _c = _make();
            }),
          ),
        ),
        Expanded(
          child: PagedList<Map<String, dynamic>>(
            key: ValueKey(_status),
            controller: _c,
            emptyTitle: '提案はまだありません',
            itemBuilder: (context, p) => ListTile(
              title: Text(p.str('title', p.str('inputTheme')), style: const TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text(
                [
                  '${p.str('targetDate')}・${p.str('proposerName')}さん',
                  if (p.strOrNull('note') != null) p.str('note'),
                  if (p.strOrNull('decisionComment') != null) '運営より: ${p.str('decisionComment')}',
                ].join('\n'),
                style: const TextStyle(height: 1.4),
              ),
              trailing: TextButton.icon(
                onPressed: () => _like(p),
                icon: Icon(p.boolean('isLiked') ? Icons.favorite_rounded : Icons.favorite_border_rounded, size: 18, color: p.boolean('isLiked') ? Ds.pink : null),
                label: Text('${p.integer('likesCount')}'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

/// お題を提案する
class ThemeProposalNewScreen extends StatefulWidget {
  const ThemeProposalNewScreen({super.key});

  @override
  State<ThemeProposalNewScreen> createState() => _ThemeProposalNewScreenState();
}

class _ThemeProposalNewScreenState extends State<ThemeProposalNewScreen> {
  final _theme = TextEditingController();
  final _note = TextEditingController();
  // Web と同じ。8 日先から提案できる
  DateTime _date = DateTime.now().add(const Duration(days: 8));
  bool _allowOther = true;
  bool _sending = false;

  @override
  void dispose() {
    _theme.dispose();
    _note.dispose();
    super.dispose();
  }

  String get _dateText => '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}';

  Future<void> _send() async {
    final theme = _theme.text.trim();
    if (theme.isEmpty) return;
    if (mockSend) {
      context.toast('デバッグ中なので送信していません');
      return;
    }
    setState(() => _sending = true);
    try {
      await Api.mutate(
        r'mutation AppCreateThemeProposal($date: String!, $theme: String!, $note: String, $allowOtherDate: Boolean) { createThemeProposal(date: $date, theme: $theme, note: $note, allowOtherDate: $allowOtherDate) { id } }',
        variables: {'date': _dateText, 'theme': theme, 'note': _note.text.trim().isEmpty ? null : _note.text.trim(), 'allowOtherDate': _allowOther},
      );
      if (!mounted) return;
      context.toast('提案しました');
      context.pop();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('お題を提案する', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ListView(padding: const EdgeInsets.all(Ds.s16), children: [
        TextField(controller: _theme, maxLength: 40, decoration: const InputDecoration(labelText: 'お題')),
        const SizedBox(height: Ds.s8),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('希望の日'),
          subtitle: Text(_dateText),
          trailing: const Icon(Icons.calendar_month_rounded),
          onTap: () async {
            final first = DateTime.now().add(const Duration(days: 8));
            final picked = await showDatePicker(context: context, initialDate: _date, firstDate: first, lastDate: first.add(const Duration(days: 365)));
            if (picked != null) setState(() => _date = picked);
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('ほかの日でもよい'),
          value: _allowOther,
          onChanged: (v) => setState(() => _allowOther = v),
        ),
        TextField(controller: _note, maxLines: 3, decoration: const InputDecoration(labelText: 'ひとこと（任意）')),
        const SizedBox(height: Ds.s16),
        PrimaryButton(label: '提案する', loading: _sending, onPressed: _sending ? null : _send),
      ]),
    );
  }
}
