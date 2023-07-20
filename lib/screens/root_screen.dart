import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/config/config_screen.dart';
import 'package:aipictors/screens/daily_theme/daily_themes_screen.dart';
import 'package:aipictors/screens/error/config_error_screen.dart';
import 'package:aipictors/screens/explorer/explorer_screen.dart';
import 'package:aipictors/screens/feed/feed_screen.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/screens/login_screen.dart';
import 'package:aipictors/screens/notification_screen.dart';
import 'package:aipictors/widgets/navigation/navigation_bar_compact.dart';
import 'package:aipictors/widgets/navigation/navigation_rail_medium.dart';
import 'package:aipictors/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootScreen extends HookConsumerWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final config = ref.watch(configProvider);

    // タブの位置
    final pageIndex = useState(0);

    // ログイン状態が変わった際にホームに戻す
    ref.listen(
      authStateProvider,
      (_, next) {
        pageIndex.value = 0;
      },
    );

    if (config.isFailed) {
      return const ConfigErrorScreen();
    }

    if (authState.isLoading) {
      return const LoadingScreen();
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

    //タブレット用
    if (MediaQuery.of(context).size.width >= DefaultConfig.mediumUIThreshold) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRailMedium(
              authStateProvider: authStateProvider,
              pageIndex: pageIndex,
            ),
            Expanded(child: screenList[pageIndex.value])
          ],
        ),
      );
    }
    //スマホ用
    return Scaffold(
        body: screenList[pageIndex.value],
        bottomNavigationBar: NavigationBarCompact(
          authStateProvider: authStateProvider,
          pageIndex: pageIndex,
        ));
  }
}
