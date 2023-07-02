import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/award/work_awards_screen.dart';
import 'package:aipictors/screens/config/config_screen.dart';
import 'package:aipictors/screens/config_error_screen.dart';
import 'package:aipictors/screens/daily_theme/daily_themes_screen.dart';
import 'package:aipictors/screens/explorer/explorer_works_screen.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/screens/login_screen.dart';
import 'package:aipictors/screens/notification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final config = ref.watch(configProvider);

    // タブの位置
    final pageIndex = useState(0);

    // ログイン状態が変わった際にホームに戻す
    ref.listen<AsyncValue<User?>>(
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

    final screens = [
      const DailyThemesScreen(),
      const ExplorerWorksScreen(),
      const WorkAwardsScreen(),
      if (authState.value == null) const LoginScreen(),
      if (authState.value != null) const NotificationScreen(),
      const ConfigScreen()
    ];

    return Scaffold(
      body: screens[pageIndex.value],
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex.value,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.today_rounded),
            label: 'お題',
          ),
          const NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: '検索',
          ),
          const NavigationDestination(
            icon: Icon(Icons.emoji_events_rounded),
            label: 'ランキング',
          ),
          if (authState.value == null)
            const NavigationDestination(
              icon: Icon(Icons.login_rounded),
              label: 'ログイン',
            ),
          if (authState.value != null)
            const NavigationDestination(
              icon: Icon(Icons.notifications_rounded),
              label: '通知',
            ),
          const NavigationDestination(
            icon: Icon(Icons.more_horiz_rounded),
            label: 'その他',
          ),
        ],
        onDestinationSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}
