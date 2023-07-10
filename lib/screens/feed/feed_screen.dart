import 'package:aipictors/screens/feed/feed_daily_theme_screen.dart';
import 'package:aipictors/screens/feed/feed_home_screen.dart';
import 'package:aipictors/screens/feed/feed_hot_works_screen.dart';
import 'package:aipictors/screens/feed/feed_latest_works_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedScreen extends HookConsumerWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    const tabSize = 4;

    return DefaultTabController(
      length: tabSize,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('フィード'),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear_rounded),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'ホーム'),
              Tab(text: 'お題'),
              Tab(text: '新着'),
              Tab(text: 'おすすめ'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          FeedHomeScreen(),
          FeedDailyThemeScreen(),
          FeedLatestWorksScreen(),
          FeedHotWorksScreen(),
        ]),
      ),
    );
  }
}
