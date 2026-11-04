import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'support/harness.dart';

/// Android の本物の写真ピッカーを開いて戻るキーで閉じる（権限なしで開き、選ばずに戻れること）
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('android photo picker', (tester) async {
    final qa = Qa(tester);
    await qa.boot();
    await qa.step('Android: 写真ピッカーが開き、戻ると空で帰る', () async {
      var returned = false;
      final future = pickSystemImages().then((files) {
        returned = true;
        return files;
      });
      await qa.idle(const Duration(seconds: 5));
      await qa.shot('photo-picker');
      expect(returned, isFalse, reason: 'ピッカーが開かなかった');
      await qa.hardwareBack();
      await qa.idle(const Duration(seconds: 2));
      expect(returned, isTrue, reason: '戻るキーで閉じなかった');
      expect(await future, isEmpty);
      await qa.shot('photo-picker-closed');
    });
    qa.finish();
    expect(qa.failures, isEmpty);
  }, skip: !isAndroid, timeout: const Timeout(Duration(minutes: 5)));
}
