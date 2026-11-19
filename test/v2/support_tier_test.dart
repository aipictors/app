import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/support_tier.dart';
import 'package:aipictors/v2/widgets/support_tier.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('段階はフリー・プレミアムの枚数で決める（Web と同じ区切り）', () {
    SupportTier? of(int free, int premium) => SupportTier.of(free: free, premium: premium);
    expect(of(0, 0), isNull);
    expect(of(-1, 0), isNull);
    // フリーだけは枚数に関係なくシルバー
    expect(of(1, 0)!.level, 0);
    expect(of(5000, 0)!.level, 0);
    expect(of(5000, 0)!.pinSeconds, 3600);
    expect(of(1, 0)!.color, const Color(0xFF94A3B8));
    expect(of(1, 0)!.color2, const Color(0xFFCBD5E1));
    expect(of(1, 0)!.onColor, const Color(0xFF0F172A));
    // プレミアムを含むとプレミアムの枚数で（100 未満の古い推しは青）
    expect(of(0, 1)!.level, 1);
    expect(of(100, 50)!.level, 1);
    expect(of(0, 499)!.level, 1);
    expect(of(0, 499)!.pinSeconds, 3 * 3600);
    expect(of(0, 500)!.level, 2);
    expect(of(0, 500)!.pinSeconds, 12 * 3600);
    expect(of(0, 999)!.level, 2);
    expect(of(0, 1000)!.level, 3);
    expect(of(0, 1000)!.pinSeconds, 24 * 3600);
    expect(of(0, 2999)!.level, 3);
    expect(of(0, 3000)!.level, 4);
    expect(of(9999, 3000)!.pinSeconds, 7 * 24 * 3600);
    expect(of(0, 3000)!.color2, const Color(0xFFDC2626));
    // フリーの枚数はプレミアムの段階を上げない
    expect(of(5000, 100)!.level, 1);
    expect(SupportTier.all.map((t) => t.level).toList(), [0, 1, 2, 3, 4]);
    expect(SupportTier.ptOf(3, 2), 23);
  });

  test('プレミアムの枚数は 100 単位（最小 100・最大は残高の切り捨て・100 未満は選べない）', () {
    expect(premiumSupportPresets, [100, 300, 500, 1000, 3000]);
    expect(maxPremiumSupport(99), 0);
    expect(maxPremiumSupport(100), 100);
    expect(maxPremiumSupport(1234), 1200);
    // −/＋ は 100 ずつ
    expect(stepPremiumSupport(0, 1, 1234), 100);
    expect(stepPremiumSupport(300, 1, 1234), 400);
    expect(stepPremiumSupport(300, -1, 1234), 200);
    expect(stepPremiumSupport(100, -1, 1234), 100);
    expect(stepPremiumSupport(1200, 1, 1234), 1200);
    expect(stepPremiumSupport(0, 1, 99), 0);
  });

  test('推すシートの内訳: フリーを先に使い、足りない分のプレミアムは 100 枚単位', () {
    const both = CoinSummary(free: 30, premium: 250);
    expect(SupportBreakdown.of(10, both)?.free, 10);
    expect(SupportBreakdown.of(10, both)?.premium, 0);
    // 130 枚 = フリー 30 ＋ プレミアム 100
    expect((SupportBreakdown.of(130, both)?.free, SupportBreakdown.of(130, both)?.premium), (30, 100));
    // 150 枚はフリー 50 が要るが 30 しか無い（プレミアム 200 だと多すぎる）ので送れない
    expect(SupportBreakdown.of(150, both), isNull);
    expect(SupportBreakdown.blockedByPremiumUnit(150, both), isTrue);
    // 230 枚 = フリー 30 ＋ プレミアム 200
    expect((SupportBreakdown.of(230, both)?.free, SupportBreakdown.of(230, both)?.premium), (30, 200));
    // プレミアムだけで 50 枚は送れない（100 枚から）
    const premiumOnly = CoinSummary(free: 0, premium: 250);
    expect(SupportBreakdown.of(50, premiumOnly), isNull);
    expect(SupportBreakdown.blockedByPremiumUnit(50, premiumOnly), isTrue);
    expect(SupportBreakdown.of(300, premiumOnly), isNull);
    expect(SupportBreakdown.blockedByPremiumUnit(300, premiumOnly), isFalse);
  });

  test('応援の帯は段階の時間内だけ・段階の高い順・新しい順', () {
    const now = 1800000000;
    final items = [
      (id: 'plain', at: now - 10, free: 0, premium: 0),
      (id: 'silver-old', at: now - 2 * 3600, free: 500, premium: 0),
      (id: 'silver-new', at: now - 60, free: 10, premium: 0),
      (id: 'blue-old', at: now - 4 * 3600, free: 0, premium: 100),
      (id: 'blue', at: now - 2 * 3600, free: 0, premium: 100),
      (id: 'green', at: now - 3600, free: 0, premium: 500),
      (id: 'red', at: now - 6 * 24 * 3600, free: 0, premium: 3000),
      (id: 'red-expired', at: now - 8 * 24 * 3600, free: 0, premium: 3000),
      (id: 'green-newer', at: now - 30, free: 0, premium: 600),
    ];
    final picked = pickPinnedSupports(items, createdAt: (x) => x.at, free: (x) => x.free, premium: (x) => x.premium, nowSeconds: now);
    expect(picked.map((x) => x.id).toList(), ['red', 'green-newer', 'green', 'blue', 'silver-new']);
  });

  test('報酬の対象は全年齢だけ', () {
    expect(isCreatorRewardRating('G'), isTrue);
    expect(isCreatorRewardRating('R15'), isTrue);
    expect(isCreatorRewardRating('R18'), isFalse);
    expect(isCreatorRewardRating('R18G'), isFalse);
    expect(isCreatorRewardRating(null), isFalse);
  });

  testWidgets('帯にコイン数と pt を出す（円は出さない）', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SupportBand(free: 30, premium: 5, pt: 80))));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('5'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);
    expect(find.text('80pt'), findsOneWidget);
    expect(find.textContaining('円'), findsNothing);
  });

  testWidgets('コメントの推し: プレミアムは 100 枚単位のプリセット、残高 100 未満は選べない', (tester) async {
    Future<void> open(CoinSummary balance) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: SingleChildScrollView(key: ValueKey(balance.premium), child: SupportPicker(balance: balance, free: 0, premium: 0, anonymous: false)))));
      await tester.pump();
    }

    await open(const CoinSummary(free: 50, premium: 1234));
    for (final n in [100, 300, 500, 1000]) {
      expect(find.text('$n'), findsOneWidget);
    }
    expect(find.text('プレミアムコインは100枚から推せます'), findsNothing);
    await tester.tap(find.text('300'));
    await tester.pump();
    expect(find.text('300枚'), findsOneWidget);
    await tester.tap(find.byTooltip('100枚増やす'));
    await tester.pump();
    expect(find.text('400枚'), findsOneWidget);
    await tester.tap(find.byTooltip('100枚減らす'));
    await tester.tap(find.byTooltip('100枚減らす'));
    await tester.tap(find.byTooltip('100枚減らす'));
    await tester.pump();
    expect(find.text('100枚'), findsOneWidget);
    // 3000 は残高を超えるので押せない
    await tester.tap(find.text('3000'), warnIfMissed: false);
    await tester.pump();
    expect(find.text('100枚'), findsOneWidget);

    await open(const CoinSummary(free: 50, premium: 99));
    expect(find.text('プレミアムコインは100枚から推せます'), findsOneWidget);
    expect(find.text('100'), findsNothing);
  });
}
