import 'package:flutter/material.dart';

/// 文字列からThemeModeに変換する
ThemeMode toThemeMode(String? text) {
  if (text == ThemeMode.light.name) {
    return ThemeMode.light;
  }

  if (text == ThemeMode.dark.name) {
    return ThemeMode.dark;
  }

  return ThemeMode.system;
}
