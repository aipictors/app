import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/screens/config/config_screen.dart';
import 'package:aipictors/screens/daily_theme/daily_themes_screen.dart';
import 'package:aipictors/screens/error/config_error_screen.dart';
import 'package:aipictors/screens/explorer/explorer_screen.dart';
import 'package:aipictors/screens/feed/feed_screen.dart';
import 'package:aipictors/screens/home_loading_screen.dart';
import 'package:aipictors/screens/login_screen.dart';
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

    // ログイン状態が変わった際にホームに戻す
    ref.listen(
      authStateProvider,
      (_, next) {
        final notifier = ref.read(homeTabIndexProvider.notifier);
        notifier.update(0);
      },
    );

    if (config.isFailed) {
      return const ConfigErrorScreen();
    }

    if (config.isOutOfDate) {
      return const UpdateScreen();
    }

    if (authState.isLoading) {
      return const HomeLoadingScreen();
    }

    final screenList = [
      const FeedScreen(key: PageStorageKey('root_feed')),
      const DailyThemesScreen(key: PageStorageKey('root_daily_theme')),
      const ExplorerScreen(key: PageStorageKey('root_explorer')),
      if (authState.value == null)
        const LoginScreen(key: PageStorageKey('root_login')),
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
