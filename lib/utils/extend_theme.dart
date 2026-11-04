import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// iOS で探すフォントを明示する。ハングルは Apple SD Gothic Neo を絵文字より前に置く。
/// iOS 26.3 シミュレーターは Core/AppleColorEmoji.ttc が無く、絵文字は Safari でも豆腐になる。
/// このとき Apple Color Emoji はどの文字にも豆腐を返すので、後ろのフォントまで届かない
List<String>? get _appleFontFallback {
  if (defaultTargetPlatform != TargetPlatform.iOS && defaultTargetPlatform != TargetPlatform.macOS) return null;
  return const ['Hiragino Sans', 'Apple SD Gothic Neo', 'Apple Color Emoji', 'PingFang SC'];
}

ThemeData extendThemeData(ThemeData themeData) {
  // https://github.com/flutter/flutter/issues/18150
  // 日本語と中国語の場合はFontWeightは2種類しかないのでBoldに変更する。
  final textTheme = themeData.textTheme.apply(fontFamilyFallback: _appleFontFallback).copyWith(
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
    // iOS は Cupertino のまま、Android も横に滑らせて前の画面を残す動きにそろえる
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    dialogTheme: DialogThemeData(
      titleTextStyle: textTheme.headlineSmall!.copyWith(fontSize: 20),
    ),
    // ダークモードが適用されない
    // listTileTheme: themeData.listTileTheme.copyWith(
    //   titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
    // ),
  );
}
