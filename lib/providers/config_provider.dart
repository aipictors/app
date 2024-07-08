import 'dart:io';

import 'package:aipictors/features/config/utils/to_color.dart';
import 'package:aipictors/features/config/utils/to_theme_mode.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/states/config_state.dart';
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
      isTutorial: repository.isTutorial,
      language: repository.language,
      themeMode: toThemeMode(repository.themeMode),
      themeMediumLayout: repository.themeMediumLayout,
      themeCompactLayout: repository.themeCompactLayout,
      themeColor: toColor(repository.themeColor),
      lastFetchStatus: FirebaseRemoteConfig.instance.lastFetchStatus,
      eulaCheck: repository.eulaCheck,
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

  /// UIモードを変更する
  void updateThemeMediumLayout(bool value) async {
    const ConfigRepository().setThemeMediumLayout(value);
    state = build();
  }

  /// UIモードを変更する
  void updateThemeCompactLayout(bool value) async {
    const ConfigRepository().setThemeCompactLayout(value);
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
    }
    if (themeMode != ThemeMode.system.name) {
      const ConfigRepository().setThemeMode(ThemeMode.system.name);
      // OSのカラーパレットを使用する
      if (Platform.isAndroid) {
        const ConfigRepository().setThemeColor(null);
      }
    }
    state = build();
  }

  void updateColorScheme(String? value) async {
    const ConfigRepository().setThemeColor(value);
    state = build();
  }

  void updateEulaCheck(bool value) async {
    const ConfigRepository().setEulaCheck(value);
    state = build();
  }
}
