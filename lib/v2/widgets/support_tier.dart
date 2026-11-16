import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/support_tier.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 推しをスーパーチャットのように見せる部品（Web の components/support-super-chat.tsx と同じ見た目）
/// 推す側の画面では円を出さない（コインで応援 → 運営がクリエイターに報酬を払う、の建て付け）

/// プレミアム（金）・フリー（灰）のコインの丸
class SupportCoinDot extends StatelessWidget {
  const SupportCoinDot({super.key, required this.premium, this.size = 18});

  final bool premium;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: premium ? const Color(0xFFE4A227) : const Color(0xFFA1A1A1),
        border: Border.all(color: Colors.white.withValues(alpha: 0.9), width: 1.2),
      ),
      child: Text(
        'C',
        style: TextStyle(color: Colors.white, fontSize: size * 0.55, fontWeight: FontWeight.w900, height: 1),
      ),
    );
  }
}

/// コインの枚数を大きく（プレミアムを先に）
class SupportCoinCounts extends StatelessWidget {
  const SupportCoinCounts({super.key, required this.free, required this.premium, this.color, this.fontSize = 20});

  final int free;
  final int premium;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w900, height: 1, fontFeatures: const [FontFeature.tabularFigures()]);
    final dot = fontSize * 0.9;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (premium > 0) ...[SupportCoinDot(premium: true, size: dot), const SizedBox(width: 3), Text('$premium', style: style)],
        if (premium > 0 && free > 0) const SizedBox(width: 8),
        if (free > 0) ...[SupportCoinDot(premium: false, size: dot), const SizedBox(width: 3), Text('$free', style: style)],
      ],
    );
  }
}

String supportAmountLabel(int free, int premium, int pt) => [if (premium > 0) tr('プレミアムコイン$premium枚', '$premium premium coins'), if (free > 0) tr('フリーコイン$free枚', '$free free coins'), '${pt}pt'].join('・');

/// 推し付きコメントの帯（段階の色・コイン数を大きく）
class SupportBand extends StatefulWidget {
  const SupportBand({super.key, required this.free, required this.premium, required this.pt, this.title, this.radius});

  final int free;
  final int premium;
  final int pt;

  /// 左側の文字（無ければ「推しコインで応援」）
  final Widget? title;
  final BorderRadius? radius;

  @override
  State<SupportBand> createState() => _SupportBandState();
}

