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
}
