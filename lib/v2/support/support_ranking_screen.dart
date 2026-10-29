import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SupportRankItem {
  const SupportRankItem({
    required this.rank,
    required this.userId,
    required this.name,
    required this.iconUrl,
    required this.pt,
    required this.coins,
    required this.count,
  });

  final int rank;
  final String userId;
  final String name;
  final String? iconUrl;
  final int pt;
  final int coins;
  final int count;
}

class SupportRanking {
  const SupportRanking(this.weekStartDate, this.items);

  final String? weekStartDate;
  final List<SupportRankItem> items;

  /// kind: received（推された）/ sent（推した＝貢献）
  static Future<SupportRanking> fetch(String kind, {int limit = 50}) async {
    final res = await http
        .get(Uri.parse('https://www.aipictors.com/api/coins/support/rankings/public?kind=$kind&limit=$limit'))
        .timeout(const Duration(seconds: 20));
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final data = json is Map ? json['data'] : null;
    if (res.statusCode != 200 || data is! Map) throw const ApiException('ランキングを取得できませんでした');
    final items = (data['items'] as List? ?? const []).whereType<Map>().map((m) {
      final j = Map<String, dynamic>.from(m);
      return SupportRankItem(
        rank: j.integer('rank'),
        userId: j.str('userId'),
        name: j.str('userName', '匿名'),
        iconUrl: j.strOrNull('iconUrl'),
        pt: j.integer('ptAmount'),
        coins: j.integer('coinAmount'),
        count: j.integer('transferCount'),
      );
    }).toList();
    return SupportRanking(data['weekStartDate']?.toString(), items);
  }

  String get weekLabel {
    final d = DateTime.tryParse(weekStartDate ?? '');
    if (d == null) return '今週';
    return '${d.month}/${d.day}〜の週';
  }
}

/// 推しランキング（推された人・推した人）
class SupportRankingScreen extends StatefulWidget {
  const SupportRankingScreen({super.key, this.initialKind = 'received'});

  final String initialKind;

  @override
  State<SupportRankingScreen> createState() => _SupportRankingScreenState();
}

class _SupportRankingScreenState extends State<SupportRankingScreen> {
  late String _kind = widget.initialKind;
  final Map<String, SupportRanking> _data = {};
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final r = await SupportRanking.fetch(_kind);
      if (mounted) setState(() => _data[_kind] = r);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } catch (_) {
      if (mounted) setState(() => _error = 'ランキングを取得できませんでした');
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = _data[_kind];
    return Scaffold(
      appBar: AppBar(title: const Text('推しランキング', style: TextStyle(fontWeight: FontWeight.w900))),
      body: RefreshIndicator.adaptive(
        onRefresh: _load,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: SegmentedButton<String>(
                  showSelectedIcon: false,
                  segments: const [
                    ButtonSegment(value: 'received', icon: Icon(Icons.favorite_rounded, size: 18), label: Text('推されたクリエイター')),
                    ButtonSegment(value: 'sent', icon: Icon(Icons.volunteer_activism_rounded, size: 18), label: Text('貢献した人')),
                  ],
                  selected: {_kind},
                  onSelectionChanged: (s) {
                    setState(() => _kind = s.first);
                    if (_data[_kind] == null) _load();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Text(
                  '${r?.weekLabel ?? '今週'}・コインで推された（推した）pt の合計です。フリーコインは1枚1pt、プレミアムコインは1枚10pt。',
                  style: TextStyle(color: context.muted, fontSize: 12, height: 1.5),
                ),
              ),
            ),
            if (r == null && _error != null)
              SliverToBoxAdapter(child: StateView.error(_error!, onRetry: _load))
            else if (r == null)
              SliverList.list(children: List.generate(8, (_) => const Padding(padding: EdgeInsets.fromLTRB(16, 6, 16, 6), child: Skeleton(height: 64, radius: 16))))
            else if (r.items.isEmpty)
              const SliverToBoxAdapter(child: StateView(icon: Icons.volunteer_activism_outlined, title: 'まだ今週の推しはありません', message: '作品ページの「推す」から、コインでクリエイターを応援できます。'))
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
                sliver: SliverList.separated(
                  itemCount: r.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) => SupportRankTile(item: r.items[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SupportRankTile extends StatelessWidget {
  const SupportRankTile({super.key, required this.item, this.compact = false});

  final SupportRankItem item;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final medal = switch (item.rank) {
      1 => const Color(0xFFF5B800),
      2 => const Color(0xFFA9B3BF),
      3 => const Color(0xFFCD7F32),
      _ => null,
    };
    return Pressable(
      scale: 0.98,
      onTap: item.userId.isEmpty || item.userId == '0' ? null : () => Nav.user(context, item.userId),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: compact ? 8 : 10),
        decoration: BoxDecoration(
          color: medal != null ? medal.withValues(alpha: context.isDark ? 0.16 : 0.1) : context.surfaceCard,
          borderRadius: Ds.br(16),
          border: Border.all(color: medal?.withValues(alpha: 0.5) ?? context.hairline),
        ),
        child: Row(children: [
          SizedBox(
            width: 34,
            child: medal != null
                ? Icon(Icons.emoji_events_rounded, color: medal, size: 26)
                : Text('${item.rank}', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900, color: context.muted)),
          ),
          const SizedBox(width: 8),
          Avatar(item.iconUrl, size: compact ? 34 : 42),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800)),
              if (!compact) Text('${item.count}回・${item.coins}コイン', style: TextStyle(color: context.muted, fontSize: 12)),
            ]),
          ),
          Text('${compactCount(item.pt)}pt', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
        ]),
      ),
    );
  }
}

/// ホームに出す今週の推しランキング（上位 3 人）
class SupportRankingPreview extends StatefulWidget {
  const SupportRankingPreview({super.key});

  @override
  State<SupportRankingPreview> createState() => _SupportRankingPreviewState();
}

class _SupportRankingPreviewState extends State<SupportRankingPreview> {
  SupportRanking? _r;

  @override
  void initState() {
    super.initState();
    SupportRanking.fetch('received', limit: 3).then((r) {
      if (mounted) setState(() => _r = r);
    }).catchError((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final r = _r;
    if (r == null || r.items.isEmpty) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SectionHeader(
        '今週の推しランキング',
        icon: Icons.volunteer_activism_rounded,
        onMore: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SupportRankingScreen())),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          for (final item in r.items.take(3))
            Padding(padding: const EdgeInsets.only(bottom: 8), child: SupportRankTile(item: item, compact: true)),
        ]),
      ),
    ]);
  }
}
