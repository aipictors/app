import 'package:aipictors/v2/core/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('知らない行き先でも画面が壊れず、案内と戻る導線が出る', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotFoundScreen(location: '/novels')));
    await tester.pump();

    expect(find.text('このページはアプリにありません'), findsOneWidget);
    expect(find.text('ブラウザで開く'), findsOneWidget);
    expect(find.text('ホームに戻る'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
