import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/work/support_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('推しはユーザーへの推しだけなので、フリー・プレミアムとも使える', () {
    const balance = CoinSummary(free: 5, premium: 20);
    expect(balance.premiumUsable, isTrue);
    final b = SupportBreakdown.of(10, balance.forSupport)!;
    expect((b.free, b.premium), (5, 5));

    // 作者がプレミアムを受け取らないなら、フリーだけ
    const refuses = CoinSummary(free: 5, premium: 20, premiumAccepted: false);
    expect(refuses.premiumUsable, isFalse);
    expect(refuses.forSupport.premium, 0);
    // フリーが足りないときもプレミアムを自動で使わない
    expect(SupportBreakdown.of(10, refuses.forSupport), isNull);
    expect(SupportBreakdown.of(5, refuses.forSupport)!.premium, 0);
  });

  test('API の断り（作品への推しの終了）を code・文言で見分ける', () {
    expect(isSupportUserOnlyError(const ApiException('x', code: 'SUPPORT_USER_ONLY')), isTrue);
    expect(isSupportUserOnlyError(const ApiException('推しを送れませんでした（作品への推しは終了しました。推しはユーザー（プロフィール）への推しだけになりました）')), isTrue);
    expect(isSupportUserOnlyError(const ApiException('SUPPORT_USER_ONLY: forbidden')), isTrue);
    expect(isSupportUserOnlyError(const ApiException('コインが足りません')), isFalse);
    expect(supportUserOnlyNote(), contains('作品への推しは終了しました'));
  });

  Widget host(Widget child) => MaterialApp(home: Scaffold(body: SingleChildScrollView(child: child)));

  testWidgets('理由の文言: 作者がプレミアムを受け取らないとき', (tester) async {
    await tester.pumpWidget(host(const PremiumUnavailableNote(balance: CoinSummary(free: 1, premium: 1, premiumAccepted: false))));
    expect(find.textContaining('受け付けていません'), findsOneWidget);
    expect(find.textContaining('作品への推し'), findsNothing);
  });
}
