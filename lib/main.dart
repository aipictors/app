import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ja_JP');

  await Hive.initFlutter();

  final box = await Hive.openBox("graphql");

  final store = HiveStore(box);

  Global.store = store;

  runApp(const ProviderScope(child: App()));
}
