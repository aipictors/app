import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

const _query = '''
query AppAiRankings(\$limit: Int!, \$offset: Int!, \$where: AiEvaluationWorkRankingsWhereInput!) {
  aiEvaluationWorkRankings(limit: \$limit, offset: \$offset, where: \$where) {
    id index overallScore awardTier pictorComment dateText isSensitive
    user { $userSummaryFields }
    work { id title rating largeThumbnailImageURL }
  }
}''';

/// AI 評価ランキング
class AiRankingScreen extends StatefulWidget {
  const AiRankingScreen({super.key});

  @override
  State<AiRankingScreen> createState() => _AiRankingScreenState();
}

class _AiRankingScreenState extends State<AiRankingScreen> {
  static const _periods = [RankingPeriod.daily, RankingPeriod.weekly, RankingPeriod.monthly];
  int _period = 0;
  late DateTime _date = RankingDate.initial(_periods[_period]);
  List<Map<String, dynamic>>? _items;
  String? _error;

  RankingPeriod get _p => _periods[_period];

  @override
  void initState() {
    super.initState();
    _load(backfill: true);
  }

  /// 集計前で空なら 1 つ前の期間にさかのぼる
  Future<void> _load({bool backfill = false}) async {
    setState(() {
      _items = null;
      _error = null;
    });
    try {
      var date = _date;
      for (var i = 0; i < (backfill ? 7 : 1); i++) {
        final data = await Api.query(_query, variables: {
          'limit': 100,
          'offset': 0,
          'where': {...RankingDate.where(_p, date), 'isSensitive': false},
        }, cacheFor: const Duration(minutes: 5));
        final items = data.list('aiEvaluationWorkRankings').where((r) {
          final rating = r.obj('work')?.str('rating');
          return !r.boolean('isSensitive') && rating != null && appRatings.contains(rating);
        }).toList();
        if (items.isNotEmpty || !backfill || i == 6) {
          if (mounted) {
            setState(() {
              _date = date;
              _items = items;
            });
          }
          return;
        }
        date = RankingDate.step(_p, date, -1);
      }
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  void _step(int delta) {
    _date = RankingDate.step(_p, _date, delta);
    _load();
  }

  Future<void> _pick() async {
    final picked = await showDatePicker(context: context, initialDate: _date, firstDate: DateTime(2024), lastDate: RankingDate.today());
    if (picked == null) return;
    _date = _p == RankingPeriod.weekly ? RankingDate.mondayOf(picked) : (_p == RankingPeriod.monthly ? DateTime(picked.year, picked.month, 1) : picked);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final canNext = RankingDate.step(_p, _date, 1).isBefore(RankingDate.today());
    return Scaffold(
      appBar: AppBar(title: const Text('AI ランキング', style: TextStyle(fontWeight: FontWeight.w800))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: Ds.s8),
          child: PillTabs(
            labels: const ['デイリー', 'ウィークリー', 'マンスリー'],
            index: _period,
            onChanged: (i) {
              setState(() {
                _period = i;
                _date = RankingDate.initial(_p);
              });
              _load(backfill: true);
            },
          ),
        ),
        Row(children: [
          IconButton(tooltip: '前へ', onPressed: () => _step(-1), icon: const Icon(Icons.chevron_left_rounded)),
          Expanded(
            child: TextButton(onPressed: _pick, child: Text(RankingDate.label(_p, _date), style: const TextStyle(fontWeight: FontWeight.w800))),
          ),
          IconButton(tooltip: '次へ', onPressed: canNext ? () => _step(1) : null, icon: const Icon(Icons.chevron_right_rounded)),
        ]),
        Expanded(
          child: _error != null
              ? StateView.error(_error!, onRetry: _load)
              : items == null
                  ? const SkeletonList()
                  : items.isEmpty
                      ? StateView.empty('この期間のランキングはまだありません', icon: Icons.emoji_events_outlined)
                      : ListView.builder(
                          padding: const EdgeInsets.only(bottom: Ds.s32),
                          itemCount: items.length,
                          itemBuilder: (context, i) => _Row(item: items[i]),
                        ),
        ),
      ]),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final work = item.obj('work')!;
    final comment = item.strOrNull('pictorComment');
    return InkWell(
      onTap: () => Nav.work(context, work.str('id')),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Ds.s16, vertical: Ds.s8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RankBadge(rank: item.integer('index')),
          const SizedBox(width: Ds.s8),
          AppImage(work.strOrNull('largeThumbnailImageURL'), width: 76, height: 96, radius: 10, memCacheWidth: 228),
          const SizedBox(width: Ds.s12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(work.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text(item.obj('user')?.str('name') ?? '', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: context.muted)),
              const SizedBox(height: Ds.s2),
              Text('${item.integer('overallScore')} 点', style: const TextStyle(fontWeight: FontWeight.w800, color: Ds.gold)),
              if (comment != null) Text(comment, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: context.muted, height: 1.35)),
            ]),
          ),
        ]),
      ),
    );
  }
}
