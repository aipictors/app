import 'package:aipictors/repositories/storage_repository.dart';
import 'package:aipictors/states/config_state.dart';
import 'package:aipictors/utils/to_color.dart';
import 'package:aipictors/utils/to_theme_mode.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';

/// 設定
@riverpod
class Config extends _$Config {
  @override
  ConfigState build() {
    return _refetch();
  }

  ConfigState _refetch() {
    const repository = StorageRepository();
    return ConfigState(
      isFirstTime: repository.isTutorial,
      language: repository.language,
      themeMode: toThemeMode(repository.themeMode),
      themeColor: toColor(repository.themeColor),
    );
  }

  /// 初回起動が完了したとして記録する
  void updateTutorial() async {
    const StorageRepository().setTutorial(false);
    state = _refetch();
  }

  /// 言語を変更する
  void updateLanguage(String language) async {
    FirebaseAnalytics.instance.setUserProperty(
      name: 'language',
      value: language,
    );
    const StorageRepository().setLanguage(language);
    state = _refetch();
  }

  /// テーマを変更する
  void toggleThemeMode() async {
    final themeMode = const StorageRepository().themeMode;
    if (themeMode == ThemeMode.dark.name) {
      const StorageRepository().setThemeMode(ThemeMode.light.name);
    } else {
      const StorageRepository().setThemeMode(ThemeMode.dark.name);
    }
    state = _refetch();
  }

  void updateColorScheme(String? value) async {
    const StorageRepository().setThemeColor(value);
    state = _refetch();
  }
}
