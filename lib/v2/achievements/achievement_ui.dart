import 'dart:convert';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 実績のランク（Web の achievement-ui.ts の ACHIEVEMENT_TIERS と同じ色）
class AchievementTierInfo {
  const AchievementTierInfo(this.ja, this.en, this.chip, this.chipText, this.text, this.darkText, this.glow);

  final String ja;
  final String en;

  /// チップの背景のグラデーション
  final List<Color> chip;
  final Color chipText;

  /// 文字色（2 色以上ならグラデーション）
  final List<Color> text;
  final List<Color> darkText;

  /// 光の色（バナーの時間の線など）
  final Color glow;

  String get label => tr(ja, en);
}

const achievementTiers = <int, AchievementTierInfo>{
  1: AchievementTierInfo('ブロンズ', 'Bronze', [Color(0xFFB45309), Color(0xFFFB923C)], Colors.white, [Color(0xFFB45309)], [Color(0xFFF59E0B)], Color(0xFFE2A26B)),
  2: AchievementTierInfo('シルバー', 'Silver', [Color(0xFF64748B), Color(0xFFCBD5E1)], Colors.white, [Color(0xFF64748B)], [Color(0xFFCBD5E1)], Color(0xFFDBE3EA)),
  3: AchievementTierInfo('ゴールド', 'Gold', [Color(0xFFCA8A04), Color(0xFFFCD34D)], Color(0xFF422006), [Color(0xFFCA8A04)], [Color(0xFFFACC15)], Color(0xFFFFD34D)),
  4: AchievementTierInfo('プラチナ', 'Platinum', [Color(0xFF94A3B8), Color(0xFFE0F2FE), Color(0xFF94A3B8)], Color(0xFF1E293B), [Color(0xFF0369A1)], [Color(0xFFBAE6FD)], Color(0xFFC9ECFF)),
  5: AchievementTierInfo('ダイヤモンド', 'Diamond', [Color(0xFF2563EB), Color(0xFF67E8F9), Color(0xFF2563EB)], Colors.white, [Color(0xFF0891B2)], [Color(0xFF67E8F9)], Color(0xFF7FE7FF)),
  6: AchievementTierInfo('レジェンド', 'Legend', [Color(0xFFEC4899), Color(0xFFFACC15), Color(0xFF8B5CF6)], Colors.white, [Color(0xFFEC4899), Color(0xFFFACC15), Color(0xFF38BDF8)],
      [Color(0xFFEC4899), Color(0xFFFACC15), Color(0xFF38BDF8)], Color(0xFFFFD166)),
  7: AchievementTierInfo('神話', 'Mythic', [Color(0xFF1E1B4B), Color(0xFF7C3AED), Color(0xFF06B6D4)], Colors.white, [Color(0xFF8B5CF6), Color(0xFFE879F9), Color(0xFF22D3EE)],
      [Color(0xFF8B5CF6), Color(0xFFE879F9), Color(0xFF22D3EE)], Color(0xFFA78BFA)),
};

AchievementTierInfo achievementTier(int tier) => achievementTiers[tier] ?? achievementTiers[1]!;

/// Web の画像の置き場所（public/achievements/badges）
const _webOrigin = 'https://www.aipictors.com';

/// バッジ画像の版（Web の BADGE_IMAGE_VERSION と同じ。描き直したら Web と一緒に上がる）
const _badgeImageVersion = 2;

/// バッジ画像（隠し実績で未達成なら「?」。hidden- で始まるキーは他の人のまだ達成していない隠し実績）
String achievementBadgeUrl(String key, {required bool isHidden, required bool isUnlocked}) {
  if ((isHidden && !isUnlocked) || key.startsWith('hidden-')) return '$_webOrigin/achievements/badges/hidden.svg?v=$_badgeImageVersion';
  return '$_webOrigin/achievements/badges/$key.svg?v=$_badgeImageVersion';
}

/// 端末に残して読む SVG（バッジは数百種類あるので、使ったものだけ取ってくる）
class _CachedSvgLoader extends SvgLoader<Uint8List> {
  const _CachedSvgLoader(this.url);

  final String url;

  @override
  Future<Uint8List?> prepareMessage(BuildContext? context) async => (await DefaultCacheManager().getSingleFile(url)).readAsBytes();

  @override
  String provideSvg(Uint8List? message) => utf8.decode(message!, allowMalformed: true);

  @override
  int get hashCode => url.hashCode;

  @override
  bool operator ==(Object other) => other is _CachedSvgLoader && other.url == url;
}

const _grayscale = ColorFilter.matrix(<double>[
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0,
  0.2126, 0.7152, 0.0722, 0, 0,
  0, 0, 0, 1, 0,
]);

