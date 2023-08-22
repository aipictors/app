import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/screens/explorer/explorer_best_works_view.dart';
import 'package:aipictors/screens/explorer/explorer_hot_tags_view.dart';
import 'package:aipictors/screens/explorer/explorer_latest_albums_view.dart';
import 'package:aipictors/screens/explorer/explorer_popular_works_view.dart';
import 'package:aipictors/screens/explorer/explorer_search_view.dart';
import 'package:aipictors/utils/show_unavailable_snack_bar.dart';
import 'package:aipictors/widgets/app_bar/search_app_bar.dart';
import 'package:aipictors/widgets/controller/explorer_tab_controller.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索
class ExplorerScreen extends HookConsumerWidget {
  const ExplorerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final search = useState('');

    final isFilled = useState(false);

    const tabSize = 4;

    final searchContainer = SearchContainer(
      isFilled: isFilled.value,
      onSubmit: (text) {
        FirebaseAnalytics.instance.logSearch(searchTerm: text);
        search.value = text;
      },
      onFill: (value) {
        isFilled.value = value;
      },
    );

    return ExplorerTabController(
      length: tabSize,
      child: Scaffold(
        key: const PageStorageKey('explorer'),
        appBar: AppBar(
          title: searchContainer,
          actions: [
            if (isFilled.value == true)
              IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: () {
                  isFilled.value = false;
                  search.value = '';
                  searchContainer.clear();
                },
              ),
            if (isFilled.value == false)
              IconButton(
                icon: const Icon(Icons.settings_rounded),
                onPressed: () {
                  isFilled.value = false;
                  search.value = '';
                  searchContainer.clear();
                  showUnavailableSnackBar(context);
                },
              ),
          ],
          bottom: search.value.isEmpty
              ? TabBar(
                  // isScrollable: true,
                  tabs: [
                    Tab(text: 'シリーズ'.i18n),
                    Tab(text: 'タグ'.i18n),
                    Tab(text: '人気'.i18n),
                    Tab(text: 'ベスト'.i18n),
                  ],
                )
              : null,
        ),
        body: search.value.isNotEmpty
            ? ExplorerSearchView(search: search.value)
            : const TabBarView(children: [
                ExplorerAlbumsView(
                  key: PageStorageKey('explorer_latest_folders'),
                ),
                ExplorerHotTagsView(
                  key: PageStorageKey('explorer_hot_tags'),
                ),
                ExplorerPopularWorksView(
                  key: PageStorageKey('explorer_popular_works'),
                ),
                ExplorerBestWorksView(
                  key: PageStorageKey('explorer_best_works'),
                ),
              ]),
      ),
    );
  }
}
