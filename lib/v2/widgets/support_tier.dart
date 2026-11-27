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

/// 小さなしるし（推す画面の枚数）
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

/// 「応援はクリエイターの報酬につながります」の一言。推す画面（ユーザーへの推し）で、作者が報酬に参加していて
/// プレミアムコインを使えるときだけ出すので、条件の括弧書きは付けない
class SupportRewardNote extends StatelessWidget {
  const SupportRewardNote({super.key});

  @override
  Widget build(BuildContext context) {
    final text = tr('購入したプレミアムコインでの応援は、条件を満たすとクリエイターの報酬につながります。', 'Support with purchased premium coins can become a reward for the creator when conditions are met.');
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

/// 「クリエイター報酬に参加しています」の印。推す画面で、報酬に参加している作者だけに出す
/// （プレミアムコインを受け取らない作者では出さない）。押すと説明のページへ
class SupportRewardJoinedBadge extends StatelessWidget {
  const SupportRewardJoinedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tr('このクリエイターはクリエイター報酬に参加しています', 'This creator takes part in creator rewards'),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse('https://www.aipictors.com/creator-rewards/terms'), mode: LaunchMode.inAppBrowserView),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Ds.gold.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Ds.gold.withValues(alpha: 0.4)),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.verified_rounded, size: 13, color: Ds.gold),
            const SizedBox(width: 3),
            Text(tr('報酬に参加中', 'Rewards'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Ds.gold)),
          ]),
        ),
      ),
    );
  }
}
