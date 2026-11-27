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

  testWidgets('推す画面の枚数のしるしはコイン数と pt を出す（円は出さない）', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SupportTierChip(free: 30, premium: 5, pt: 80))));
    expect(find.text('5'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);
    expect(find.textContaining('円'), findsNothing);
  });
}
