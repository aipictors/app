// スペシャル枠ガチャの決まり（値段・確率・交換）。Web の app/components/gacha/gacha-rules.ts の写し。
// 抽選はサーバー（aipictors-system lib/gacha-rules.ts）。表示と実際がずれると景品表示法・業界の指針に反するので、変えるときは 3 つとも同じ値にする。
import 'package:aipictors/v2/frames/gacha_prizes.dart';
import 'package:flutter/material.dart';

enum GachaRarity {
  n('N'),
  r('R'),
  sr('SR'),
  ssr('SSR'),
  ur('UR'),

  /// 世界で 1 人だけが持てる枠（最初に当てた人だけ。取られたらガチャから抜ける。交換 pt・かけらでは交換できない）
  uur('UUR');

  const GachaRarity(this.label);

  final String label;

  /// レア度の札の色（Web の RARITY_BADGE）
  Gradient get badge => switch (this) {
        GachaRarity.uur => const LinearGradient(colors: [Color(0xFF0B0B14), Color(0xFF8A6A1C), Color(0xFFF8E7A8), Color(0xFF8A6A1C), Color(0xFF0B0B14)]),
        GachaRarity.ur => const LinearGradient(colors: [Color(0xFFF472B6), Color(0xFFFCD34D), Color(0xFF38BDF8)]),
        GachaRarity.ssr => const LinearGradient(colors: [Color(0xFFFBBF24), Color(0xFFFBBF24)]),
        GachaRarity.sr => const LinearGradient(colors: [Color(0xFFA78BFA), Color(0xFFA78BFA)]),
        GachaRarity.r => const LinearGradient(colors: [Color(0xFF38BDF8), Color(0xFF38BDF8)]),
        GachaRarity.n => const LinearGradient(colors: [Color(0xFF94A3B8), Color(0xFF94A3B8)]),
      };

  /// 結果のカードの光の色
  Color get glow => switch (this) {
        GachaRarity.uur => const Color(0xFFFFF4D0),
        GachaRarity.ur => const Color(0xFFFF9EE6),
        GachaRarity.ssr => const Color(0xFFFFC94D),
        GachaRarity.sr => const Color(0xFFB794FF),
        GachaRarity.r => const Color(0xFF6CC6FF),
        GachaRarity.n => const Color(0xFFB8C2D0),
      };

  /// 札の文字の色（UUR は暗い札なので明るい文字）
  Color get badgeText => this == GachaRarity.uur ? const Color(0xFFFFF7DD) : const Color(0xFF0F172A);

  bool get isUnique => this == GachaRarity.uur;

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

  /// レア度ごとの確率（%）。合計 100。
  /// UUR は 1 回あたり合計 0.05%（残っている UUR で等分）で、その 0.05% は N から引いている（もとは N 55%）。
  /// UUR が 1 つも残っていなければ UUR は 0% で、0.05% は N に戻る（N 55%）
  static const rates = <GachaRarity, double>{
    GachaRarity.uur: 0.05,
    GachaRarity.ur: 0.3,
    GachaRarity.ssr: 2.7,
    GachaRarity.sr: 12,
    GachaRarity.r: 30,
    GachaRarity.n: 54.95,
  };

  /// UUR が残っていないとき、UUR の分を戻すレア度
  static const uniqueFallback = GachaRarity.n;

  /// 10 連の 10 枠目は、それまでに出ていなければこのレア度以上から選ぶ（UUR も SR 以上に数える）。
  /// 確定枠でも UUR は 0.05%（残っていれば）で、残りの 99.95% を SR・SSR・UR で割り直す
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

  /// かぶったときのかけら（UUR は 1 人しか持てないのでかぶらない）
  static const duplicateShards = <GachaRarity, int>{
    GachaRarity.uur: 0,
    GachaRarity.ur: 300,
    GachaRarity.ssr: 60,
    GachaRarity.sr: 15,
    GachaRarity.r: 4,
    GachaRarity.n: 1,
  };

  /// かけらで交換するときの数（UUR は交換できない）
  static const exchangeShards = <GachaRarity, int>{
    GachaRarity.uur: 0,
    GachaRarity.ur: 2000,
    GachaRarity.ssr: 450,
    GachaRarity.sr: 120,
    GachaRarity.r: 40,
    GachaRarity.n: 15,
  };

  /// ガチャの景品（UUR は誰にも取られていないときの全部。取られたものは poolWithout で外す）
  static List<GachaPrize> get pool => gachaPrizes.where((p) => p.inPool).toList();

  static List<GachaPrize> get uniquePrizes => pool.where((p) => p.rarity.isUnique).toList();

  /// 取られた UUR を外した、いまのガチャの景品
  static List<GachaPrize> poolWithout(Iterable<String> takenPrizeIds) {
    final taken = takenPrizeIds.toSet();
    return pool.where((p) => !(p.rarity.isUnique && taken.contains(p.id))).toList();
  }

  /// 高いレア度から
  static List<GachaRarity> get raritiesDesc => GachaRarity.values.reversed.toList();

  /// いまの確率（%）。サーバーの toEffectiveRates と同じ計算。
  /// UUR: 残っていれば 0.05%（どの枠でも同じ）、なければ 0（その分は N に戻す）。
  /// ほかのレア度: 景品がないレア度を外し、minRarity 以上だけで「100 - UUR」に割り直す
  static Map<GachaRarity, double> rarityRates([GachaRarity minRarity = GachaRarity.n, List<GachaPrize>? inPool]) {
    final p = inPool ?? pool;
    final uniqueRate = p.any((x) => x.rarity.isUnique) ? rates[GachaRarity.uur]! : 0.0;
    final picked = GachaRarity.values.where((r) => !r.isUnique && r.index >= minRarity.index && p.any((x) => x.rarity == r)).toList();
    double base(GachaRarity r) => rates[r]! + (r == uniqueFallback ? rates[GachaRarity.uur]! - uniqueRate : 0);
    final total = picked.fold<double>(0, (sum, r) => sum + base(r));
    return {
      for (final r in GachaRarity.values)
        r: r.isUnique
            ? uniqueRate
            : picked.contains(r) && total > 0
                ? base(r) / total * (100 - uniqueRate)
                : 0,
    };
  }

  /// 景品ひとつあたりの確率（%）。inPool は取られた UUR を外したもの
  static double prizeRate(GachaPrize prize, {bool guaranteed = false, List<GachaPrize>? inPool}) {
    final p = inPool ?? pool;
    if (!p.any((x) => x.id == prize.id)) return 0;
    final r = rarityRates(guaranteed ? tenPullGuarantee : GachaRarity.n, p);
    final same = p.where((x) => x.rarity == prize.rarity).length;
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
