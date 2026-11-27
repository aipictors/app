import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:aipictors/v2/work/support_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('作品からの推しではプレミアムコインを使わない（プロフィールからの推しだけ使える）', () {
    const balance = CoinSummary(free: 5, premium: 20);
    final fromWork = balance.forWork;
    expect(fromWork.premiumUsable, isFalse);
    expect(fromWork.forSupport.premium, 0);
    // フリーが足りないときもプレミアムを自動で使わない
    expect(SupportBreakdown.of(10, fromWork.forSupport), isNull);
    expect(SupportBreakdown.of(5, fromWork.forSupport)!.premium, 0);

    // プロフィールからの推し（そのままの残高）はプレミアムも使える
    expect(balance.premiumUsable, isTrue);
    final b = SupportBreakdown.of(10, balance.forSupport)!;
    expect((b.free, b.premium), (5, 5));

    // 作者がプレミアムを受け取らないなら、プロフィールからでも使わない
    const refuses = CoinSummary(free: 5, premium: 20, premiumAccepted: false);
    expect(refuses.premiumUsable, isFalse);
  });

  test('API の断り（新旧の code・文言）を見分ける', () {
    expect(isPremiumUserOnlyError(const ApiException('x', code: 'PREMIUM_SUPPORT_USER_ONLY')), isTrue);
    expect(isPremiumUserOnlyError(const ApiException('x', code: 'PREMIUM_SUPPORT_ORIGINAL_ONLY')), isTrue);
    expect(isPremiumUserOnlyError(const ApiException('推しを送れませんでした（プレミアムコインでの推しは、作品ではなくユーザー（プロフィール）への推しだけに使えます（オリジナル作品も同じです））')), isTrue);
    expect(isPremiumUserOnlyError(const ApiException('推しを送れませんでした（プレミアムコインでの推しは、オリジナル作品（「オリジナル」などのタグが付いた作品）だけに使えます）')), isTrue);
    expect(isPremiumUserOnlyError(const ApiException('コインが足りません')), isFalse);
  });

  Widget host(Widget child) => MaterialApp(home: Scaffold(body: SingleChildScrollView(child: child)));

  testWidgets('コメントの推し: プレミアムの欄の代わりに理由を出す', (tester) async {
    await tester.pumpWidget(host(SupportPicker(balance: const CoinSummary(free: 50, premium: 10).forWork, free: 0, premium: 3, anonymous: false)));
    expect(find.text('プレミアム（×10pt）'), findsNothing);
    expect(find.textContaining('ユーザーへの推し（プロフィールから）だけに使えます'), findsOneWidget);
  });

  testWidgets('理由の文言: 作者が受け取らないとき・作品からの推し', (tester) async {
    await tester.pumpWidget(host(const PremiumUnavailableNote(balance: CoinSummary(free: 1, premium: 1, premiumAccepted: false))));
    expect(find.textContaining('受け付けていません'), findsOneWidget);
    await tester.pumpWidget(host(PremiumUnavailableNote(balance: const CoinSummary(free: 1, premium: 1).forWork)));
    expect(find.textContaining('作品への推しはフリーコインです'), findsOneWidget);
  });
}
