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

  static String get graphqlEndpoint {
    return 'https://any.ngrok.io/graphql';
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('graphql_endpoint');
  }

  static Color get defaultThemeColor {
    return Colors.lightBlue;
  }

  static String get sentryDsn {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('sentry_dsn');
  }

  static bool get isProduction {
    return const String.fromEnvironment('sentryEnvironment') == 'production';
  }

  static bool get isNotProduction {
    return const String.fromEnvironment('sentryEnvironment') != 'production';
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
    return const String.fromEnvironment('sentryEnvironment');
  }

  /// dart_define
  static String get appName {
    return const String.fromEnvironment('appName');
  }
}
