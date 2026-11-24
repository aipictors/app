import 'package:aipictors/v2/frames/frame_widgets.dart';
import 'package:aipictors/v2/frames/frames_api.dart';
import 'package:aipictors/v2/frames/gacha_rates_screen.dart';
import 'package:aipictors/v2/frames/gacha_rules.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('提供割合: 通常も確定枠も合計 100%、確定枠は SR 以上だけ', () {
    final normal = GachaRules.rarityRates();
    final guaranteed = GachaRules.rarityRates(GachaRules.tenPullGuarantee);
    expect(normal.values.fold<double>(0, (a, b) => a + b), closeTo(100, 1e-9));
    expect(guaranteed.values.fold<double>(0, (a, b) => a + b), closeTo(100, 1e-9));
    expect(guaranteed[GachaRarity.n], 0);
    expect(guaranteed[GachaRarity.r], 0);
    expect(normal[GachaRarity.ur], closeTo(0.3, 1e-9));
    final perPrize = GachaRules.pool.fold<double>(0, (sum, p) => sum + GachaRules.prizeRate(p));
    expect(perPrize, closeTo(100, 1e-9));
  });

  test('割合の丸めは Web の formatGachaRate と同じ', () {
    expect(GachaRules.formatRate(0), '0%');
    expect(GachaRules.formatRate(55), '55%');
    expect(GachaRules.formatRate(0.3), '0.3%');
    expect(GachaRules.formatRate(12.5), '12.5%');
    expect(GachaRules.formatRate(0.0123456), '0.0123%');
    expect(GachaRules.formatRate(3.4375), '3.438%');
  });

  test('値段: フリーは 1 日 1 回目がお得で上限あり、プレミアム 10 連は 1 日 1 回半額（サーバーの toGachaPrice と同じ）', () {
    GachaPrice? p(GachaCoinType t, int c, {int free = 0, bool deal = true}) => GachaRules.price(coinType: t, count: c, freePullsToday: free, isPremiumDealAvailable: deal);
    expect(p(GachaCoinType.free, 1)!.costCoins, 100);
    expect(p(GachaCoinType.free, 1)!.isDeal, true);
    expect(p(GachaCoinType.free, 1, free: 3)!.costCoins, 300);
    expect(p(GachaCoinType.free, 1, free: 10), isNull);
    expect(p(GachaCoinType.free, 10), isNull);
    expect(p(GachaCoinType.premium, 1)!.costCoins, 200);
    expect(p(GachaCoinType.premium, 10)!.costCoins, 1000);
    expect(p(GachaCoinType.premium, 10, deal: false)!.costCoins, 2000);
  });

  test('景品の一覧: id は重ならず、アイコン枠とヘッダー枠がある', () {
    final ids = GachaRules.pool.map((p) => p.id).toSet();
    expect(ids.length, GachaRules.pool.length);
    expect(GachaRules.pool.any((p) => p.kind == GachaPrizeKind.icon), true);
    expect(GachaRules.pool.any((p) => p.kind == GachaPrizeKind.header), true);
    expect(GachaPrize.byId(GachaRules.pool.first.id), same(GachaRules.pool.first));
  });

  test('ガチャの状態を読む', () {
    final normal = GachaRules.pool.firstWhere((p) => !p.rarity.isUnique);
    final s = GachaState.fromJson({
      'exchangePoints': 12,
      'shards': 40,
      'totalPulls': 12,
      'freePullsToday': 1,
      'isPremiumDealAvailable': false,
      'selectedHeaderFrameSlug': 'gacha-ur-kyubi',
      'ownedPrizes': [
        {'prizeId': normal.id, 'count': 2},
        {'prizeId': GachaRules.uniquePrizes.first.id, 'count': 1},
      ],
    });
    expect(s.owns(normal), true);
    // UUR はコンプリートの数に入れない
    expect(s.owns(GachaRules.uniquePrizes.first), true);
    expect(s.ownedInPool, 1);
    expect(s.isPremiumDealAvailable, false);
    expect(s.selectedHeaderFrameSlug, 'gacha-ur-kyubi');
  });

  test('枠を使えるか: コインの枠は買った人だけ、サブスクの枠はそのプラン以上（Web の toUserAvatarFrameAccess）', () {
    FrameItem f({int? price, String pass = 'FREE'}) => FrameItem(
          id: 'f1',
          slug: 'deco-cute-x',
          name: 'x',
          description: null,
          requiredPassType: pass,
          priceCoins: price,
          isPremiumCoinsOnly: false,
          frame: const AvatarFrame(frameType: 'DECORATION'),
        );
    expect(FrameRules.access(f(price: 500), currentPassType: null, ownedFrameIds: {}), FrameAccess.needsCoins);
    expect(FrameRules.access(f(price: 500), currentPassType: null, ownedFrameIds: {'f1'}), FrameAccess.available);
    expect(FrameRules.access(f(pass: 'STANDARD'), currentPassType: 'LITE', ownedFrameIds: {}), FrameAccess.needsPlan);
    expect(FrameRules.access(f(pass: 'STANDARD'), currentPassType: 'PREMIUM', ownedFrameIds: {}), FrameAccess.available);
    expect(FrameRules.category('deco-cute-ribbon'), 'cute');
    expect(FrameRules.category('deco-plan-gold'), 'plan');
    expect(FrameRules.category('gradient-blue'), 'basic');
    expect(FrameRules.category('deco-unknown-x'), 'basic');
  });

  testWidgets('提供割合の画面: 料金・レア度ごと・景品ごとの表とご注意が出る', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: GachaRatesScreen()));
    await tester.pump();
    expect(find.text('料金'), findsOneWidget);
    expect(find.text('レア度ごとの提供割合'), findsOneWidget);
    expect(find.byType(RarityBadge), findsWidgets);
    await tester.scrollUntilVisible(find.text('ご注意'), 400);
    expect(find.text('ご注意'), findsOneWidget);
  });

  test('UUR: 5 種・合計 0.05%（N 55% → 54.95% から引く）、確定枠も 0.05% で残りを SR 以上で割り直す（Web・サーバーと同じ）', () {
    expect(GachaRules.uniquePrizes.length, 5);
    expect(GachaRules.uniquePrizes.every((p) => p.slug.startsWith('gacha-uur-')), isTrue);
    final normal = GachaRules.rarityRates();
    expect(normal[GachaRarity.uur], closeTo(0.05, 1e-9));
    expect(normal[GachaRarity.n], closeTo(54.95, 1e-9));
    expect(normal[GachaRarity.r], closeTo(30, 1e-9));
    final guaranteed = GachaRules.rarityRates(GachaRules.tenPullGuarantee);
    expect(guaranteed[GachaRarity.uur], closeTo(0.05, 1e-9));
    expect(guaranteed[GachaRarity.sr], closeTo(80 * 0.9995, 1e-9));
    expect(guaranteed[GachaRarity.ur], closeTo(2 * 0.9995, 1e-9));
    expect(guaranteed.values.fold<double>(0, (a, b) => a + b), closeTo(100, 1e-9));
    for (final u in GachaRules.uniquePrizes) {
      expect(GachaRules.prizeRate(u), closeTo(0.01, 1e-9));
    }
    expect(GachaRules.exchangeShards[GachaRarity.uur], 0);
  });

  test('UUR: 取られた枠は抜け、残りで 0.05% を等分。全部取られたら 0% で N 55% に戻る', () {
    final ids = GachaRules.uniquePrizes.map((p) => p.id).toList();
    final two = GachaRules.poolWithout(ids.take(2));
    expect(GachaRules.prizeRate(GachaRules.uniquePrizes[0], inPool: two), 0);
    expect(GachaRules.prizeRate(GachaRules.uniquePrizes[4], inPool: two), closeTo(0.05 / 3, 1e-9));
    expect(two.fold<double>(0, (sum, p) => sum + GachaRules.prizeRate(p, inPool: two)), closeTo(100, 1e-9));
    final none = GachaRules.poolWithout(ids);
    final normal = GachaRules.rarityRates(GachaRarity.n, none);
    expect(normal[GachaRarity.uur], 0);
    expect(normal[GachaRarity.n], closeTo(55, 1e-9));
    final guaranteed = GachaRules.rarityRates(GachaRules.tenPullGuarantee, none);
    expect(guaranteed[GachaRarity.sr], closeTo(80, 1e-9));
  });

  test('UUR の持ち主と提供割合を読む（退会・未獲得）', () {
    final id = GachaRules.uniquePrizes.first.id;
    final claimed = GachaUniquePrize.fromJson({
      'prizeId': id,
      'isClaimed': true,
      'claimedAt': '2026-11-24T01:00:00.000Z',
      'isOwnerWithdrawn': false,
      'owner': {'id': '9', 'login': 'a', 'name': 'A', 'iconUrl': null},
    })!;
    expect(claimed.ownerName, 'A');
    expect(claimed.claimedAt, isNotNull);
    final gone = GachaUniquePrize.fromJson({'prizeId': id, 'isClaimed': true, 'claimedAt': null, 'isOwnerWithdrawn': true, 'owner': null})!;
    expect(gone.ownerId, isNull);
    expect(gone.isOwnerWithdrawn, isTrue);
    expect(GachaUniquePrize.fromJson({'prizeId': 'icon:nope', 'isClaimed': false}), isNull);
    final snap = GachaRatesSnapshot.fromJson({
      'gachaRates': {
        'remainingUniquePrizes': 4,
        'totalUniquePrizes': 5,
        'uniquePrizeRate': 0.0125,
        'rarityRates': [
          {'rarity': 'UUR', 'normal': 0.05, 'guaranteed': 0.05},
        ],
      },
      'gachaUniquePrizes': [
        {'prizeId': id, 'isClaimed': true},
      ],
    });
    expect(snap.remainingUniquePrizes, 4);
    expect(snap.normal[GachaRarity.uur], 0.05);
    expect(snap.takenPrizeIds, {id});
  });
}
