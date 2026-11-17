import 'package:aipictors/v2/requests/requests_api.dart';
import 'package:aipictors/v2/requests/requests_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

CoinRequest _request(String status) => CoinRequest({'id': '1', 'status': status, 'title': 't', 'priceCoins': 1000});

void main() {
  test('コインの表示は 3 桁区切り', () {
    expect(formatCoins(100000), '100,000');
    expect(formatCoins(999), '999');
  });

  testWidgets('プランのカード: タイトル・価格・納期、受付停止のしるし', (tester) async {
    final plan = RequestPlan({
      'id': '1',
      'userId': '2',
      'title': 'ゆるかわアイコン',
      'priceCoins': 1500,
      'deliveryDays': 7,
      'maxActive': 3,
      'activeCount': 3,
      'isAccepting': true,
      'status': 'ACTIVE',
      'sampleImageUrls': <String>[],
    });
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: SizedBox(width: 200, child: RequestPlanCard(plan: plan)))));
    expect(find.text('ゆるかわアイコン'), findsOneWidget);
    expect(find.text('1,500'), findsOneWidget);
    expect(find.text('7日'), findsOneWidget);
    expect(find.text('受付上限'), findsOneWidget);
  });

  testWidgets('段階の表示: 終わった依頼は返却済みの案内', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: RequestSteps(_request('DECLINED')))));
    expect(find.textContaining('全額返却済み'), findsOneWidget);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: RequestSteps(_request('ACCEPTED')))));
    expect(find.text('制作中'), findsOneWidget);
  });

  test('実績: 許可・透かし入りの画像を読む', () {
    final r = CoinRequest({'id': '1', 'status': 'COMPLETED', 'showcaseAllowed': true, 'showcaseHidden': false, 'showcaseImageUrls': ['https://files.aipictors.com/showcase/a.webp']});
    expect(r.isCompleted, isTrue);
    expect(r.showcaseAllowed, isTrue);
    expect(r.showcaseImageUrls, ['https://files.aipictors.com/showcase/a.webp']);
    expect(CoinRequest({'id': '2', 'status': 'COMPLETED', 'showcaseImageUrls': null}).showcaseImageUrls, isNull);
  });

  testWidgets('実績の横スクロール: 「プランで制作」の印と件数', (tester) async {
    final items = [
      RequestShowcaseItem({'requestId': '1', 'planId': '3', 'planTitle': 'アイコン', 'creatorUserId': '2', 'imageUrls': <String>[], 'isR18': false}),
    ];
    // 画像がない実績は出さない（読み込みのときに外す）ので、空の一覧なら何も出ない
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: RequestShowcaseStrip(items: const [], count: 0, users: const {}, planId: '3'))));
    expect(find.textContaining('実績'), findsNothing);
    expect(items.first.isR18, isFalse);
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: RequestShowcaseBadge())));
    expect(find.text('プランで制作'), findsOneWidget);
  });
}
