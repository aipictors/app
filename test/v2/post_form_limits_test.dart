import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('タグは 1 作品 20 個まで（Web と同じ）', () {
    expect(maxPostTags, 20);
  });

  Future<Text> pump(WidgetTester tester, int count, int max) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: PostCharCount(count, max))));
    return tester.widget<Text>(find.byType(Text));
  }

  testWidgets('文字数は 3 桁ごとにカンマを入れて「今/上限」で出す', (tester) async {
    expect((await pump(tester, 1288, 3000)).data, '1,288/3,000');
    expect((await pump(tester, 0, 120)).data, '0/120');
  });

  testWidgets('上限の 9 割でオレンジ、上限で赤（エラー色）になる', (tester) async {
    expect((await pump(tester, 107, 120)).style?.color, isNot(Colors.orange));
    expect((await pump(tester, 108, 120)).style?.color, Colors.orange);
    final atMax = await pump(tester, 120, 120);
    final context = tester.element(find.byType(Text));
    expect(atMax.style?.color, Theme.of(context).colorScheme.error);
  });
}
