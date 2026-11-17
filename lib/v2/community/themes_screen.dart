import 'package:aipictors/v2/community/messages_screen.dart' show mockSend;
import 'package:aipictors/v2/community/paged_list.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/theme_widgets.dart';
import 'package:aipictors/v2/explore/theme_works_screen.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// お題（月ごと。カレンダーと一覧を切り替え、日を押すとその日の作品）
class ThemesScreen extends StatefulWidget {
  const ThemesScreen({super.key});

  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  late DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);
  late Future<List<DailyTheme>> _f = ExploreApi.monthThemes(_month.year, _month.month);
  // 0: カレンダー 1: 一覧。開発用: /tmp/aipictors-debug の 2 行目が list なら一覧で開く（表示の確認用）
  int _view = DebugBoot.screenTab == 'list' ? 1 : 0;

  void _move(int delta) => setState(() {
        _month = DateTime(_month.year, _month.month + delta);
        _f = ExploreApi.monthThemes(_month.year, _month.month);
      });

  void _retry() => setState(() => _f = ExploreApi.monthThemes(_month.year, _month.month));

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final canNext = DateTime(_month.year, _month.month + 1).isBefore(DateTime(now.year, now.month + 2));
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('お題', 'Daily themes'), style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: [TextButton(onPressed: () => context.push('/themes/proposals'), child: Text(tr('お題の提案', 'Suggest')))],
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(0, 0, 0, Ds.s32), children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s16, 0, Ds.s16, Ds.s4),
          child: Text(
            tr('毎日0時に新しいお題が出ます。お題に沿った作品を投稿して参加しよう！', 'A new theme every day at 0:00 (JST). Join by posting a work for the theme!'),
            style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Ds.s8),
          child: PillTabs(labels: [tr('カレンダー', 'Calendar'), tr('一覧', 'List')], index: _view, onChanged: (i) => setState(() => _view = i)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Ds.s12),
          child: Row(children: [
            IconButton(tooltip: tr('前の月', 'Previous month'), onPressed: () => _move(-1), icon: const Icon(Icons.chevron_left_rounded)),
            Expanded(child: Center(child: Text(themeMonthLabel(_month), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)))),
            IconButton(tooltip: tr('次の月', 'Next month'), onPressed: canNext ? () => _move(1) : null, icon: const Icon(Icons.chevron_right_rounded)),
          ]),
        ),
        FutureBuilder<List<DailyTheme>>(
          future: _f,
          builder: (context, snap) {
            if (snap.hasError) return StateView.error(tr('お題を読み込めませんでした', "Couldn't load themes"), onRetry: _retry);
            if (!snap.hasData) return const Padding(padding: EdgeInsets.symmetric(horizontal: Ds.s12), child: Skeleton(height: 420, radius: 12));
            final themes = snap.data!;
            if (_view == 1) return _ThemeList(themes: themes.reversed.where((t) => !t.date.isAfter(today)).toList());
            return Padding(padding: const EdgeInsets.symmetric(horizontal: Ds.s12), child: _calendar({for (final t in themes) t.day: t}, today));
          },
        ),
      ]),
    );
  }

  Widget _calendar(Map<int, DailyTheme> themes, DateTime today) {
    final leading = DateTime(_month.year, _month.month, 1).weekday % 7;
    final days = DateTime(_month.year, _month.month + 1, 0).day;
    return Column(children: [
      Row(children: [
        // 日曜始まり
        for (final w in const [7, 1, 2, 3, 4, 5, 6])
          Expanded(child: Center(child: Text(weekdayLabel(w), style: TextStyle(fontSize: 12, color: context.muted, fontWeight: FontWeight.w700)))),
      ]),
      const SizedBox(height: Ds.s4),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 3, crossAxisSpacing: 3, childAspectRatio: 0.62),
        itemCount: leading + days,
        itemBuilder: (context, i) {
          if (i < leading) return const SizedBox.shrink();
          final day = i - leading + 1;
          final date = DateTime(_month.year, _month.month, day);
          return _DayCell(day: day, theme: themes[day], isToday: date == today);
        },
      ),
    ]);
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({required this.day, required this.theme, required this.isToday});

  final int day;
  final DailyTheme? theme;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Pressable(
      onTap: t == null ? null : () => context.push(t.path),
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
              child: Text(t.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 9.5, height: 1.2, fontWeight: FontWeight.w600)),
            ),
          const SizedBox(height: 2),
          if (t?.thumbnailUrl != null) Expanded(child: AppImage(t!.thumbnailUrl, memCacheWidth: 150)),
        ]),
      ),
    );
  }
}

/// その月のお題の一覧（新しい順。サムネイル・日付・お題名・作品数）
class _ThemeList extends StatelessWidget {
  const _ThemeList({required this.themes});

  final List<DailyTheme> themes;

  @override
  Widget build(BuildContext context) {
    if (themes.isEmpty) return StateView.empty(tr('この月のお題はまだありません', 'No themes this month yet'), icon: Icons.event_busy_rounded, compact: true);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return Column(children: [
      for (final t in themes)
        Pressable(
          onTap: () => context.push(t.path),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Ds.s16, vertical: Ds.s6),
            child: Row(children: [
              SizedBox(
                width: 64,
                height: 64,
                child: t.thumbnailUrl != null ? AppImage(t.thumbnailUrl, radius: 12, memCacheWidth: 200) : const ThemeThumbPlaceholder(radius: 12, iconSize: 24),
              ),
              const SizedBox(width: Ds.s12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text(themeDateLabel(t.date), style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
                    if (t.date == today) ...[const SizedBox(width: 6), Badge2(tr('今日', 'Today'), color: Ds.pink)],
                  ]),
                  const SizedBox(height: 2),
                  Text(t.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text(themeWorksCountLabel(t.worksCount), style: TextStyle(color: context.muted, fontSize: 12)),
                ]),
              ),
              Icon(Icons.chevron_right_rounded, color: context.muted),
            ]),
          ),
        ),
    ]);
  }
}

/// 旧 URL /daily_themes/:id。日付を調べて [ThemeWorksScreen] を出す（旧画面は作品の画像だけを並べていた）
class ThemeByIdScreen extends StatefulWidget {
  const ThemeByIdScreen({super.key, required this.id});

  final String id;

  @override
  State<ThemeByIdScreen> createState() => _ThemeByIdScreenState();
}

class _ThemeByIdScreenState extends State<ThemeByIdScreen> {
  ({int year, int month, int day})? _date;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final data = await Api.query(r'''
query DailyThemeDate($id: ID) {
  dailyTheme(id: $id) {
    id
    year
    month
    day
  }
}''', variables: {'id': widget.id}, cacheFor: const Duration(hours: 1));
      final t = data.obj('dailyTheme');
      if (!mounted) return;
      setState(() {
        if (t == null) {
          _error = 'お題が見つかりませんでした';
        } else {
          _date = (year: t.integer('year'), month: t.integer('month'), day: t.integer('day'));
        }
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final d = _date;
    if (d != null) return ThemeWorksScreen(year: d.year, month: d.month, day: d.day);
    return Scaffold(
      appBar: AppBar(title: const Text('お題', style: TextStyle(fontWeight: FontWeight.w800))),
      body: _error != null ? StateView.error(_error!, onRetry: _load) : const SkeletonGrid(),
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
