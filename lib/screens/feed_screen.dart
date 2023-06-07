import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'feed_followees_screen.dart';
import 'feed_hot_screen.dart';
import 'feed_latest_screen.dart';

class FeedScreen extends HookConsumerWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    const views = [
      FeedHotScreen(),
      FeedLatestScreen(),
      FeedFolloweesScreen(),
    ];

    return DefaultTabController(
      key: const PageStorageKey("feed"),
      length: views.length,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: Text(
                        'おすすめ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'フォロー中',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        '新着',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: const TabBarView(children: views),
        );
      }),
    );
  }
}
