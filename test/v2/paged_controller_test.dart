import 'package:aipictors/v2/core/paged.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('同じページしか返らない API では、続きを読むのをやめる', () async {
    var calls = 0;
    final controller = PagedController<int>(
      pageSize: 20,
      idOf: (n) => '$n',
      // offset を無視して毎回先頭から返す（作品のコメントの API がそうだった）
      fetch: (offset, limit) async {
        calls++;
        return [1, 2, 3];
      },
    );
    await controller.loadMore();
    expect(controller.items, [1, 2, 3]);
    expect(controller.hasMore, true);
    await controller.loadMore();
    expect(controller.hasMore, false);
    await controller.loadMore();
    expect(calls, 2);
  });

  test('新しい項目が来るあいだは続ける', () async {
    final controller = PagedController<int>(pageSize: 2, idOf: (n) => '$n', fetch: (offset, limit) async => [offset, offset + 1].where((n) => n < 5).toList());
    await controller.loadMore();
    await controller.loadMore();
    await controller.loadMore();
    expect(controller.items, [0, 1, 2, 3, 4]);
    await controller.loadMore();
    expect(controller.hasMore, false);
  });
}
