import 'dart:async';
import 'dart:math';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/frames/frame_widgets.dart';
import 'package:aipictors/v2/frames/frames_api.dart';
import 'package:aipictors/v2/frames/gacha_rules.dart';
import 'package:aipictors/v2/frames/gacha_screen.dart';
import 'package:flutter/material.dart';

/// 引いた結果の演出。いちばん上のレア度の色で光ってから、1 枚ずつめくる（Web の GachaPerformance を軽くしたもの）。
/// 「もう一度」を押したら引く回数（1 か 10）を返す
Future<int?> showGachaResult(BuildContext context, {required GachaDrawResult result}) {
  return Navigator.of(context, rootNavigator: true).push<int>(
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: false,
      transitionDuration: Ds.normal,
      pageBuilder: (_, __, ___) => GachaResultView(result: result),
      transitionsBuilder: (_, a, __, child) => FadeTransition(opacity: a, child: child),
    ),
  );
}

class GachaResultView extends StatefulWidget {
  const GachaResultView({super.key, required this.result});

  final GachaDrawResult result;

  @override
  State<GachaResultView> createState() => _GachaResultViewState();
}

class _GachaResultViewState extends State<GachaResultView> with TickerProviderStateMixin {
  // UUR は光を長くためる（Web の演出と同じく、UR より派手に）
  late final AnimationController _intro = AnimationController(vsync: this, duration: Duration(milliseconds: _hasUnique ? 2400 : 1100));
  late final AnimationController _cards;

  /// UUR の白金の光芒（回り続ける）
  late final AnimationController _shine = AnimationController(vsync: this, duration: const Duration(milliseconds: 6000));
  bool _skipped = false;

  /// UUR の全体告知風の帯（7 秒で引っ込む。押しても閉じる）
  bool _announce = false;
  Timer? _announceTimer;

  bool get _hasUnique => _pulls.any((p) => p.prize.rarity.isUnique);

  List<GachaPull> get _pulls => widget.result.pulls;

  GachaRarity get _top => _pulls.isEmpty ? GachaRarity.n : _pulls.map((p) => p.prize.rarity).reduce((a, b) => a.index >= b.index ? a : b);

  @override
  void initState() {
    super.initState();
    _cards = AnimationController(vsync: this, duration: Duration(milliseconds: 380 + 220 * max(0, _pulls.length - 1)));
    final reduce = WidgetsBinding.instance.platformDispatcher.accessibilityFeatures.disableAnimations;
    if (reduce) {
      _intro.value = 1;
      _cards.value = 1;
    } else {
      if (_hasUnique) _shine.repeat();
      _intro.forward().whenComplete(() {
        if (mounted) _cards.forward();
      });
    }
    _cards.addStatusListener((status) {
      if (status == AnimationStatus.completed) _showAnnounce();
    });
    if (reduce) _showAnnounce();
  }

  void _showAnnounce() {
    if (!_hasUnique || _announceTimer != null) return;
    if (!_skipped) Ds.impact();
    setState(() => _announce = true);
    _announceTimer = Timer(const Duration(seconds: 7), () {
      if (mounted) setState(() => _announce = false);
    });
  }

  @override
  void dispose() {
    _announceTimer?.cancel();
    _intro.dispose();
    _cards.dispose();
    _shine.dispose();
    super.dispose();
  }

  void _skip() {
    if (_skipped) return;
    _skipped = true;
    _intro.value = 1;
    _cards.value = 1;
  }

