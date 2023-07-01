import 'package:flutter/material.dart';

ThemeData extendThemeData(ThemeData themeData) {
  // https://github.com/flutter/flutter/issues/18150
  // 日本語と中国語の場合はFontWeightは2種類しかないのでBoldに変更する。
  final textTheme = themeData.textTheme.copyWith(
    displayLarge: themeData.textTheme.displayLarge!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    displayMedium: themeData.textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    displaySmall: themeData.textTheme.displaySmall!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: themeData.textTheme.headlineLarge!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: themeData.textTheme.headlineMedium!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: themeData.textTheme.headlineSmall!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: themeData.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: themeData.textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    titleSmall: themeData.textTheme.titleSmall!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    // bodyLarge: themeData.textTheme.bodyLarge!.copyWith(
    //   fontWeight: FontWeight.bold,
    // ),
    // bodyMedium: themeData.textTheme.bodyMedium!.copyWith(
    //   fontWeight: FontWeight.bold,
    // ),
    // bodySmall: themeData.textTheme.bodySmall!.copyWith(
    //   fontWeight: FontWeight.bold,
    // ),
    labelLarge: themeData.textTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    labelMedium: themeData.textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.bold,
    ),
    labelSmall: themeData.textTheme.labelSmall!.copyWith(
      fontWeight: FontWeight.bold,
    ),
  );

  return themeData.copyWith(
    textTheme: textTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: textTheme.headlineSmall!.copyWith(fontSize: 20),
    ),
  );
}
