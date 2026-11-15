import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/user/user_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('一覧の @ID: @ の重なりを除き、自動で付いた UUID は出さない', () {
    expect(loginHandle('p-mei'), '@p-mei');
    expect(loginHandle('@brGOLBsojsPUuqy'), '@brGOLBsojsPUuqy');
    expect(loginHandle('5b89a360-9866-eefb-5830-6d0bcf19f695'), isNull);
    expect(loginHandle(''), isNull);
  });

  test('finalPostedAt は 9 時間戻し、未来（予約投稿）なら出さない', () {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final posted = UserRowData.fromJson({'id': '1', 'login': 'a', 'name': 'A', 'finalPostedAt': now - 3600 + 9 * 3600});
    expect(posted.finalPostedAt, now - 3600);
    final reserved = UserRowData.fromJson({'id': '1', 'login': 'a', 'name': 'A', 'finalPostedAt': now + 3600 + 9 * 3600});
    expect(reserved.finalPostedAt, isNull);
    expect(UserRowData.fromJson({'id': '1', 'login': 'a', 'name': ''}).name, 'a');
  });

  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: SingleChildScrollView(child: child)));

  testWidgets('フォロー一覧の行: 名前・@ID・自己紹介とフォローボタン。自分にはボタンを出さない', (tester) async {
    final user = UserRowData.fromJson({
      'id': '10',
      'login': 'p-mei',
      'name': 'AIもん2',
      'biography': 'ケモ耳・エルフ耳が好きな一般人\n二行目',
      'isFollowee': false,
    });
    await tester.pumpWidget(wrap(UserRowTile(user: user, viewerId: '1')));
    expect(find.text('AIもん2'), findsOneWidget);
    expect(find.text('@p-mei'), findsOneWidget);
    expect(find.text('ケモ耳・エルフ耳が好きな一般人 二行目'), findsOneWidget);
    expect(find.byType(FollowButton), findsOneWidget);
    expect(find.text('フォローする'), findsOneWidget);

    await tester.pumpWidget(wrap(UserRowTile(user: user, viewerId: '10')));
    expect(find.byType(FollowButton), findsNothing);
  });
}
