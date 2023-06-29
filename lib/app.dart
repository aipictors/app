import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config.dart';
import 'providers/config_provider.dart';
import 'router.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      final defaultColorScheme = DefaultConfig.defaultColorScheme;
      final colorScheme = config.colorScheme;
      final lightTheme = ThemeData(
        colorScheme: colorScheme ?? lightDynamic ?? defaultColorScheme,
        useMaterial3: true,
      );
      final darkTheme = ThemeData(
        colorScheme: colorScheme ?? darkDynamic ?? defaultColorScheme,
        useMaterial3: true,
      );
      return MaterialApp.router(
        title: 'Aipictors',
        routerConfig: router,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: config.themeMode,
        supportedLocales: const [
          Locale('en', ''),
          Locale('ja', ''),
          Locale('vi', ''),
          Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans',
            countryCode: 'cn',
          ),
          Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant',
            countryCode: 'tw',
          ),
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      );
    });
  }
}
