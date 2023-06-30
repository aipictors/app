import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'config.dart';
import 'handlers/background_message_handler.dart';
import 'repositories/hive_repository.dart';
import 'repositories/storage_repository.dart';
import 'utils/to_locale.dart';

void main() async {
  // runAppより前にFlutterEngineを使用する
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseを初期化する
  await Firebase.initializeApp();

  // 設定を初期化する
  await DefaultConfig.activate();

  // ローカルストレージを初期化する
  await StorageRepository.activate();

  // キャッシュを初期化する
  await HiveRepository.activate();

  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  // RemoteConfigの初期値を設定する
  await remoteConfig.setDefaults(DefaultConfig.remoteConfigDefaultConfig);

  // RemoteConfigを取得して初期化する
  await remoteConfig.fetchAndActivate();

  // RemoteConfigの変更を受信する
  remoteConfig.onConfigUpdated.listen((_) async {
    await remoteConfig.fetchAndActivate();
  });

  FirebaseInAppMessaging.instance.setAutomaticDataCollectionEnabled(true);

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  // Crashlyticsを初期化する
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // FlutterのエラーをSentryに送信する
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  final language = const StorageRepository().language;

  // Analyticsを初期化する
  FirebaseAnalytics.instance.setUserProperty(
    name: 'is_release_mode',
    value: kReleaseMode.toString(),
  );

  FirebaseAnalytics.instance.setUserProperty(
    name: 'environment',
    value: DefaultConfig.environment,
  );

  FirebaseAnalytics.instance.setUserProperty(
    name: 'version',
    value: DefaultConfig.version,
  );

  FirebaseAnalytics.instance.setUserProperty(
    name: 'build_number',
    value: DefaultConfig.buildNumber,
  );

  FirebaseAnalytics.instance.setUserProperty(
    name: 'language',
    value: language,
  );

  await SentryFlutter.init(
    (options) {
      options.environment = DefaultConfig.environment;
      options.dsn = DefaultConfig.sentryDsn;
      options.release = DefaultConfig.version;
      options.useFlutterBreadcrumbTracking();
      if (options.environment == 'production') {
        options.tracesSampleRate = 1.0;
      }
    },
    appRunner: () {
      Sentry.configureScope((scope) {
        scope.setTag('language', language);
      });
      runApp(
        ProviderScope(
          child: I18n(
            initialLocale: toLocale(language),
            child: const App(),
          ),
        ),
      );
    },
  );
}
