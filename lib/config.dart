import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

@immutable
class DefaultConfig {
  const DefaultConfig();

  static const String _defaultGraphqlEndpoint = 'https://aipics.fly.dev';

  static PackageInfo? packageInfo;

  /// アナリティクスのカスタムのイベント
  static get customEvent {
    return {
      'report_sticker': 'report_sticker',
    };
  }

  /// 初期化する
  /// アプリが起動する前に呼び出して
  static activate() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  /// ブレークポイント
  /// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
  static int get mediumUIThreshold {
    return 600;
  }

  /// デフォルトのテーマカラー
  static Color get defaultThemeColor {
    return Colors.lightBlue;
  }

  /// Remote Config
  static String get graphqlEndpoint {
    final remoteConfig = FirebaseRemoteConfig.instance;

    // Optional override (e.g. for local dev / emergency hotfix builds).
    final envValue = const String.fromEnvironment('graphqlEndpoint').trim();
    if (envValue.isNotEmpty) {
      return envValue;
    }

    // Primary source of truth.
    final remoteValue = remoteConfig.getString('graphql_endpoint').trim();
    if (remoteValue.isNotEmpty) {
      // Accept plain hostnames (e.g. "aipics.fly.dev") and upgrade to https.
      final normalized = remoteValue.startsWith('http://') || remoteValue.startsWith('https://')
          ? remoteValue
          : (remoteValue.startsWith('//') ? 'https:$remoteValue' : 'https://$remoteValue');

      // Some deployments publish router endpoints that are not reachable from this app.
      // When detected, ignore Remote Config and fall back to a stable default.
      final uri = Uri.tryParse(normalized);
      final host = uri?.host ?? '';
      final isBlockedRouterEndpoint = host == 'router-sn4ve5jg4q-an.a.run.app' ||
          (host.startsWith('router-') && host.endsWith('.a.run.app'));
      if (isBlockedRouterEndpoint) {
        return _defaultGraphqlEndpoint;
      }

      return normalized;
    }

    // Fallback to keep the app usable even when Remote Config isn't available.
    return _defaultGraphqlEndpoint;
  }

  /// Remote Config
  static String get sentryDsn {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('sentry_dsn');
  }

  /// Remote Config
  static double get sentrySampleRate {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getDouble('sentry_sample_rate');
  }

  static String get version {
    return packageInfo!.version;
  }

  static String get buildNumber {
    return packageInfo!.buildNumber;
  }

  static String get packageName {
    return packageInfo!.packageName;
  }

  static String get versionText {
    return packageInfo!.version;
  }

  /// dart_define
  static bool get isProduction {
    return const String.fromEnvironment('sentryEnvironment') == 'production';
  }

  /// dart_define
  static bool get isNotProduction {
    return const String.fromEnvironment('sentryEnvironment') != 'production';
  }

  /// dart_define
  static String get sentryEnvironment {
    return const String.fromEnvironment('sentryEnvironment');
  }

  /// dart_define
  static String get appName {
    return const String.fromEnvironment('appName');
  }

  /// dart_define
  static String get secretToken {
    return const String.fromEnvironment('secretToken');
  }
}
