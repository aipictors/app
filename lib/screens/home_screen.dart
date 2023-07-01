import 'package:aipictors/screens/award/work_awards_screen.dart';
import 'package:aipictors/screens/config/config_screen.dart';
import 'package:aipictors/screens/daily_theme/daily_themes_screen.dart';
import 'package:aipictors/screens/explorer/explorer_works_screen.dart';
import 'package:aipictors/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    // タブの位置
    final pageIndex = useState(0);

    const screens = [
      DailyThemesScreen(),
      ExplorerWorksScreen(),
      WorkAwardsScreen(),
      NotificationScreen(),
      ConfigScreen()
    ];

    return Scaffold(
      body: screens[pageIndex.value],
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex.value,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'お題',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: '検索',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_rounded),
            label: 'ランキング',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_rounded),
            label: '通知',
          ),
          NavigationDestination(
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
