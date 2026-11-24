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
    final s = GachaState.fromJson({
      'exchangePoints': 12,
      'shards': 40,
      'totalPulls': 12,
      'freePullsToday': 1,
      'isPremiumDealAvailable': false,
      'selectedHeaderFrameSlug': 'gacha-ur-kyubi',
      'ownedPrizes': [
        {'prizeId': GachaRules.pool.first.id, 'count': 2},
      ],
    });
    expect(s.owns(GachaRules.pool.first), true);
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
}
