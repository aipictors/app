import 'package:aipictors/v2/frames/gacha_rules.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// レア度の札（Web の RarityBadge）
class RarityBadge extends StatelessWidget {
  const RarityBadge(this.rarity, {super.key, this.small = false});

  final GachaRarity rarity;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: small ? 30 : 40),
      padding: EdgeInsets.symmetric(horizontal: small ? 6 : 8, vertical: small ? 1 : 2),
      decoration: BoxDecoration(gradient: rarity.badge, borderRadius: BorderRadius.circular(99)),
      child: Text(
        rarity.label,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: small ? 10 : 12, color: const Color(0xFF0F172A)),
      ),
    );
  }
}

/// 景品の絵。アイコン枠は丸い台に重ね、ヘッダー枠は横長の台に重ねる（Web の PrizeThumbnail）
class PrizeThumb extends StatelessWidget {
  const PrizeThumb(this.prize, {super.key, this.size = 80, this.animated = false, this.locked = false});

  final GachaPrize prize;

  /// アイコン枠は一辺、ヘッダー枠は高さ（幅は 3 倍）
  final double size;
  final bool animated;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (prize.kind == GachaPrizeKind.header) {
      child = ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: size * 3,
          height: size,
          child: Stack(fit: StackFit.expand, children: [
            const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF64748B), Color(0xFF334155)]))),
            AppImage(prize.imageUrl, fit: BoxFit.fill, memCacheWidth: (size * 9).round()),
          ]),
        ),
      );
    } else {
      child = SizedBox(
        width: size,
        height: size,
        child: Stack(children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(size * 0.17),
              child: const DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFF94A3B8), Color(0xFF475569)])),
              ),
            ),
          ),
          Positioned.fill(
            child: Image.network(
              animated ? prize.animatedImageUrl : prize.imageUrl,
              fit: BoxFit.contain,
              gaplessPlayback: true,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
        ]),
      );
    }
    if (!locked) return child;
    return Opacity(
      opacity: 0.35,
      child: ColorFiltered(colorFilter: const ColorFilter.matrix(_grayscale), child: child),
    );
  }

  static const _grayscale = <double>[
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0,
  ];
}

/// プロフィールのヘッダー画像に重ねるガチャのヘッダー枠（Web の GachaHeaderFrameOverlay）。
/// 画像は PC 3:1 とスマホ 5:2。止まった絵の上に、ほとんど透明な動く絵を重ねる。動きを減らす設定では動く絵を出さない
class HeaderFrameOverlay extends StatelessWidget {
  const HeaderFrameOverlay({super.key, required this.slug});

  final String slug;

  static String baseUrl(String slug, {required bool wide}) => '${GachaRules.webOrigin}/header-frames/$slug.${wide ? 'pc' : 'sp'}';

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(builder: (context, c) {
        final base = baseUrl(slug, wide: c.maxWidth >= 768);
        final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
        return Stack(fit: StackFit.expand, children: [
          Image.network('$base.webp', fit: BoxFit.fill, gaplessPlayback: true, errorBuilder: (_, __, ___) => const SizedBox.shrink()),
          if (!reduceMotion) Image.network('$base.motion.webp', fit: BoxFit.fill, gaplessPlayback: true, errorBuilder: (_, __, ___) => const SizedBox.shrink()),
        ]);
      }),
    );
  }
}
