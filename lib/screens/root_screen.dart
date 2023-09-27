import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/handlers/message_handler.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/background_message_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/foreground_message_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/providers/initial_message_provider.dart';
import 'package:aipictors/screens/config/config_screen.dart';
import 'package:aipictors/screens/daily_theme/daily_theme_home_screen.dart';
import 'package:aipictors/screens/error/config_error_screen.dart';
import 'package:aipictors/screens/explorer/explorer_screen.dart';
import 'package:aipictors/screens/feed/feed_screen.dart';
import 'package:aipictors/screens/hello_screen.dart';
import 'package:aipictors/screens/home_loading_screen.dart';
import 'package:aipictors/screens/maintenance_screen.dart';
import 'package:aipictors/screens/notification_screen.dart';
import 'package:aipictors/screens/update_screen.dart';
import 'package:aipictors/widgets/navigation/home_navigation_bar.dart';
import 'package:aipictors/widgets/navigation/home_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootScreen extends HookConsumerWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final config = ref.watch(configProvider);

    // タブの位置
    final pageIndex = ref.watch(homeTabIndexProvider);

    // 初期化エラー
    if (config.isFailed) {
      return const ConfigErrorScreen();
    }

    // アップデート
    if (config.isOutOfDate) {
      return const UpdateScreen();
    }

    // メンテナンスモード
    if (config.isMaintenanceMode) {
      return const MaintenanceScreen();
    }

    // ログイン中
    if (authState.isLoading) {
      return const HomeLoadingScreen();
    }

    ref.listen(
      initialMessageProvider,
      messageListener(context, ref),
    );

    ref.listen(
      foregroundMessageProvider,
      messageListener(context, ref),
    );

    ref.listen(
      backgroundMessageProvider,
      messageListener(context, ref),
    );

    final screenList = [
      const FeedScreen(key: PageStorageKey('root_feed')),
      const DailyThemeHomeScreen(key: PageStorageKey('root_daily_theme')),
      const ExplorerScreen(key: PageStorageKey('root_explorer')),
      if (authState.value == null)
        const HelloScreen(key: PageStorageKey('root_hello')),
      if (authState.value != null)
        const NotificationScreen(key: PageStorageKey('root_notification')),
      const ConfigScreen(key: PageStorageKey('root_config'))
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final notCompact = Layout.fromWith(constraints.maxWidth).notCompact;
      // タブレット
      if (notCompact) {
        return Scaffold(
          body: Row(
            children: [
              const HomeNavigationRail(),
              Expanded(child: screenList[pageIndex])
            ],
          ),
        );
      }
      // スマホ用
      return Scaffold(
        body: screenList[pageIndex],
        bottomNavigationBar: const HomeNavigationBar(),
      );
    });
  }
}
