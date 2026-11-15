import 'package:aipictors/v2/settings/sticker_settings_list.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('デフォルトのスタンプは新旧 5 個ずつで重ならない', () {
    expect(defaultStickerUrls, hasLength(5));
    expect(legacyDefaultStickerUrls, hasLength(5));
    expect(defaultStickerUrls.toSet().intersection(legacyDefaultStickerUrls.toSet()), isEmpty);
  });

  test('スタンプ選びの「最近の使用」: デフォルトを先頭に、重なるものは後ろから除く', () {
    final list = withDefaultStickersFirst(
      [{'id': '88355'}, {'id': '88356'}],
      [{'id': '10'}, {'id': '88356'}, {'id': '11'}],
    );
    expect(list.map((s) => s['id']), ['88355', '88356', '10', '11']);
    expect(withDefaultStickersFirst([], [{'id': '10'}]).map((s) => s['id']), ['10']);
  });

  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  double opacityOf(WidgetTester tester, String key) => tester.widget<Opacity>(find.byKey(ValueKey(key))).opacity;

  testWidgets('スイッチ 2 つ。押すとそれぞれの設定が変わり、オフのほうの見本は薄い', (tester) async {
    bool? hide;
    bool? legacy;
    await tester.pumpWidget(wrap(StickerSettingsList(
      isHideDefault: false,
      isShowLegacy: false,
      onHideDefaultChanged: (v) => hide = v,
      onShowLegacyChanged: (v) => legacy = v,
    )));
    expect(find.text('デフォルトのスタンプを表示しない'), findsOneWidget);
    expect(find.text('以前のデフォルトのスタンプも使う'), findsOneWidget);
    expect(opacityOf(tester, 'default-preview'), 1);
    expect(opacityOf(tester, 'legacy-preview'), 0.3);

    await tester.tap(find.text('デフォルトのスタンプを表示しない'));
    expect(hide, isTrue);
    await tester.tap(find.text('以前のデフォルトのスタンプも使う'));
    expect(legacy, isTrue);

    await tester.pumpWidget(wrap(StickerSettingsList(
      isHideDefault: true,
      isShowLegacy: true,
      onHideDefaultChanged: (_) {},
      onShowLegacyChanged: (_) {},
    )));
    expect(opacityOf(tester, 'default-preview'), 0.3);
    expect(opacityOf(tester, 'legacy-preview'), 1);
  });
}