/// 実績のバッジ（Web の AchievementBadge）。未達成は色を抜いて鍵を付ける。レジェンド以上は虹色の光をかぶせる
class AchievementBadge extends StatelessWidget {
  const AchievementBadge({
    super.key,
    required this.achievementKey,
    required this.tier,
    required this.isHidden,
    required this.isUnlocked,
    this.size = 64,
  });

  final String achievementKey;
  final int tier;
  final bool isHidden;
  final bool isUnlocked;
  final double size;

  /// テストでは画像を読まない（端末の置き場所がない）
  @visibleForTesting
  static bool loadImages = true;

  @override
  Widget build(BuildContext context) {
    Widget image = !loadImages
        ? _placeholder(context)
        : SvgPicture(
            _CachedSvgLoader(achievementBadgeUrl(achievementKey, isHidden: isHidden, isUnlocked: isUnlocked)),
            width: size,
            height: size,
            placeholderBuilder: (_) => _placeholder(context),
          );
    final isLocked = !isUnlocked && !isHidden;
    if (isLocked) image = Opacity(opacity: 0.45, child: ColorFiltered(colorFilter: _grayscale, child: image));
    return SizedBox(
      width: size,
      height: size,
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned.fill(child: image),
        if (tier >= 6 && isUnlocked)
          Positioned.fill(
            child: IgnorePointer(
              child: Padding(
                padding: EdgeInsets.all(size * 0.1),
                child: const Opacity(
                  opacity: 0.6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      backgroundBlendMode: BlendMode.colorDodge,
                      gradient: SweepGradient(colors: [
                        Color(0x59FF4D8D),
                        Color(0x59FFD166),
                        Color(0x597BF1A8),
                        Color(0x596ECBFF),
                        Color(0x59C39BFF),
                        Color(0x59FF4D8D),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (isLocked && size >= 40)
          Positioned(
            right: size * 0.06,
            bottom: size * 0.06,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                border: Border.all(color: context.hairline),
                boxShadow: const [BoxShadow(color: Color(0x22000000), blurRadius: 3)],
              ),
              child: Icon(Icons.lock_outline_rounded, size: size * 0.16, color: context.muted),
            ),
          ),
      ]),
    );
  }

  Widget _placeholder(BuildContext context) => Container(
        margin: EdgeInsets.all(size * 0.14),
        decoration: BoxDecoration(color: context.skeleton, shape: BoxShape.circle),
      );
}

/// ランクの名前のチップ（Web の chipClassName）
class AchievementTierChip extends StatelessWidget {
  const AchievementTierChip(this.tier, {super.key, this.fontSize = 10.5});

  final int tier;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final t = achievementTier(tier);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: t.chip),
        borderRadius: Ds.br(99),
        boxShadow: [BoxShadow(color: t.chip.first.withValues(alpha: 0.3), blurRadius: 2, offset: const Offset(0, 1))],
      ),
      child: Text(t.label, style: TextStyle(color: t.chipText, fontSize: fontSize, fontWeight: FontWeight.w800, height: 1.3)),
    );
  }
}

/// ランクの色の文字（Web の textClassName。レジェンド・神話はグラデーション）
class AchievementTierText extends StatelessWidget {
  const AchievementTierText(this.text, {super.key, required this.tier, this.style});

  final String text;
  final int tier;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final t = achievementTier(tier);
    final colors = context.isDark ? t.darkText : t.text;
    if (colors.length == 1) return Text(text, style: style?.copyWith(color: colors.first) ?? TextStyle(color: colors.first));
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (r) => LinearGradient(colors: colors).createShader(r),
      child: Text(text, style: style),
    );
  }
}

/// 実績レベルの段階（Web の achievement-level-tier.ts と同じ幅・形・色）
class AchievementLevelTier {
  const AchievementLevelTier(this.key, this.minLevel, this.name, this.enName, this.shape, this.top, this.bottom);

  final String key;
  final int minLevel;
  final String name;
  final String enName;

  /// sprout / shield / gem / crown
  final String shape;
  final String top;
  final String bottom;

  String get label => tr(name, enName);
}

const achievementLevelTiers = <AchievementLevelTier>[
  AchievementLevelTier('sprout', 1, '若葉', 'Sprout', 'sprout', '#86efac', '#16a34a'),
  AchievementLevelTier('bronze', 5, 'ブロンズ', 'Bronze', 'shield', '#f4b183', '#a0522d'),
  AchievementLevelTier('silver', 10, 'シルバー', 'Silver', 'shield', '#f1f5f9', '#7c8796'),
  AchievementLevelTier('gold', 15, 'ゴールド', 'Gold', 'shield', '#fde68a', '#d97706'),
  AchievementLevelTier('sapphire', 20, 'サファイア', 'Sapphire', 'gem', '#93c5fd', '#1d4ed8'),
  AchievementLevelTier('amethyst', 30, 'アメジスト', 'Amethyst', 'gem', '#d8b4fe', '#7e22ce'),
  AchievementLevelTier('ruby', 40, 'ルビー', 'Ruby', 'gem', '#fda4af', '#be123c'),
  AchievementLevelTier('diamond', 50, 'ダイヤモンド', 'Diamond', 'gem', '#cffafe', '#0891b2'),
  AchievementLevelTier('crown', 60, 'クラウン', 'Crown', 'crown', '#fef08a', '#ca8a04'),
  AchievementLevelTier('legend', 80, 'レジェンド', 'Legend', 'crown', '#f9a8d4', '#7c3aed'),
];

