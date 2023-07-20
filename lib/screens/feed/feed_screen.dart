import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/screens/feed/feed_daily_theme_works_view.dart';
import 'package:aipictors/screens/feed/feed_home_view.dart';
import 'package:aipictors/screens/feed/feed_hot_works_view.dart';
import 'package:aipictors/screens/feed/feed_latest_works_view.dart';
import 'package:aipictors/widgets/controller/feed_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード
class FeedScreen extends HookConsumerWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
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
            Tab(text: '新着'.i18n),
            Tab(text: 'テーマ'.i18n),
            Tab(text: 'おすすめ'.i18n),
          ]),
        ),
        resizeToAvoidBottomInset: true,
        body: const TabBarView(children: [
          FeedHomeView(
            key: PageStorageKey('feed_home'),
          ),
          FeedLatestWorksView(
            key: PageStorageKey('feed_latest_works'),
          ),
          FeedDailyThemeWorksView(
            key: PageStorageKey('feed_daily_theme_works'),
          ),
          FeedHotWorksView(
            key: PageStorageKey('feed_hot_works'),
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: Text('投稿'.i18n),
          onPressed: () {
            context.push('/works/create');
          },
        ),
      ),
    );
  }
}