  /// i 枚目のめくれ具合（0〜1）
  double _reveal(int i) {
    final total = _cards.duration!.inMilliseconds;
    final start = 220 * i / total;
    final end = (220 * i + 380) / total;
    return Curves.easeOutBack.transform(((_cards.value - start) / (end - start)).clamp(0.0, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    final pulls = _pulls;
    final top = _top;
    final shards = widget.result.shards;
    final state = widget.result.state;
    return Scaffold(
      backgroundColor: const Color(0xF2120726),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _skip,
        child: SafeArea(
          child: AnimatedBuilder(
            animation: Listenable.merge([_intro, _cards, _shine]),
            builder: (context, _) {
              final glow = Curves.easeOut.transform(_intro.value);
              final introOn = _intro.value < 1;
              return Stack(children: [
                // 予告の光（いちばん上のレア度の色。上のレア度より上の色にはしない）
                Positioned.fill(
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: introOn ? (sin(glow * pi)).clamp(0.0, 1.0) : 0.25,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [top.glow.withValues(alpha: 0.85), top.glow.withValues(alpha: 0)], radius: 0.4 + glow * 0.6),
                        ),
                      ),
                    ),
                  ),
                ),
                // UUR: 白金の光芒が回る（めくり終わっても薄く残す）
                if (top.isUnique)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: introOn ? (0.35 + 0.65 * glow).clamp(0.0, 1.0) : 0.35,
                        child: Transform.rotate(
                          angle: _shine.value * 2 * pi,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: SweepGradient(colors: [
                                Color(0x00FFFFFF), Color(0x66FFF4D0), Color(0x00FFFFFF), Color(0x55A5F3FC), Color(0x00FFFFFF), Color(0x66F8E7A8), //
                                Color(0x00FFFFFF), Color(0x55FFFFFF), Color(0x00FFFFFF), Color(0x66FDE68A), Color(0x00FFFFFF), Color(0x55F0ABFC), Color(0x00FFFFFF),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Column(children: [
                  const SizedBox(height: Ds.s16),
                  Text(
                    pulls.length >= 10 ? tr('10 連の結果', '10x results') : tr('結果', 'Result'),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  const SizedBox(height: Ds.s8),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(Ds.s16),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 12,
                          children: [
                            for (final (i, p) in pulls.indexed)
                              Builder(builder: (context) {
                                final t = _reveal(i);
                                return Opacity(
                                  opacity: t.clamp(0.0, 1.0),
                                  child: Transform.scale(scale: 0.6 + 0.4 * t, child: _ResultCard(pull: p, big: pulls.length == 1)),
                                );
                              }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_cards.isCompleted || _skipped)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Ds.s16, 0, Ds.s16, Ds.s16),
                      child: Column(children: [
                        if (shards > 0)
                          Padding(
                            padding: const EdgeInsets.only(bottom: Ds.s8),
                            child: Text(
                              tr('かぶりはかけらになりました +$shards（いま ${state.shards}。まだ持っていない枠と交換できます）', 'Duplicates became shards +$shards (now ${state.shards}; exchange them for frames you don\'t own)'),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Color(0xFFBAE6FD), fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ),
                        PityMeter(points: state.exchangePoints, compact: true),
                        const SizedBox(height: Ds.s12),
                        Row(children: [
                          Expanded(child: _btn(tr('閉じる', 'Close'), () => Navigator.pop(context))),
                          const SizedBox(width: 8),
                          Expanded(child: _btn(tr('もう 1 回', 'Pull 1'), () => Navigator.pop(context, 1))),
                          const SizedBox(width: 8),
                          Expanded(child: _btn(tr('10 連', 'Pull 10'), () => Navigator.pop(context, 10), primary: true)),
                        ]),
                      ]),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(bottom: Ds.s24),
                      child: Text(tr('タップでスキップ', 'Tap to skip'), style: const TextStyle(color: Colors.white54, fontSize: 12)),
                    ),
                ]),
                if (_announce)
                  Positioned(
                    top: 8,
                    left: 12,
                    right: 12,
                    child: GestureDetector(onTap: () => setState(() => _announce = false), child: _UniqueAnnouncement(names: [for (final p in pulls) if (p.prize.rarity.isUnique) p.prize.name])),
                  ),
              ]);
            },
          ),
        ),
      ),
    );
  }

