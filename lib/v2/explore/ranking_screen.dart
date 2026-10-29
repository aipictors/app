import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// ランキングを読み込む（集計前で空なら 1 つ前の期間にさかのぼる。Web と同じ）
class RankingLoader {
  RankingLoader._();

  static Future<({DateTime date, List<RankedWork> items})> latest(RankingPeriod p, {int limit = 200, int tries = 7}) async {
    return load(p, RankingDate.initial(p), limit: limit, tries: tries);
  }

  static Future<({DateTime date, List<RankedWork> items})> load(RankingPeriod p, DateTime d, {int limit = 200, int tries = 1}) async {
    var date = d;
    for (var i = 0; i < tries; i++) {
      final items = await ExploreApi.workAwards(RankingDate.where(p, date), limit: limit);
      if (items.isNotEmpty || i == tries - 1) return (date: date, items: items);
      date = RankingDate.step(p, date, -1);
    }
    return (date: date, items: const <RankedWork>[]);
  }
}

/// ランキング（デイリー・ウィークリー・マンスリー）
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ランキング', style: TextStyle(fontWeight: FontWeight.w800)),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            dividerColor: context.hairline,
            tabs: const [Tab(text: 'デイリー'), Tab(text: 'ウィークリー'), Tab(text: 'マンスリー')],
          ),
        ),
        body: const TabBarView(children: [
          _RankingTab(period: RankingPeriod.daily),
          _RankingTab(period: RankingPeriod.weekly),
          _RankingTab(period: RankingPeriod.monthly),
        ]),
      ),
    );
  }
}

class _RankingTab extends StatefulWidget {
  const _RankingTab({required this.period});

  final RankingPeriod period;

  @override
  State<_RankingTab> createState() => _RankingTabState();
}

