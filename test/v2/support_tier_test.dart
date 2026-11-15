import 'package:aipictors/v2/core/support_tier.dart';
import 'package:aipictors/v2/widgets/support_tier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('段階は Web と同じ区切り', () {
    expect(SupportTier.of(0), isNull);
    expect(SupportTier.of(-1), isNull);
    expect(SupportTier.of(1)!.level, 1);
    expect(SupportTier.of(19)!.level, 1);
    expect(SupportTier.of(20)!.level, 2);
    expect(SupportTier.of(50)!.level, 3);
    expect(SupportTier.of(100)!.level, 4);
    expect(SupportTier.of(300)!.level, 5);
    expect(SupportTier.of(1000)!.level, 6);
    expect(SupportTier.all.length, 6);
    expect(SupportTier.ptOf(3, 2), 23);
  });

  test('応援の帯は段階の時間内だけ・段階の高い順・新しい順', () {
    const now = 1800000000;
    final items = [
      (id: 'plain', at: now - 10, pt: 0),
      (id: 'blue-old', at: now - 2 * 3600, pt: 10),
      (id: 'blue-new', at: now - 60, pt: 10),
      (id: 'green', at: now - 3600, pt: 60),
      (id: 'red', at: now - 6 * 24 * 3600, pt: 1000),
      (id: 'red-expired', at: now - 8 * 24 * 3600, pt: 1000),
      (id: 'green-newer', at: now - 30, pt: 60),
    ];
    final picked = pickPinnedSupports(items, createdAt: (x) => x.at, totalPt: (x) => x.pt, nowSeconds: now);
    expect(picked.map((x) => x.id).toList(), ['red', 'green-newer', 'green', 'blue-new']);
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
}
