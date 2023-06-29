import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

/// ローカルストレージ
class StorageRepository {
  const StorageRepository();

  static SharedPreferences? instance;

  static activate() async {
    instance = await SharedPreferences.getInstance();
  }

  /// 初回起動である
  bool get isTutorial {
    final value = instance!.getBool('tutorial');
    return value ?? true;
  }

  Future<void> setTutorial(bool value) async {
    await instance!.setBool('tutorial', value);
  }

  String get language {
    final value = instance!.getString('language');
    return value ?? Platform.localeName;
  }

  String get languageCode {
    final value = language;
    if (value == 'ja_JP') {
      return 'ja';
    }
    return value;
  }

  Future<void> setLanguage(String value) async {
    await instance!.setString('language', value);
  }

  String? get colorScheme {
    final value = instance!.getString('color_scheme');
    return value;
  }

  Future<void> setColorScheme(String value) async {
    await instance!.setString('color_scheme', value);
  }

  String get themeMode {
    final value = instance!.getString('theme_mode');
    return value ?? 'light';
  }

  Future<void> setThemeMode(String value) async {
    await instance!.setString('theme_mode', value);
  }

  bool get topicCampaign {
    final value = instance!.getBool('topic_campaign');
    return value ?? true;
  }

  Future<void> setTopicCampaign(bool value) async {
    await instance!.setBool('topic_campaign', value);
  }

  /// カウント（xxx）
  int get xxxCount {
    final value = instance!.getInt('count_notification');
    return value ?? 0;
  }

  /// カウント（xxx）を更新する
  Future<void> setXxxCount(int count) async {
    await instance!.setInt('count_xxx', count);
  }

  int get badgeCount {
    return 0;
  }
}
