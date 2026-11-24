import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/ranking_screen.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';

/// YYYY-MM-DD を画面の表記にする
String _dateLabel(String date) {
  final d = DateTime.tryParse(date);
  if (d == null) return date;
  return tr('${d.year}年${d.month}月${d.day}日', date);
}

/// 前の日・次の日の行
class _DayBar extends StatelessWidget {
  const _DayBar({required this.label, required this.onPrev, required this.onNext});

  final String label;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 4),
      child: Row(children: [
        IconButton.filledTonal(tooltip: tr('前の日', 'Previous day'), onPressed: onPrev, icon: const Icon(Icons.chevron_left_rounded)),
        Expanded(
          child: Text(label, textAlign: TextAlign.center, style: context.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
        ),
        IconButton.filledTonal(tooltip: tr('次の日', 'Next day'), onPressed: onNext, icon: const Icon(Icons.chevron_right_rounded)),
      ]),
    );
  }
}

/// ルーキーランキング（Web の /rankings/rookie）
class RookieRankingScreen extends StatefulWidget {
  const RookieRankingScreen({super.key, this.date});

  final String? date;

  @override
  State<RookieRankingScreen> createState() => _RookieRankingScreenState();
}

class _RookieRankingScreenState extends State<RookieRankingScreen> {
  String? _date;
  String? _latest;
  List<RankedWork>? _items;
  String? _error;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _load(widget.date);
  }

  Future<void> _load(String? date) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final r = await ExploreMoreApi.rookieAwards(date);
      if (!mounted) return;
      setState(() {
        _date = r.date ?? date;
        if (date == null) _latest = r.date;
        _items = r.items;
        _loading = false;
      });
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _error = e.message;
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final d = _date;
    final latest = _latest ?? jstDateString(DateTime.now());
    return Scaffold(
      appBar: AppBar(title: Text(tr('ルーキーランキング', 'Rookie ranking'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: RefreshIndicator.adaptive(
        onRefresh: () => _load(_date),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  tr('登録から30日以内のクリエイターと、まだランキングに入ったことがないクリエイターの作品だけで競う、毎日のランキングです。前日のいいね数で、1人1作品まで選ばれます。',
                      'A daily ranking only for creators who joined in the last 30 days and creators who have never made the regular rankings. Ranked by the previous day\'s likes, one work per creator.'),
                  style: context.tt.bodySmall?.copyWith(color: context.muted, height: 1.5),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _DayBar(
                label: d == null ? (_loading ? tr('読み込み中…', 'Loading…') : tr('まだ集計がありません', 'No ranking yet')) : _dateLabel(d),
                onPrev: d == null || _loading ? null : () => _load(shiftDateString(d, -1)),
                onNext: d == null || _loading || d.compareTo(latest) >= 0 ? null : () => _load(shiftDateString(d, 1)),
              ),
            ),
            if (_error != null && (items == null || items.isEmpty))
              SliverToBoxAdapter(child: StateView.error(_error!, onRetry: () => _load(_date)))
            else if (items == null)
              const SkeletonList(count: 6, sliver: true)
            else if (items.isEmpty)
              SliverToBoxAdapter(child: StateView(icon: Icons.emoji_events_outlined, title: tr('この日のルーキーランキングはありません', 'No rookie ranking for this day')))
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 40),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 560, mainAxisExtent: 104, crossAxisSpacing: 10, mainAxisSpacing: 8),
                  itemCount: items.length,
                  itemBuilder: (context, i) => AnimatedOpacity(duration: Ds.fast, opacity: _loading ? 0.4 : 1, child: RankRow(item: items[i])),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 今日の人気作品（Web の /popular。毎日お昼に選ばれる全年齢の 100 件）
class PopularWorksScreen extends StatefulWidget {
  const PopularWorksScreen({super.key, this.date});

  final String? date;

  @override
  State<PopularWorksScreen> createState() => _PopularWorksScreenState();
}

class _PopularWorksScreenState extends State<PopularWorksScreen> {
  final String _today = jstDateString(DateTime.now());
  String? _date;
  late PagedController<WorkSummary> _c = _make(widget.date);

  PagedController<WorkSummary> _make(String? date) => PagedController(
        pageSize: 100,
        idOf: (w) => w.id,
        fetch: (offset, limit) async {
          if (offset > 0) return const [];
          // 日付の指定がなければ今日、まだ選ばれていなければ（お昼より前）昨日（Web と同じ）
          final candidates = date != null ? [date] : [_today, shiftDateString(_today, -1)];
          var works = <WorkSummary>[];
          for (final c in candidates) {
            works = await ExploreMoreApi.popularWorks(c);
            if (mounted) setState(() => _date = c);
            if (works.isNotEmpty) break;
          }
          return works;
        },
      );

  void _go(String date) {
    final old = _c;
    setState(() {
      _date = date;
      _c = _make(date);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d = _date;
    return Scaffold(
      appBar: AppBar(title: Text(tr('今日の人気作品', "Today's popular works"), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: RefreshIndicator.adaptive(
        onRefresh: _c.refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: _DayBar(
                label: d == null ? tr('読み込み中…', 'Loading…') : _dateLabel(d),
                onPrev: d == null || d.compareTo('2023-01-01') <= 0 ? null : () => _go(shiftDateString(d, -1)),
                onNext: d == null || d.compareTo(_today) >= 0 ? null : () => _go(shiftDateString(d, 1)),
              ),
            ),
            SliverPagedWorks(
              key: ObjectKey(_c),
              controller: _c,
              emptyIcon: Icons.local_fire_department_outlined,
              emptyTitle: tr('この日の人気作品はまだありません', 'No popular works for this day yet'),
              emptyMessage: tr('毎日お昼に選ばれます', 'They are picked every day at noon (JST)'),
            ),
          ],
        ),
      ),
    );
  }
}
