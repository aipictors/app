import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/feed_tab_index_provider.dart';
import 'package:aipictors/screens/feed/feed_daily_theme_works_screen.dart';
import 'package:aipictors/screens/feed/feed_home_screen.dart';
import 'package:aipictors/screens/feed/feed_hot_works_screen.dart';
import 'package:aipictors/screens/feed/feed_latest_works_screen.dart';
import 'package:aipictors/widgets/controller/feed_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード
class FeedScreen extends HookConsumerWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    ref.watch(feedTabIndexProvider);

    const tabSize = 4;

    return FeedTabController(
      length: tabSize,
      child: Scaffold(
        appBar: AppBar(
          title: ImageIcon(
            const AssetImage('assets/images/aipictors.png'),
            color: Theme.of(context).colorScheme.primary,
            size: 32,
          ),
          actions: const [],
          bottom: TabBar(tabs: [
            Tab(text: 'ホーム'.i18n),
            Tab(text: 'お題'.i18n),
            Tab(text: 'おすすめ'.i18n),
            Tab(text: '新着'.i18n),
          ]),
        ),
        resizeToAvoidBottomInset: true,
        body: const TabBarView(children: [
          FeedHomeScreen(
            key: PageStorageKey('feed_home'),
          ),
          FeedDailyThemeWorksScreen(
            key: PageStorageKey('feed_daily_theme_works'),
          ),
          FeedHotWorksScreen(
            key: PageStorageKey('feed_hot_works'),
          ),
          FeedLatestWorksScreen(
            key: PageStorageKey('feed_latest_works'),
          ),
        ]),
      ),
    );
  }
}
