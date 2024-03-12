import 'package:aipictors/config.dart';
import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/handlers/auth_state_listener.dart';
import 'package:aipictors/handlers/remote_config_update_listener.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/config_update_provider.dart';
import 'package:aipictors/router.dart';
import 'package:aipictors/utils/extend_theme.dart';
import 'package:aipictors/utils/to_dark_color_scheme.dart';
import 'package:aipictors/utils/to_light_color_scheme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    ref.listen(
      configUpdateProvider,
      remoteConfigListener(context, ref),
    );

    ref.listen(
      authStateProvider,
      authStateListener(context, ref),
    );

    // スマートフォン横向き時にmediumにならないように、短辺で判定する
    final layout = Layout.fromWidth(MediaQuery.of(context).size.shortestSide);

    // レイアウト崩れ防止のため、スマホは縦画面のみにする
    if (layout == Layout.compact) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      final theme = ThemeData(
        useMaterial3: true,
        colorScheme: toLightColorScheme(
          defaultThemeColor: DefaultConfig.defaultThemeColor,
          themeColor: config.themeColor,
          lightDynamic: lightDynamic,
        ),
      );
      final darkTheme = ThemeData(
        useMaterial3: true,
        colorScheme: toDarkColorScheme(
          defaultThemeColor: DefaultConfig.defaultThemeColor,
          themeColor: config.themeColor,
          darkDynamic: darkDynamic,
        ),
      );
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Aipictors',
        themeMode: config.themeMode,
        theme: extendThemeData(theme),
        darkTheme: extendThemeData(darkTheme),
        locale: config.locale,
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        routerConfig: routerConfig,
      );
    });
  }

  /// アプリの対応する言語
  Iterable<Locale> get supportedLocales {
    return const [
      Locale('en'),
      Locale('ja'),
      Locale('vi'),
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
      Locale('fr'),
      Locale('it'),
    ];
  }

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates {
    return const [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }
}