  Widget _btn(String label, VoidCallback onTap, {bool primary = false}) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: primary ? null : Colors.white.withValues(alpha: 0.12),
            gradient: primary ? const LinearGradient(colors: [Color(0xFFEC4899), Color(0xFFD946EF), Color(0xFFFB923C)]) : null,
          ),
          child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        ),
      );
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.pull, this.big = false});

  final GachaPull pull;
  final bool big;

  @override
  Widget build(BuildContext context) {
    final p = pull.prize;
    final r = p.rarity;
    final w = big ? 220.0 : 100.0;
    final notes = [
      if (pull.byGuarantee) tr('確定枠', 'Guaranteed'),
      if (pull.shards > 0) tr('かぶり → かけら+${pull.shards}', 'Dupe → +${pull.shards} shards'),
    ];
    final isHeader = p.kind == GachaPrizeKind.header;
    return Container(
      width: big && isHeader ? 300 : w,
      padding: EdgeInsets.all(big ? 14 : 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withValues(alpha: 0.08),
        border: Border.all(color: r.glow.withValues(alpha: r.index >= GachaRarity.sr.index ? 0.9 : 0.4), width: r.isUnique ? 3 : (r.index >= GachaRarity.ssr.index ? 2 : 1)),
        boxShadow: r.index >= GachaRarity.sr.index
            ? [
                BoxShadow(color: r.glow.withValues(alpha: 0.55), blurRadius: r.isUnique ? 40 : (r == GachaRarity.ur ? 26 : 14), spreadRadius: r.isUnique ? 4 : 0),
                if (r.isUnique) const BoxShadow(color: Color(0x88FDE68A), blurRadius: 70, spreadRadius: 8),
              ]
            : null,
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Stack(clipBehavior: Clip.none, children: [
          PrizeThumb(p, size: isHeader ? (big ? 88 : 28) : (big ? 160 : 76), animated: big && r.index >= GachaRarity.ssr.index),
          if (pull.isNew)
            Positioned(
              top: -4,
              left: -4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(color: Ds.pink, borderRadius: BorderRadius.circular(6)),
                child: const Text('NEW', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 10)),
              ),
            ),
        ]),
        const SizedBox(height: 4),
        RarityBadge(r, small: !big),
        const SizedBox(height: 2),
        Text(p.name, maxLines: 2, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: big ? 15 : 10)),
        if (big) Text(p.kindLabel, style: const TextStyle(color: Colors.white60, fontSize: 11)),
        if (notes.isNotEmpty) Text(notes.join('・'), textAlign: TextAlign.center, style: TextStyle(color: const Color(0xFFBAE6FD), fontSize: big ? 12 : 9)),
      ]),
    );
  }
}

/// UUR を当てたときの全体告知風の帯（Web の GachaUniqueAnnouncement）
class _UniqueAnnouncement extends StatelessWidget {
  const _UniqueAnnouncement({required this.names});

  final List<String> names;

  @override
  Widget build(BuildContext context) {
    final label = names.map((n) => '「$n」').join();
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(colors: [Color(0xFFF8E7A8), Colors.white, Color(0xFFA5F3FC), Color(0xFFF0ABFC), Color(0xFFF8E7A8)]),
        boxShadow: const [BoxShadow(color: Color(0x88FDE68A), blurRadius: 30)],
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
        decoration: BoxDecoration(color: const Color(0xF207060D), borderRadius: BorderRadius.circular(16)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(tr('📣 全体のお知らせ', '📣 Announcement'), style: const TextStyle(color: Color(0xFFFDE68A), fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 2)),
          const SizedBox(height: 4),
          Text(
            tr('世界でひとりだけの UUR\n$label があなたのものになりました', 'The one-of-a-kind UUR\n$label is now yours'),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 4),
          Text(tr('ガチャの画面に獲得者として名前が載ります', 'Your name will appear on the gacha screen as the owner'), style: const TextStyle(color: Colors.white70, fontSize: 11)),
        ]),
      ),
    );
  }
}
