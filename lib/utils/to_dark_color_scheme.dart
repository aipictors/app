import 'package:flutter/material.dart';

ColorScheme toDarkColorScheme({
  required Color defaultThemeColor,
  required Color? themeColor,
  required ColorScheme? darkDynamic,
}) {
  if (themeColor != null) {
    return ColorScheme.fromSeed(
      seedColor: themeColor,
      brightness: Brightness.dark,
    );
  }

  if (darkDynamic != null) {
    return darkDynamic;
  }

  return ColorScheme.fromSeed(
    seedColor: defaultThemeColor,
    brightness: Brightness.dark,
  );
}
