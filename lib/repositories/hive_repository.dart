import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// キャッシュ
class HiveRepository {
  static HiveStore? store;

  static activate() async {
    await Hive.initFlutter();
    final box = await Hive.openBox('graphql');
    store = HiveStore(box);
  }

  static HiveStore getStore() {
    if (store == null) {
      throw Exception('HiveStore is not activated.');
    }
    return store!;
  }

  /// キャッシュを削除する
  static clear() {
    return store?.clear();
  }
}