class _SupportBandState extends State<SupportBand> with SingleTickerProviderStateMixin {
  late final AnimationController _shine = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final tier = SupportTier.of(widget.pt);
    // 高い段階だけ、光が 1 回だけ横切る（端末の「視差効果を減らす」では出さない）
    if (tier != null && tier.level >= 4 && !MediaQuery.disableAnimationsOf(context) && !_shine.isAnimating && _shine.value == 0) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _shine.forward();
      });
    }
  }

  @override
  void dispose() {
    _shine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tier = SupportTier.of(widget.pt);
    if (tier == null) return const SizedBox.shrink();
    final on = tier.onColor;
    return Semantics(
      label: supportAmountLabel(widget.free, widget.premium, widget.pt),
      child: ClipRRect(
        borderRadius: widget.radius ?? BorderRadius.zero,
        child: Container(
          decoration: BoxDecoration(gradient: tier.gradient),
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _shine,
                  builder: (context, _) {
                    if (_shine.value == 0 || _shine.value == 1) return const SizedBox.shrink();
                    return FractionallySizedBox(
                      alignment: Alignment(-1.6 + _shine.value * 3.2, 0),
                      widthFactor: 0.25,
                      child: Opacity(
                        opacity: 1 - _shine.value,
                        child: Container(color: Colors.white.withValues(alpha: 0.28)),
                      ),
                    );
                  },
                ),
              ),
              ExcludeSemantics(
                child: Row(
                  children: [
                    Icon(Icons.volunteer_activism_rounded, size: 16, color: on),
                    const SizedBox(width: 6),
                    Expanded(
                      child: DefaultTextStyle.merge(
                        style: TextStyle(color: on, fontWeight: FontWeight.w800, fontSize: 12),
                        child: widget.title ?? Text(tr('推しコインで応援', 'Support with coins')),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SupportCoinCounts(free: widget.free, premium: widget.premium, color: on, fontSize: 18),
                        const SizedBox(height: 2),
                        Text(
                          '${widget.pt}pt',
                          style: TextStyle(color: on.withValues(alpha: 0.9), fontSize: 10, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 小さなしるし（応援の帯・通知・一覧）
class SupportTierChip extends StatelessWidget {
  const SupportTierChip({super.key, required this.free, required this.premium, required this.pt});

  final int free;
  final int premium;
  final int pt;

  @override
  Widget build(BuildContext context) {
    final tier = SupportTier.of(pt);
    if (tier == null) return const SizedBox.shrink();
    return Semantics(
      label: supportAmountLabel(free, premium, pt),
      child: ExcludeSemantics(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(gradient: tier.gradient, borderRadius: Ds.br(12)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SupportCoinCounts(free: free, premium: premium, color: tier.onColor, fontSize: 12),
              const SizedBox(width: 5),
              Text(
                '${pt}pt',
                style: TextStyle(color: tier.onColor.withValues(alpha: 0.9), fontSize: 11, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 金額のボタン（選ぶと段階の色で塗る）
class SupportAmountButton extends StatelessWidget {
  const SupportAmountButton({super.key, required this.label, required this.pt, required this.selected, required this.onTap});

  final String label;

  /// このボタンの金額の pt（色を決める）
  final int pt;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tier = SupportTier.of(pt);
    final color = tier?.color ?? context.cs.primary;
    final enabled = onTap != null;
    return Opacity(
      opacity: enabled ? 1 : 0.4,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: Ds.br(14),
          onTap: onTap,
          child: AnimatedContainer(
            duration: Ds.fast,
            constraints: const BoxConstraints(minWidth: 56, minHeight: 44),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: BoxDecoration(
              gradient: selected ? tier?.gradient : null,
              color: selected ? null : color.withValues(alpha: context.isDark ? 0.14 : 0.08),
              border: Border.all(color: selected ? Colors.transparent : color.withValues(alpha: 0.55), width: 1.5),
              borderRadius: Ds.br(14),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                height: 1.25,
                color: selected ? (tier?.onColor ?? Colors.white) : (context.isDark ? Color.lerp(color, Colors.white, 0.35) : Color.lerp(color, Colors.black, 0.25)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 「応援はクリエイターの報酬につながります」の一言。R18 の作品では出さない（報酬の対象外）
class SupportRewardNote extends StatelessWidget {
  const SupportRewardNote({super.key, this.isWork = false});

  /// 作品経由（全年齢の作品で出す）のとき true。プロフィールからの推しは false
  final bool isWork;

  @override
  Widget build(BuildContext context) {
    final text = isWork ? tr('購入したプレミアムコインでの応援は、クリエイターの報酬につながります（クリエイター報酬に参加している人・全年齢の作品が対象）。', 'Support with purchased premium coins becomes a reward for the creator (for creators in Rewards payout, on all-ages works).') : tr('購入したプレミアムコインでの応援は、条件を満たすとクリエイターの報酬につながります。', 'Support with purchased premium coins can become a reward for the creator when conditions are met.');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 1),
          child: Icon(Icons.auto_awesome_rounded, size: 14, color: Ds.gold),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: text),
                const TextSpan(text: ' '),
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: GestureDetector(
                    onTap: () => launchUrl(Uri.parse('https://www.aipictors.com/creator-rewards/terms'), mode: LaunchMode.inAppBrowserView),
                    child: Text(
                      tr('クリエイター報酬とは', 'About creator rewards'),
                      style: TextStyle(fontSize: 12, color: context.cs.onSurface, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
            style: TextStyle(fontSize: 12, color: context.muted, height: 1.5),
          ),
        ),
      ],
    );
  }
}

/// 送ったときの演出（コインがふわっと上がって消える。1 回だけ・端末の「動きを減らす」では出さない）
class SupportSentBurst extends StatefulWidget {
  const SupportSentBurst({super.key, required this.pt, this.height = 120});

  final int pt;
  final double height;

  @override
  State<SupportSentBurst> createState() => _SupportSentBurstState();
}

class _SupportSentBurstState extends State<SupportSentBurst> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!MediaQuery.disableAnimationsOf(context) && !_c.isAnimating && _c.value == 0) _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tier = SupportTier.of(widget.pt);
    if (tier == null || MediaQuery.disableAnimationsOf(context)) return const SizedBox.shrink();
    final count = (3 + tier.level).clamp(4, 9);
    return IgnorePointer(
      child: SizedBox(
        height: widget.height,
        child: AnimatedBuilder(
          animation: _c,
          builder: (context, _) => LayoutBuilder(
            builder: (context, box) => Stack(
              children: [
                for (var i = 0; i < count; i++)
                  () {
                    final delay = ((i % 3) * 0.08 + i * 0.03).clamp(0.0, 0.5);
                    final t = ((_c.value - delay) / (1 - delay)).clamp(0.0, 1.0);
                    final x = box.maxWidth / 2 + (i - (count - 1) / 2) * 26 - 9;
                    return Positioned(
                      left: x,
                      bottom: t * (widget.height - 20),
                      child: Opacity(opacity: t == 0 ? 0 : (t < 0.2 ? t / 0.2 : (1 - t) / 0.8).clamp(0.0, 1.0), child: const SupportCoinDot(premium: true, size: 18)),
                    );
                  }(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 推し付きのコメントを送ったあとの控えめな知らせ（段階の色のしるし＋コインが上がる。1.6 秒で消える）
void showSupportSent(BuildContext context, {required int free, required int premium, required int pt}) {
  final overlay = Overlay.maybeOf(context, rootOverlay: true);
  if (overlay == null) return;
  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (context) => Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.paddingOf(context).top + 56,
      child: IgnorePointer(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SupportSentBurst(pt: pt, height: 90),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: MediaQuery.disableAnimationsOf(context) ? 1 : 0.6, end: 1),
            duration: const Duration(milliseconds: 420),
            curve: Curves.easeOutBack,
            builder: (context, v, child) => Transform.scale(scale: v, child: child),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: context.surfaceCard,
                  borderRadius: Ds.br(20),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.18), blurRadius: 16, offset: const Offset(0, 6))],
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(tr('推しコイン付きでコメントしました', 'Commented with support coins'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                  const SizedBox(width: 8),
                  SupportTierChip(free: free, premium: premium, pt: pt),
                ]),
              ),
            ),
          ),
        ]),
      ),
    ),
  );
  overlay.insert(entry);
  Future.delayed(const Duration(milliseconds: 1800), () {
    if (entry.mounted) entry.remove();
  });
}
