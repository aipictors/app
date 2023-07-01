import 'dart:io';

import 'package:aipictors/utils/to_locale_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ローカルストレージ
class ConfigRepository {
  const ConfigRepository();

  static SharedPreferences? instance;

  static activate() async {
    instance = await SharedPreferences.getInstance();
  }

  /// 初回起動である
  bool get isTutorial {
    final value = instance!.getBool('config_tutorial');
    return value ?? true;
  }

  Future<void> setTutorial(bool value) async {
    await instance!.setBool('config_tutorial', value);
  }

  String get language {
    final value = instance!.getString('config_language');
    return value ?? toLocaleCode(Platform.localeName);
  }

  Future<void> setLanguage(String value) async {
    await instance!.setString('config_language', value);
  }

  String? get themeColor {
    final value = instance!.getString('config_theme_color');
    return value;
  }

  Future<void> setThemeColor(String? value) async {
    if (value == null) {
      instance!.remove('config_theme_color');
      return;
    }
    await instance!.setString('config_theme_color', value);
  }

  String? get themeMode {
    final value = instance!.getString('config_theme_mode');
    return value;
  }

  Future<void> setThemeMode(String value) async {
    await instance!.setString('config_theme_mode', value);
  }

  bool get topicCampaign {
    final value = instance!.getBool('config_topic_campaign');
    return value ?? true;
  }

  Future<void> setTopicCampaign(bool value) async {
    await instance!.setBool('config_topic_campaign', value);
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
