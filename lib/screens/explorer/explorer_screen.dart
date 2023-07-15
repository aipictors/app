import 'package:aipictors/screens/explorer/explorer_best_works_view.dart';
import 'package:aipictors/screens/explorer/explorer_hot_tags_view.dart';
import 'package:aipictors/screens/explorer/explorer_latest_folders_view.dart';
import 'package:aipictors/screens/explorer/explorer_popular_works_view.dart';
import 'package:aipictors/screens/explorer/explorer_search_view.dart';
import 'package:aipictors/widgets/app_bar/search_app_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplorerScreen extends HookConsumerWidget {
  const ExplorerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final search = useState('');

    final isFilled = useState(false);

    const tabSize = 4;

    return DefaultTabController(
      length: tabSize,
      child: Scaffold(
        key: const PageStorageKey('explorer'),
        appBar: AppBar(
          title: SearchContainer(
            isFilled: isFilled.value,
            onSubmit: (text) {
              FirebaseAnalytics.instance.logSearch(searchTerm: text);
              search.value = text;
            },
            onFill: (value) {
              isFilled.value = value;
            },
          ),
          actions: [
            if (isFilled.value == true)
              IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: () {
                  isFilled.value = false;
                  search.value = '';
                },
              ),
            if (isFilled.value == false)
              IconButton(
                icon: const Icon(Icons.settings_rounded),
                onPressed: () {
                  isFilled.value = false;
                  search.value = '';
                },
              ),
          ],
          bottom: search.value.isEmpty
              ? const TabBar(
                  // isScrollable: true,
                  tabs: [
                    Tab(text: 'シリーズ'),
                    Tab(text: 'タグ'),
                    Tab(text: '人気'),
                    Tab(text: 'ベスト'),
                  ],
                )
              : null,
        ),
        body: search.value.isNotEmpty
            ? ExplorerSearchView(search: search.value)
            : const TabBarView(children: [
                ExplorerFoldersView(),
                ExplorerHotTagsView(),
                ExplorerPopularWorksView(),
                ExplorerBestWorksView(),
              ]),
      ),
    );
  }
}