class _RankingTabState extends State<_RankingTab> with AutomaticKeepAliveClientMixin {
  DateTime? _date;
  List<RankedWork>? _items;
  String? _error;
  bool _loading = false;
  late final DateTime _latest = RankingDate.initial(widget.period);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initial();
  }

  Future<void> _run(Future<({DateTime date, List<RankedWork> items})> Function() f) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final r = await f();
      if (!mounted) return;
      setState(() {
        _date = r.date;
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
    } catch (_) {
      if (mounted) {
        setState(() {
          _error = '読み込みに失敗しました';
          _loading = false;
        });
      }
    }
  }

  Future<void> _initial() => _run(() => RankingLoader.latest(widget.period, tries: widget.period == RankingPeriod.monthly ? 2 : 8));

  Future<void> _go(DateTime d) => _run(() => RankingLoader.load(widget.period, d));

  bool get _canNext => _date != null && RankingDate.step(widget.period, _date!, 1).isBefore(_latest.add(const Duration(days: 1)));

  Future<void> _pickDate() async {
    if (_date == null) return;
    if (widget.period == RankingPeriod.monthly) return;
    final picked = await showDatePicker(
      context: context,
      initialDate: _date!,
      firstDate: DateTime(2023, 1, 1),
      lastDate: _latest,
      helpText: widget.period == RankingPeriod.weekly ? 'その日を含む週を表示' : '日付を選ぶ',
    );
    if (picked == null) return;
    _go(widget.period == RankingPeriod.weekly ? RankingDate.mondayOf(picked) : picked);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final items = _items;
    return RefreshIndicator.adaptive(
      onRefresh: () => _date == null ? _initial() : _go(_date!),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverToBoxAdapter(child: _dateBar(context)),
          if (_error != null && (items == null || items.isEmpty))
            SliverToBoxAdapter(child: StateView.error(_error!, onRetry: () => _date == null ? _initial() : _go(_date!)))
          else if (items == null || (_loading && items.isEmpty))
            SliverToBoxAdapter(child: _skeleton(context))
          else if (items.isEmpty)
            const SliverToBoxAdapter(
              child: StateView(icon: Icons.emoji_events_outlined, title: 'この期間のランキングはまだありません', message: '集計が終わると表示されます'),
            )
          else ...[
            SliverToBoxAdapter(
              child: AnimatedOpacity(
                duration: Ds.fast,
                opacity: _loading ? 0.4 : 1,
                child: _podium(context, items.take(3).toList()),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 40),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 560,
                  mainAxisExtent: 104,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                ),
                itemCount: (items.length - 3).clamp(0, 9999),
                itemBuilder: (context, i) => AnimatedOpacity(
                  duration: Ds.fast,
                  opacity: _loading ? 0.4 : 1,
                  child: _RankRow(item: items[i + 3]),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _dateBar(BuildContext context) {
    final d = _date;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 4),
      child: Row(children: [
        IconButton.filledTonal(
          tooltip: '前へ',
          onPressed: d == null || _loading ? null : () => _go(RankingDate.step(widget.period, d, -1)),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        Expanded(
          child: Pressable(
            onTap: d == null || widget.period == RankingPeriod.monthly ? null : _pickDate,
            child: Column(children: [
              Text(
                d == null ? '読み込み中…' : RankingDate.label(widget.period, d),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800),
              ),
              if (widget.period != RankingPeriod.monthly)
                Text('タップで日付を選ぶ', style: context.tt.labelSmall?.copyWith(color: context.muted)),
            ]),
          ),
        ),
        IconButton.filledTonal(
          tooltip: '次へ',
          onPressed: !_canNext || _loading ? null : () => _go(RankingDate.step(widget.period, d!, 1)),
          icon: const Icon(Icons.chevron_right_rounded),
        ),
      ]),
    );
  }

  Widget _skeleton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(children: [
        const Row(children: [
          Expanded(child: Skeleton(height: 200, radius: 18)),
          SizedBox(width: 10),
          Expanded(child: Skeleton(height: 260, radius: 18)),
          SizedBox(width: 10),
          Expanded(child: Skeleton(height: 180, radius: 18)),
        ]),
        const SizedBox(height: 16),
        for (var i = 0; i < 5; i++) ...[
          const Skeleton(height: 96, radius: 16),
          const SizedBox(height: 8),
        ],
      ]),
    );
  }

  /// 1〜3 位を表彰台のように並べる（2・1・3 の順）
  Widget _podium(BuildContext context, List<RankedWork> top) {
    if (top.isEmpty) return const SizedBox.shrink();
    final w = MediaQuery.sizeOf(context).width;
    final base = (w.clamp(320, 900) - 44) / 3;
    Widget card(RankedWork r, double h) {
      return Pressable(
        onTap: () => Nav.work(context, r.work.id),
        child: Column(children: [
          SizedBox(
            height: h,
            child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: Ds.br(18),
                  boxShadow: [
                    BoxShadow(
                      color: (r.rank == 1 ? Ds.gold : Colors.black).withValues(alpha: r.rank == 1 ? 0.35 : 0.12),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: AppImage(r.work.imageUrl, radius: 18, memCacheWidth: 600),
              ),
              Positioned(left: 0, right: 0, bottom: -16, child: Center(child: RankBadge(rank: r.rank, size: r.rank == 1 ? 40 : 34))),
            ]),
          ),
          const SizedBox(height: 22),
          Text(r.work.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Avatar(r.work.user.iconUrl, size: 16),
            const SizedBox(width: 4),
            Flexible(
              child: Text(r.work.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.labelSmall?.copyWith(color: context.muted)),
            ),
          ]),
          const SizedBox(height: 2),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.favorite_rounded, size: 12, color: Ds.pink),
            const SizedBox(width: 3),
            Text(compactCount(r.likes), style: context.tt.labelSmall?.copyWith(fontWeight: FontWeight.w800)),
          ]),
        ]),
      );
    }

    final first = top[0];
    final second = top.length > 1 ? top[1] : null;
    final third = top.length > 2 ? top[2] : null;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(child: second == null ? const SizedBox.shrink() : card(second, base * 1.25)),
            const SizedBox(width: 6),
            Expanded(child: card(first, base * 1.5)),
            const SizedBox(width: 6),
            Expanded(child: third == null ? const SizedBox.shrink() : card(third, base * 1.15)),
          ]),
        ),
      ),
    );
  }
}

/// 4 位以下の行
class _RankRow extends StatelessWidget {
  const _RankRow({required this.item});

  final RankedWork item;

  @override
  Widget build(BuildContext context) {
    final w = item.work;
    return Pressable(
      scale: 0.98,
      onTap: () => Nav.work(context, w.id),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
        child: Row(children: [
          SizedBox(
            width: 46,
            child: Text(
              '${item.rank}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: item.rank < 10 ? 28 : (item.rank < 100 ? 24 : 18),
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                letterSpacing: -1,
                color: context.cs.onSurface.withValues(alpha: 0.85),
              ),
            ),
          ),
          AspectRatio(aspectRatio: 1, child: AppImage(w.imageUrl, radius: 12, memCacheWidth: 300)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(w.title.isEmpty ? '無題' : w.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodyMedium?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Pressable(
                onTap: () => Nav.user(context, w.user.id),
                child: Row(children: [
                  Avatar(w.user.iconUrl, size: 20),
                  const SizedBox(width: 6),
                  Expanded(child: Text(w.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(color: context.muted))),
                ]),
              ),
              const SizedBox(height: 6),
              Row(children: [
                const Icon(Icons.favorite_rounded, size: 13, color: Ds.pink),
                const SizedBox(width: 3),
                Text(compactCount(item.likes), style: context.tt.labelSmall?.copyWith(fontWeight: FontWeight.w800)),
                if (w.rating == 'R15') ...[const SizedBox(width: 8), const Badge2('R15', color: Color(0xCCE2A21B))],
                if (w.isVideo) ...[const SizedBox(width: 6), Badge2('動画', icon: Icons.play_arrow_rounded, color: context.cs.primary)],
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}

