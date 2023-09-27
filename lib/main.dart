import 'package:aipictors/app.dart';
import 'package:aipictors/config.dart';
import 'package:aipictors/handlers/background_message_handler.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/repositories/hive_repository.dart';
import 'package:aipictors/repositories/survey_repository.dart';
import 'package:aipictors/repositories/translation_repository.dart';
import 'package:aipictors/utils/to_locale.dart';
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

void main() async {
  // runAppより前にFlutterEngineを使用する
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseを初期化する
  await Firebase.initializeApp();

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // 設定を初期化する
  await DefaultConfig.activate();

  // ローカルストレージを初期化する
  await ConfigRepository.activate();

  // ローカルストレージを初期化する
  await SurveyRepository.activate();

  // キャッシュを初期化する
  await HiveRepository.activate();

  // 翻訳を初期化する
  await TranslationRepository.activate();

  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  // RemoteConfigを取得して初期化する
  await remoteConfig.fetchAndActivate();

  FirebaseInAppMessaging.instance.setAutomaticDataCollectionEnabled(true);

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  // Crashlyticsを初期化する
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  final language = const ConfigRepository().language;

  // Analyticsを初期化する
  FirebaseAnalytics.instance.setUserProperty(
    name: 'is_release_mode',
    value: kReleaseMode.toString(),
  );

  FirebaseAnalytics.instance.setUserProperty(
    name: 'environment',
    value: DefaultConfig.sentryEnvironment,
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

  FirebaseAnalytics.instance.setDefaultEventParameters({
    'version': DefaultConfig.version,
    'language': language,
  });

  await SentryFlutter.init(
    (options) {
      options.dsn = DefaultConfig.sentryDsn;
      options.environment = DefaultConfig.sentryEnvironment;
      options.release = DefaultConfig.version;
      // options.debug = DefaultConfig.isNotProduction;
      options.useFlutterBreadcrumbTracking();
      if (DefaultConfig.isProduction) {
        options.tracesSampleRate = 1.0;
      }
    },
    appRunner: () {
      Sentry.configureScope((scope) {
        scope.setTag('language', language);
        scope.setTag('is_release_mode', kReleaseMode.toString());
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
