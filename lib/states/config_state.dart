import 'package:aipictors/config.dart';
import 'package:aipictors/models/app_version.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'config_state.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  const ConfigState._();

  const factory ConfigState({
    required bool isFirstTime,
    required String language,
    required ThemeMode themeMode,
    required Color? themeColor,
  }) = _ConfigState;

  /// ダークモードである
  bool get isDarkMode {
    return themeMode == ThemeMode.dark;
  }

  /// ライトモードである
  bool get isLightMode {
    return themeMode == ThemeMode.light;
  }

  /// システムカラーモードである
  bool get isSystemColorMode {
    return themeMode == ThemeMode.system;
  }

  /// 緊急事態 - アプリが使用できない
  bool get isEnabledEmergencyUnavailable {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('is_unavailable');
  }

  /// 緊急事態 - 投稿機能が使用できない
  bool get isEnabledEmergencyUnavailablePost {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('is_unavailable_post');
  }

  /// 最新バージョン
  /// 設定のバージョンより大きい場合は最新バージョン
  bool get isVersionLatest {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      final text = remoteConfig.getString('version_latest');
      final remoteVersion = AppVersion(text);
      final localVersion = AppVersion(DefaultConfig.version);
      if (remoteVersion.major < localVersion.major) {
        return true;
      }
      if (remoteVersion.major == localVersion.major &&
          remoteVersion.minor <= localVersion.minor) {
        return true;
      }
      return false;
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      return true;
    }
  }

  /// 最新バージョンではない
  bool get isNotVersionLatest {
    if (isOutOfDate) {
      return false;
    }
    return !isVersionLatest;
  }

  /// サポート内
  /// 設定のバージョンより大きい場合はサポート内
  bool get isVersionSupport {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      final text = remoteConfig.getString('version_support');
      final remoteVersion = AppVersion(text);
      final localVersion = AppVersion(DefaultConfig.version);
      if (remoteVersion.major < localVersion.major) {
        return true;
      }
      if (remoteVersion.major == localVersion.major &&
          remoteVersion.minor <= localVersion.minor) {
        return true;
      }
      return false;
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      return true;
    }
  }

  /// アップデートが必要
  bool get isOutOfDate {
    return !isVersionSupport;
  }

  /// ホームに表示するメッセージ
  String? get notificationHomeMessage {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      final value = remoteConfig.getString('notification_home_message');
      if (value.isEmpty) {
        return null;
      }
      return value;
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      return '';
    }
  }

  /// RemoteConfig
  /// ディスコの招待URL
  Uri get discordURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return Uri.parse(remoteConfig.getString('page_url_discord'));
  }

  /// RemoteConfig
  /// 運営のメールアドレス
  String get customerSupportEmail {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('support_email');
  }

  /// RemoteConfig
  /// URL「利用規約」
  String get termsURL {
    final instance = FirebaseRemoteConfig.instance;
    return instance.getString('page_url_terms');
  }

  /// RemoteConfig
  /// URL「プライバシーポリシー」
  String get privacyURL {
    final instance = FirebaseRemoteConfig.instance;
    return instance.getString('page_url_privacy');
  }

  /// RemoteConfig
  /// 最新のバージョン
  String get versionLatest {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('version_latest');
  }

  /// RemoteConfig
  /// サポートされるバージョン
  String get versionSupport {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('version_support');
  }
}
