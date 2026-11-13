import 'package:aipictors/v2/plans/iap.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('コインの商品 ID と枚数が App Store / Google Play でそろっている', () {
    // どちらのストアでも同じ 4 つを売る（枚数はサーバーが決めるので、ここは画面用）
    expect(coinProducts.length, 4);
    expect(coinProducts.values.toList()..sort(), [100, 1100, 3300, 11000]);
  });

  test('サブスクの商品 ID とコインの商品 ID が重ならない', () {
    for (final id in coinProducts.keys) {
      expect(passProducts.containsKey(id), isFalse);
    }
  });
}
