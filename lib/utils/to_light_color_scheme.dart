import 'package:flutter/material.dart';

ColorScheme toLightColorScheme({
  required Color defaultThemeColor,
  required Color? themeColor,
  required ColorScheme? lightDynamic,
}) {
  if (themeColor != null) {
    return ColorScheme.fromSeed(seedColor: themeColor);
  }

  if (lightDynamic != null) {
    return lightDynamic;
  }

  return ColorScheme.fromSeed(seedColor: defaultThemeColor);
}
