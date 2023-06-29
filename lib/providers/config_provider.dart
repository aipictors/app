import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/storage_repository.dart';
import '../states/config_state.dart';

part 'config_provider.g.dart';

/// 設定
@riverpod
class Config extends _$Config {
  @override
  ConfigState build() {
    return refetch();
  }

  ConfigState refetch() {
    const repository = StorageRepository();
    return ConfigState(
      isFirstTime: repository.isTutorial,
      language: repository.language,
      themeMode: _toThemeMode(repository.themeMode),
      color: _toColor(repository.colorScheme),
    );
  }

  /// 初回起動が完了したとして記録する
  void updateTutorial() async {
    const StorageRepository().setTutorial(false);
    state = refetch();
  }

  /// 言語を変更する
  void updateLanguage(String language) async {
    FirebaseAnalytics.instance.setUserProperty(
      name: 'language',
      value: language,
    );
    const StorageRepository().setLanguage(language);
    state = refetch();
  }

  /// テーマを変更する
  void toggleThemeMode() async {
    final themeMode = const StorageRepository().themeMode;
    if (themeMode == ThemeMode.dark.name) {
      const StorageRepository().setThemeMode(ThemeMode.light.name);
    } else {
      const StorageRepository().setThemeMode(ThemeMode.dark.name);
    }
    state = refetch();
  }

  void updateColorScheme(String value) async {
    const StorageRepository().setColorScheme(value);
    state = refetch();
  }

  /// 文字列からThemeModeに変換する
  ThemeMode _toThemeMode(String? text) {
    if (text == ThemeMode.light.name) {
      return ThemeMode.light;
    }
    if (text == ThemeMode.dark.name) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  Color? _toColor(String? text) {
    if (text == 'blue') {
      return Colors.lightBlue;
    }
    if (text == 'white') {
      return Colors.white;
    }
    if (text == 'purple') {
      return Colors.purple;
    }
    return null;
  }
}
