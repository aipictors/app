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
    required bool isTutorial,
    required String language,
    required bool themeMediumLayout,
    required ThemeMode themeMode,
    required Color? themeColor,
    required RemoteConfigFetchStatus lastFetchStatus,
  }) = _ConfigState;

  /// 初期化に失敗した
  bool get isFailed {
    return lastFetchStatus == RemoteConfigFetchStatus.failure;
  }

  /// デバッグモードである
  bool get isDebugMode {
    return const String.fromEnvironment('sentryEnvironment') != 'production';
  }

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

  /// Remote Config
  /// メンテナンスモード
  bool get isMaintenanceMode {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('is_maintenance_mode');
  }

  /// Remote Config
  /// 最新のリリースノートのID
  String get latestReleaseNoteId {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('latest_release_note_id');
  }

  /// ホームに表示するメッセージ
  String? get homeMessage {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      final value = remoteConfig.getString('home_message');
      if (value.isEmpty) {
        return null;
      }
      return value;
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      return '';
    }
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

  /// Remote Config
  /// 最新のバージョン
  String get versionLatest {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('version_latest');
  }

  /// Remote Config
  /// サポートされるバージョン
  String get versionSupport {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('version_support');
  }

  /// Remote Config
  /// フィードの終わりの画像URL
  String get endOfFeedImageURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('end_of_feed_image_url');
  }

  /// Remote Config
  String? get campaignId {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final value = remoteConfig.getString('campaign_id');
    return value.isNotEmpty ? value : null;
  }

  /// Remote Config
  /// キャンペーンの画像URL
  String? get campaignImageURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final value = remoteConfig.getString('campaign_image_url');
    return value.isNotEmpty ? value : null;
  }

  /// Remote Config
  /// キャンペーンのメッセージ
  String? get campaignMessage {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final value = remoteConfig.getString('campaign_message');
    return value.isNotEmpty ? value : null;
  }

  /// Remote Config
  /// キャンペーンのタイトル
  String? get campaignTitle {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final value = remoteConfig.getString('campaign_title');
    return value.isNotEmpty ? value : null;
  }

  /// Remote Config
  /// URL・ディスコの招待
  Uri get pageDiscordURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return Uri.parse(remoteConfig.getString('page_url_discord'));
  }

  /// Remote Config
  /// URL・ガイドライン
  Uri get pageGuidelineURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return Uri.parse(remoteConfig.getString('page_url_guideline'));
  }

  /// Remote Config
  /// URL・組織について
  Uri get pageOrganizationURL {
    final instance = FirebaseRemoteConfig.instance;
    return Uri.parse(instance.getString('page_url_organization'));
  }

  /// Remote Config
  /// URL・プライバシーポリシー
  Uri get pagePrivacyURL {
    final instance = FirebaseRemoteConfig.instance;
    return Uri.parse(instance.getString('page_url_privacy'));
  }

  /// Remote Config
  /// URL・リポジトリ
  Uri get pageRepositoryURL {
    final instance = FirebaseRemoteConfig.instance;
    return Uri.parse(instance.getString('page_url_repository'));
  }

  /// Remote Config
  /// URL・利用規約
  Uri get pageTermsURL {
    final instance = FirebaseRemoteConfig.instance;
    return Uri.parse(instance.getString('page_url_terms'));
  }

  /// Remote Config
  /// URL・Threads
  Uri get pageThreadsURL {
    final instance = FirebaseRemoteConfig.instance;
    return Uri.parse(instance.getString('page_url_threads'));
  }

  /// Remote Config
  /// URL・ツイッター（Aipictors）
  Uri get pageTwitterURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return Uri.parse(remoteConfig.getString('page_url_twitter'));
  }

  /// Remote Config
  /// URL・ツイッター（Prompton）
  Uri get pageTwitterPromptonURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return Uri.parse(remoteConfig.getString('page_url_twitter_prompton'));
  }

  /// Remote Config
  /// URL・Wiki
  Uri get pageWikiURL {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return Uri.parse(remoteConfig.getString('page_url_wiki'));
  }

  /// Remote Config
  /// 運営のメールアドレス
  String get supportEmail {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('support_email');
  }

  /// Remote Config
  String get messageAboutTwitter {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('message_about_twitter');
  }

  /// Remote Config
  String get messageAboutDiscord {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('message_about_discord');
  }

  /// Remote Config
  String get messageAboutSurvey {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('message_about_survey');
  }

  /// Remote Config
  String get messageSurveyReset {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('message_survey_reset');
  }

  /// Remote Config
  String get messageUnexpectedErrorA {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('message_unexpected_error_a');
  }

  /// Remote Config
  bool get featureCreateComment {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_create_comment');
  }

  /// Remote Config
  bool get featureCreateFolder {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_create_folder');
  }

  /// Remote Config
  bool get featureCreateSticker {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_create_sticker');
  }

  /// Remote Config
  bool get featureCreateWork {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_create_work');
  }

  /// Remote Config
  bool get featureDeleteComment {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_delete_comment');
  }

  /// Remote Config
  bool get featureDeleteFolder {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_delete_folder');
  }

  /// Remote Config
  bool get featureDeleteSticker {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_delete_sticker');
  }

  /// Remote Config
  bool get featureDeleteWork {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_delete_work');
  }

  /// Remote Config
  bool get featureFollowUser {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_follow_user');
  }

  /// Remote Config
  bool get featureLogin {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_login');
  }

  /// Remote Config
  bool get featureMuteTag {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_mute_tag');
  }

  /// Remote Config
  bool get featureMuteUser {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_mute_user');
  }

  /// Remote Config
  bool get featureUpdateComment {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_update_comment');
  }

  /// Remote Config
  bool get featureUpdateFolder {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_update_folder');
  }

  /// Remote Config
  bool get featureUpdateSticker {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_update_sticker');
  }

  /// Remote Config
  bool get featureUpdateUser {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_update_user');
  }

  /// Remote Config
  bool get featureUpdateWork {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool('feature_update_work');
  }
}
