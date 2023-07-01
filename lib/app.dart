import 'package:aipictors/config.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/router.dart';
import 'package:aipictors/utils/to_dark_color_scheme.dart';
import 'package:aipictors/utils/to_light_color_scheme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      final defaultThemeColor = DefaultConfig.defaultThemeColor;
      final themeColor = config.themeColor;
      return MaterialApp.router(
        title: 'Aipictors',
        routerConfig: router,
        themeMode: config.themeMode,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: toLightColorScheme(
            defaultThemeColor: defaultThemeColor,
            themeColor: themeColor,
            lightDynamic: lightDynamic,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: toDarkColorScheme(
            defaultThemeColor: defaultThemeColor,
            themeColor: themeColor,
            darkDynamic: darkDynamic,
          ),
        ),
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
