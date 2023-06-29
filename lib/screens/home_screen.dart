import 'package:aipictors/screens/daily_themes_screen.dart';
import 'package:aipictors/screens/viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'awards_screen.dart';
import 'notification_screen.dart';
import 'search_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    // タブの位置
    final pageIndex = useState(0);

    const screens = [
      DailyThemesScreen(),
      SearchScreen(),
      AwardsScreen(),
      NotificationScreen(),
      ViewerScreen()
    ];

    return Scaffold(
      body: screens[pageIndex.value],
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex.value,
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
            icon: Icon(Icons.person_rounded),
            label: 'マイページ',
          ),
        ],
        onDestinationSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}
