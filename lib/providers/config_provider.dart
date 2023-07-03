import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/states/config_state.dart';
import 'package:aipictors/utils/to_color.dart';
import 'package:aipictors/utils/to_theme_mode.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';

/// 設定
@riverpod
class Config extends _$Config {
  @override
  ConfigState build() {
    const repository = ConfigRepository();
    return ConfigState(
      isFirstTime: repository.isTutorial,
      language: repository.language,
      themeMode: toThemeMode(repository.themeMode),
      themeColor: toColor(repository.themeColor),
      lastFetchStatus: FirebaseRemoteConfig.instance.lastFetchStatus,
    );
  }

  void rebuild() {
    state = build();
  }

  /// 初回起動が完了したとして記録する
  void updateTutorial() async {
    const ConfigRepository().setTutorial(false);
    state = build();
  }

  /// 言語を変更する
  void updateLanguage(String language) async {
    FirebaseAnalytics.instance.setUserProperty(
      name: 'language',
      value: language,
    );
    const ConfigRepository().setLanguage(language);
    state = build();
  }

  /// テーマを変更する
  void toggleThemeMode() async {
    final themeMode = const ConfigRepository().themeMode;
    if (themeMode == ThemeMode.dark.name) {
      const ConfigRepository().setThemeMode(ThemeMode.light.name);
    } else {
      const ConfigRepository().setThemeMode(ThemeMode.dark.name);
    }
    state = build();
  }

  /// テーマを変更する
  void toggleSystemColorThemeMode() async {
    final themeMode = const ConfigRepository().themeMode;
    if (themeMode == ThemeMode.system.name) {
      const ConfigRepository().setThemeMode(ThemeMode.dark.name);
    } else {
      const ConfigRepository().setThemeMode(ThemeMode.system.name);
    }
    state = build();
  }

  void updateColorScheme(String? value) async {
    const ConfigRepository().setThemeColor(value);
    state = build();
  }
}