/// レベルの段階と、次の段階（いちばん上なら null）
({AchievementLevelTier tier, AchievementLevelTier? next, int index}) achievementLevelTier(int level) {
  var index = 0;
  for (var i = 0; i < achievementLevelTiers.length; i++) {
    if (level >= achievementLevelTiers[i].minLevel) index = i;
  }
  return (tier: achievementLevelTiers[index], next: index + 1 < achievementLevelTiers.length ? achievementLevelTiers[index + 1] : null, index: index);
}

/// 実績レベルの段階の印（Web の AchievementLevelIcon と同じ絵。若葉 → 盾 → 宝石 → 王冠）
class AchievementLevelIcon extends StatelessWidget {
  const AchievementLevelIcon({super.key, required this.tier, this.size = 18});

  final AchievementLevelTier tier;
  final double size;

  static String svg(AchievementLevelTier t) {
    const outline = 'rgba(0,0,0,0.28)';
    final top = t.top;
    final bottom = t.bottom;
    const fill = 'url(#f)';
    final body = switch (t.shape) {
      'sprout' => '<path d="M10 18V10" stroke="$bottom" stroke-width="1.8" stroke-linecap="round"/>'
          '<path d="M10 11C10 6.5 6.5 4 2.5 4.5C2.5 9 5.5 11.5 10 11Z" fill="$fill" stroke="$outline" stroke-width="0.6"/>'
          '<path d="M10 9.5C10 5.5 13 2.5 17.5 2.5C17.5 7 14.5 9.8 10 9.5Z" fill="$fill" stroke="$outline" stroke-width="0.6"/>',
      'shield' => '<path d="M10 1.5L17 4.2V9.5C17 14 13.8 17 10 18.5C6.2 17 3 14 3 9.5V4.2L10 1.5Z" fill="$fill" stroke="$outline" stroke-width="0.7"/>'
          '<path d="M10 5.5L11.2 8.3L14.2 8.5L11.9 10.4L12.6 13.3L10 11.7L7.4 13.3L8.1 10.4L5.8 8.5L8.8 8.3Z" fill="#fff" fill-opacity="0.9"/>',
      'gem' => '<path d="M5.5 3H14.5L18.5 7.5L10 18L1.5 7.5L5.5 3Z" fill="$fill" stroke="$outline" stroke-width="0.7"/>'
          '<path d="M1.5 7.5H18.5M5.5 3L7.5 7.5L10 18M14.5 3L12.5 7.5L10 18M7.5 7.5L10 3L12.5 7.5" fill="none" stroke="#fff" stroke-opacity="0.6" stroke-width="0.7"/>'
          '<path d="M5.5 3H10L7.5 7.5H1.5Z" fill="#fff" fill-opacity="0.35"/>',
      _ => '<path d="M2 6L6 9.5L10 3L14 9.5L18 6L16.5 15H3.5L2 6Z" fill="$fill" stroke="$outline" stroke-width="0.7" stroke-linejoin="round"/>'
          '<rect x="3.5" y="15.5" width="13" height="2.5" rx="0.8" fill="$fill" stroke="$outline" stroke-width="0.6"/>'
          '<circle cx="10" cy="11.2" r="1.6" fill="#fff" fill-opacity="0.9"/>'
          '<circle cx="2" cy="6" r="1.1" fill="$top"/><circle cx="10" cy="3" r="1.1" fill="$top"/><circle cx="18" cy="6" r="1.1" fill="$top"/>',
    };
    return '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><defs><linearGradient id="f" x1="0" y1="0" x2="0" y2="1">'
        '<stop offset="0%" stop-color="$top"/><stop offset="100%" stop-color="$bottom"/></linearGradient></defs>$body</svg>';
  }

  @override
  Widget build(BuildContext context) => SvgPicture.string(svg(tier), width: size, height: size);
}

/// 「Lv.12」の虹色のチップ（Web のプロフィールの実績と同じ）
class AchievementLevelChip extends StatelessWidget {
  const AchievementLevelChip(this.level, {super.key, this.height = 26});

  final int level;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFEC4899), Color(0xFFFBBF24), Color(0xFF38BDF8)]),
        borderRadius: Ds.br(99),
      ),
      child: Text('Lv.$level', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 12)),
    );
  }
}
