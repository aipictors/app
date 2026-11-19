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

  test('プレミアムは 1 枚から（プリセットは 10 と色の区切り、−/＋ は 1 枚ずつ・最大は残高）', () {
    expect(premiumSupportPresets, [10, 100, 500, 1000, 3000]);
    expect(stepPremiumSupport(0, 1, 1234), 1);
    expect(stepPremiumSupport(300, 1, 1234), 301);
    expect(stepPremiumSupport(300, -1, 1234), 299);
    expect(stepPremiumSupport(1, -1, 1234), 1);
    expect(stepPremiumSupport(1234, 1, 1234), 1234);
    expect(stepPremiumSupport(0, 1, 0), 0);
  });

  test('推すシートの内訳: フリーを先に使い、足りない分をプレミアムで', () {
    const both = CoinSummary(free: 30, premium: 250);
    expect((SupportBreakdown.of(10, both)?.free, SupportBreakdown.of(10, both)?.premium), (10, 0));
    expect((SupportBreakdown.of(150, both)?.free, SupportBreakdown.of(150, both)?.premium), (30, 120));
    expect(SupportBreakdown.of(281, both), isNull);
    const premiumOnly = CoinSummary(free: 0, premium: 250);
    expect((SupportBreakdown.of(5, premiumOnly)?.free, SupportBreakdown.of(5, premiumOnly)?.premium), (0, 5));
  });

  test('応援の帯は時間で消さず・課金額の多い順・同じなら pt の多い順・新しい順', () {
    const now = 1800000000;
    final items = [
      (id: 'plain', at: now - 10, free: 0, premium: 0),
      (id: 'silver-old', at: now - 30 * 24 * 3600, free: 500, premium: 0),
      (id: 'silver-new', at: now - 60, free: 10, premium: 0),
      (id: 'blue-old', at: now - 4 * 3600, free: 0, premium: 100),
      (id: 'blue', at: now - 2 * 3600, free: 0, premium: 100),
      (id: 'green', at: now - 3600, free: 0, premium: 500),
      (id: 'red-old', at: now - 90 * 24 * 3600, free: 0, premium: 3000),
      (id: 'green-more-free', at: now - 7200, free: 50, premium: 500),
      (id: 'green-600', at: now - 30, free: 0, premium: 600),
    ];
    final picked = pickPinnedSupports(items, createdAt: (x) => x.at, free: (x) => x.free, premium: (x) => x.premium);
    expect(picked.map((x) => x.id).toList(), ['red-old', 'green-600', 'green-more-free', 'green', 'blue', 'blue-old', 'silver-old', 'silver-new']);
    final many = List.generate(80, (i) => (id: 'x$i', at: now - i, free: 0, premium: 100));
    expect(pickPinnedSupports(many, createdAt: (x) => x.at, free: (x) => x.free, premium: (x) => x.premium), hasLength(50));
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

  testWidgets('コメントの推し: プレミアムは 1 枚から、プリセットと −/＋ で選ぶ', (tester) async {
    Future<void> open(CoinSummary balance) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              key: ValueKey(balance.premium),
              child: SupportPicker(balance: balance, free: 0, premium: 0, anonymous: false),
            ),
          ),
        ),
      );
      await tester.pump();
    }

    await open(const CoinSummary(free: 50, premium: 1234));
    for (final n in [10, 100, 500, 1000]) {
      expect(find.text('$n'), findsOneWidget);
    }
    expect(find.text('プレミアムコインがありません'), findsNothing);
    await tester.tap(find.text('10'));
    await tester.pump();
    expect(find.text('10枚'), findsOneWidget);
    await tester.tap(find.byTooltip('1枚増やす'));
    await tester.pump();
    expect(find.text('11枚'), findsOneWidget);
    for (var i = 0; i < 12; i++) {
      await tester.tap(find.byTooltip('1枚減らす'), warnIfMissed: false);
      await tester.pump();
    }
    expect(find.text('1枚'), findsOneWidget);
    // 3000 は残高を超えるので押せない
    await tester.tap(find.text('3000'), warnIfMissed: false);
    await tester.pump();
    expect(find.text('1枚'), findsOneWidget);

    await open(const CoinSummary(free: 50, premium: 3));
    expect(find.text('プレミアムコインがありません'), findsNothing);
    expect(find.text('10'), findsOneWidget);

    await open(const CoinSummary(free: 50, premium: 0));
    expect(find.text('プレミアムコインがありません'), findsOneWidget);
  });
}
