import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  static HiveStore? store;

  static activate() async {
    await Hive.initFlutter();
    final box = await Hive.openBox("graphql");
    store = HiveStore(box);
  }

  static HiveStore getStore() {
    if (store == null) {
      throw Exception("HiveStore is not activated.");
    }
    return store!;
  }
}
