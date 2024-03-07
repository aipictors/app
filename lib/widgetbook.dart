// widgetbook.dart

import 'package:aipictors/config.dart';
import 'package:aipictors/handlers/background_message_handler.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/repositories/hive_repository.dart';
import 'package:aipictors/repositories/survey_repository.dart';
import 'package:aipictors/repositories/translation_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated directories variable
import 'package:aipictors/widgetbook.directories.g.dart';

@widgetbook.App()
Future<void> main() async {
  // runAppより前にFlutterEngineを使用する
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseを初期化する
  // await Firebase.initializeApp();
  runApp(const ProviderScope(child: WidgetbookApp()));
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 参考: https://docs.widgetbook.io/getting-started/setup
    // https://zenn.dev/natoring/articles/3d6638ab499117
    return Widgetbook.material(
      directories: directories,
      addons: [
        DeviceFrameAddon(devices: Devices.ios.all),
        InspectorAddon(),
        GridAddon(100),
        AlignmentAddon(),
        ZoomAddon(),
      ],
    );
  }
}
