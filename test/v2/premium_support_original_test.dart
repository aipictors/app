import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:aipictors/v2/work/support_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('オリジナル作品はタグで見る（大文字小文字・前後の空白は区別しない）', () {
    for (final t in ['オリジナル', 'オリジナルキャラ', 'オリジナルキャラクター', 'オリキャラ', '創作', '一次創作', 'original', 'Original', ' ORIGINAL ', ' オリジナル']) {
      expect(isOriginalWork(['風景', t]), isTrue, reason: t);
    }
    expect(isOriginalWork(['二次創作', 'ファンアート']), isFalse);
    expect(isOriginalWork(['オリジナル作品']), isFalse);
    expect(isOriginalWork(const []), isFalse);
    expect(isOriginalWork(null), isFalse);
  });

  test('オリジナルでない作品・作品なしではプレミアムコインを使わない', () {
    const balance = CoinSummary(free: 5, premium: 20);
    final notOriginal = balance.forTarget(originalWork: false);
    expect(notOriginal.premiumUsable, isFalse);
    expect(notOriginal.forSupport.premium, 0);
    // フリーが足りないときもプレミアムを自動で使わない
    expect(SupportBreakdown.of(10, notOriginal.forSupport), isNull);
    expect(SupportBreakdown.of(5, notOriginal.forSupport)!.premium, 0);

    final original = balance.forTarget(originalWork: true);
    expect(original.premiumUsable, isTrue);
    final b = SupportBreakdown.of(10, original.forSupport)!;
    expect((b.free, b.premium), (5, 5));

    // 作者がプレミアムを受け取らないなら、オリジナル作品でも使わない
    const refuses = CoinSummary(free: 5, premium: 20, premiumAccepted: false);
    expect(refuses.forTarget(originalWork: true).premiumUsable, isFalse);
  });

  test('API の断り（code・文言）を見分ける', () {
    expect(isPremiumOriginalOnlyError(const ApiException('x', code: 'PREMIUM_SUPPORT_ORIGINAL_ONLY')), isTrue);
    expect(isPremiumOriginalOnlyError(const ApiException('推しを送れませんでした（プレミアムコインでの推しは、オリジナル作品（「オリジナル」などのタグが付いた作品）だけに使えます）')), isTrue);
    expect(isPremiumOriginalOnlyError(const ApiException('コインが足りません')), isFalse);
  });

  Widget host(Widget child) => MaterialApp(home: Scaffold(body: SingleChildScrollView(child: child)));

  testWidgets('コメントの推し: オリジナルでない作品ではプレミアムの欄の代わりに理由を出す', (tester) async {
    await tester.pumpWidget(host(SupportPicker(balance: const CoinSummary(free: 50, premium: 10).forTarget(originalWork: false), free: 0, premium: 3, anonymous: false)));
    expect(find.text('プレミアム（×10pt）'), findsNothing);
    expect(find.textContaining('オリジナル作品だけに使えます'), findsOneWidget);
    expect(find.textContaining('推し合い'), findsNothing);
  });

  testWidgets('コメントの推し: オリジナル作品ではプレミアムを選べる', (tester) async {
    await tester.pumpWidget(host(SupportPicker(balance: const CoinSummary(free: 50, premium: 10).forTarget(originalWork: true), free: 0, premium: 0, anonymous: false)));
    expect(find.text('プレミアム（×10pt）'), findsOneWidget);
    expect(find.textContaining('オリジナル作品だけに使えます'), findsNothing);
  });

  testWidgets('理由の文言: 作者が受け取らないとき・オリジナル作品の推す画面', (tester) async {
    await tester.pumpWidget(host(const PremiumUnavailableNote(balance: CoinSummary(free: 1, premium: 1, premiumAccepted: false))));
    expect(find.textContaining('受け付けていません'), findsOneWidget);
    await tester.pumpWidget(host(PremiumUnavailableNote(balance: const CoinSummary(free: 1, premium: 1).forTarget(originalWork: false), originalWork: true)));
    expect(find.textContaining('コメントといっしょに推すと'), findsOneWidget);
  });
}
