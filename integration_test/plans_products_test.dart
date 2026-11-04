import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'support/harness.dart';

/// 商品がある状態のプラン画面（--dart-define=debugIapProducts=true の見本。買わない）
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('plans with products', (tester) async {
    final qa = Qa(tester);
    await qa.boot();
    await qa.step('プラン: 商品と価格が出て、復元と管理のボタンがある', () async {
      await qa.open('/plans', wait: const Duration(seconds: 8));
      await qa.shot('plans-products');
      expect(find.textContaining(RegExp('Stripe|クレジットカード|Web で購入|ブラウザで購入')), findsNothing);
      expect(find.textContaining('¥'), findsWidgets);
      await qa.scrollTo(find.text('サブスクリプションを管理'));
      await qa.shot('plans-products-bottom');
    });
    qa.finish();
    expect(qa.failures, isEmpty);
  }, timeout: const Timeout(Duration(minutes: 10)));
}
