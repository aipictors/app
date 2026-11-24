// スペシャル枠ガチャの決まり（値段・確率・交換）。Web の app/components/gacha/gacha-rules.ts の写し。
// 抽選はサーバー（aipictors-system lib/gacha-rules.ts）。表示と実際がずれると景品表示法・業界の指針に反するので、変えるときは 3 つとも同じ値にする。
import 'package:aipictors/v2/frames/gacha_prizes.dart';
import 'package:flutter/material.dart';

enum GachaRarity {
  n('N'),
  r('R'),
  sr('SR'),
  ssr('SSR'),
  ur('UR');

  const GachaRarity(this.label);

  final String label;

  /// レア度の札の色（Web の RARITY_BADGE）
  Gradient get badge => switch (this) {
        GachaRarity.ur => const LinearGradient(colors: [Color(0xFFF472B6), Color(0xFFFCD34D), Color(0xFF38BDF8)]),
        GachaRarity.ssr => const LinearGradient(colors: [Color(0xFFFBBF24), Color(0xFFFBBF24)]),
        GachaRarity.sr => const LinearGradient(colors: [Color(0xFFA78BFA), Color(0xFFA78BFA)]),
        GachaRarity.r => const LinearGradient(colors: [Color(0xFF38BDF8), Color(0xFF38BDF8)]),
        GachaRarity.n => const LinearGradient(colors: [Color(0xFF94A3B8), Color(0xFF94A3B8)]),
      };

  /// 結果のカードの光の色
  Color get glow => switch (this) {
        GachaRarity.ur => const Color(0xFFFF9EE6),
        GachaRarity.ssr => const Color(0xFFFFC94D),
        GachaRarity.sr => const Color(0xFFB794FF),
        GachaRarity.r => const Color(0xFF6CC6FF),
        GachaRarity.n => const Color(0xFFB8C2D0),
      };

  static GachaRarity? parse(String value) {
    for (final r in values) {
      if (r.label == value) return r;
    }
    return null;
  }
}

enum GachaPrizeKind { icon, header }

class GachaPrize {
  const GachaPrize({
    required this.id,
    required this.kind,
    required this.slug,
    required this.rarity,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.inPool,
  });

  final String id;
  final GachaPrizeKind kind;
  final String slug;
  final GachaRarity rarity;
  final String name;
  final String description;

  /// Web の public の画像（/avatar-frames/deco/... や /header-frames/...）
  final String imagePath;

  /// false: 作ってあるが、いまのガチャには入れない
  final bool inPool;

  String get imageUrl => '${GachaRules.webOrigin}$imagePath';

  /// アイコン枠の動く絵（x.webp → x.anim.webp）
  String get animatedImageUrl => imageUrl.replaceFirst(RegExp(r'\.webp$'), '.anim.webp');

  String get kindLabel => kind == GachaPrizeKind.icon ? 'アイコン枠' : 'ヘッダー枠';

  static GachaPrize? byId(String id) {
    for (final p in gachaPrizes) {
      if (p.id == id) return p;
    }
    return null;
  }
}

enum GachaCoinType {
  free('FREE'),
  premium('PREMIUM');

  const GachaCoinType(this.value);

  final String value;
}

class GachaPrice {
  const GachaPrice(this.costCoins, {this.isDeal = false});

  final int costCoins;
  final bool isDeal;
}

class GachaRules {
  GachaRules._();

  static const webOrigin = 'https://www.aipictors.com';

  static const rates = <GachaRarity, double>{
    GachaRarity.ur: 0.3,
    GachaRarity.ssr: 2.7,
    GachaRarity.sr: 12,
    GachaRarity.r: 30,
    GachaRarity.n: 55,
  };

  /// 10 連の 10 枠目は、それまでに出ていなければこのレア度以上から選ぶ
  static const tenPullGuarantee = GachaRarity.sr;

  static const premiumSingle = 200;
  static const premiumTen = 2000;

  /// プレミアムコインの 10 連、1 日 1 回目は半額
  static const premiumDailyTen = 1000;

  /// フリーコインは 1 回ずつ。1 日 1 回目はお得
  static const freeFirst = 100;
  static const freeSingle = 300;

  static const freeDailyLimit = 10;

  /// 1 回引くと 1 たまり、この数で好きな景品を 1 つ選べる（天井）
  static const exchangePoints = 200;

  static const duplicateShards = <GachaRarity, int>{
    GachaRarity.ur: 300,
    GachaRarity.ssr: 60,
    GachaRarity.sr: 15,
    GachaRarity.r: 4,
    GachaRarity.n: 1,
  };

  static const exchangeShards = <GachaRarity, int>{
    GachaRarity.ur: 2000,
    GachaRarity.ssr: 450,
    GachaRarity.sr: 120,
    GachaRarity.r: 40,
    GachaRarity.n: 15,
  };

  static List<GachaPrize> get pool => gachaPrizes.where((p) => p.inPool).toList();

  /// 高いレア度から
  static List<GachaRarity> get raritiesDesc => GachaRarity.values.reversed.toList();

  /// minRarity 以上だけで割り直した確率（%）
  static Map<GachaRarity, double> rarityRates([GachaRarity minRarity = GachaRarity.n]) {
    final p = pool;
    final picked = GachaRarity.values.where((r) => r.index >= minRarity.index && p.any((x) => x.rarity == r)).toList();
    final total = picked.fold<double>(0, (sum, r) => sum + rates[r]!);
    return {for (final r in GachaRarity.values) r: picked.contains(r) ? rates[r]! / total * 100 : 0};
  }

  /// 景品ひとつあたりの確率（%）
  static double prizeRate(GachaPrize prize, {bool guaranteed = false}) {
    final r = rarityRates(guaranteed ? tenPullGuarantee : GachaRarity.n);
    final same = pool.where((p) => p.rarity == prize.rarity).length;
    return same > 0 ? r[prize.rarity]! / same : 0;
  }

  /// Web の formatGachaRate と同じ丸め
  static String formatRate(double percent) {
    if (percent == 0) return '0%';
    String trim(String s) => s.contains('.') ? s.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '') : s;
    if (percent >= 1) return '${trim(percent.toStringAsFixed(3))}%';
    return '${trim(percent.toStringAsPrecision(3))}%';
  }

  /// 次に引くときの値段（サーバーの toGachaPrice と同じ）。null は引けない
  static GachaPrice? price({required GachaCoinType coinType, required int count, required int freePullsToday, required bool isPremiumDealAvailable}) {
    if (coinType == GachaCoinType.free) {
      if (count != 1) return null;
      if (freePullsToday >= freeDailyLimit) return null;
      return freePullsToday == 0 ? const GachaPrice(freeFirst, isDeal: true) : const GachaPrice(freeSingle);
    }
    if (count == 1) return const GachaPrice(premiumSingle);
    return isPremiumDealAvailable ? const GachaPrice(premiumDailyTen, isDeal: true) : const GachaPrice(premiumTen);
  }
}
