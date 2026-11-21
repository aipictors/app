import 'package:aipictors/v2/settings/pickup_picker_sheet.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ピックアップの作品: id・タイトル・小さいサムネイルを読む', () {
    final w = PickupWork.fromJson({'id': '12', 'title': 'ねこ', 'smallThumbnailImageURL': 'https://files.aipictors.com/a'});
    expect(w.id, '12');
    expect(w.title, 'ねこ');
    expect(w.thumbnailUrl, 'https://files.aipictors.com/a');
    expect(PickupWork.fromJson({'id': '1', 'title': '', 'smallThumbnailImageURL': ''}).thumbnailUrl, isNull);
  });

  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: SizedBox(width: 120, height: 120, child: child)));

  testWidgets('選んだ作品には選んだ順の番号、外すボタンを押すと onRemove', (tester) async {
    const w = PickupWork(id: '1', title: 'ねこ', thumbnailUrl: null);
    await tester.pumpWidget(wrap(const PickupTile(work: w, order: 2)));
    expect(find.text('2'), findsOneWidget);

    var removed = false;
    await tester.pumpWidget(wrap(PickupTile(work: w, onRemove: () => removed = true)));
    expect(find.text('2'), findsNothing);
    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();
    expect(removed, isTrue);
  });
}
