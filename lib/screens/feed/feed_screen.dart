import 'package:aipictors/screens/feed/feed_daily_theme_works_screen.dart';
import 'package:aipictors/screens/feed/feed_home_view.dart';
import 'package:aipictors/screens/feed/feed_hot_works_screen.dart';
import 'package:aipictors/screens/feed/feed_latest_works_screen.dart';
import 'package:flutter/material.dart';
import 'package:aipictors/default.i18n.dart';
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
          title: Text('フィード'.i18n),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear_rounded),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(tabs: [
            Tab(text: 'ホーム'.i18n),
            Tab(text: 'お題'.i18n),
            Tab(text: '新着'.i18n),
            Tab(text: 'おすすめ'.i18n),
          ]),
        ),
        resizeToAvoidBottomInset: true,
        body: const TabBarView(children: [
          FeedHomeView(),
          FeedDailyThemeWorksScreen(),
          FeedLatestWorksScreen(),
          FeedHotWorksScreen(),
        ]),
      ),
    );
  }
}
