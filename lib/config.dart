import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

@immutable
class DefaultConfig {
  const DefaultConfig();

  static PackageInfo? packageInfo;

  static activate() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static String get graphqlURI {
    return 'https://subgraph-aipictors-sn4ve5jg4q-an.a.run.app/api';
    // return 'https://any.ngrok.io/api';
  }

  static Color get defaultThemeColor {
    return Colors.lightBlue;
  }

  static String get graphqlSecret {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('graphql_secret');
  }

  static String get sentryDsn {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('sentry_dsn');
  }

  static bool get isProduction {
    return const String.fromEnvironment('environment') == 'production';
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
  static String get sentryEnvironment {
    return const String.fromEnvironment('environment');
  }

  /// dart_define
  static String get appName {
    return const String.fromEnvironment('appName');
  }
}
