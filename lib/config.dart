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
    // return 'https://federation-jjkihxkmtq-an.a.run.app';
  }

  static get remoteConfigDefaultConfig {
    return {
      'sentry_dsn':
          'https://3859848e502e4ad689a4f7d6d3827866@o4505182281465856.ingest.sentry.io/4505443918413824',
      'graphql_secret': 'xwzkbm237trfs3y9j4j9cui8e2setaj4',
      'graphql_endpoint':
          'https://subgraph-aipictors-sn4ve5jg4q-an.a.run.app/api',
      'is_unavailable': false,
      'is_unavailable_post': false,
      'is_maintenance_mode': false,
      'version_latest': '1.0.0',
      'version_support': '1.0.0',
      'support_email': 'hello@aipictors.com',
      'page_url_discord': 'https://discord.gg/WPJFSbUNwt',
      'page_url_twitter': 'https://twitter.com/aipictors',
      'page_url_terms': 'https://www.aipictors.com/terms/',
      'page_url_privacy': 'https://www.aipictors.com/terms/'
    };
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
    return '$version+$buildNumber';
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
