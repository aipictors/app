import 'package:aipictors/config.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/routes/explorer/explorer_best_works_view.dart';
import 'package:aipictors/routes/explorer/explorer_hot_tags_view.dart';
import 'package:aipictors/routes/explorer/explorer_latest_albums_view.dart';
import 'package:aipictors/routes/explorer/explorer_popular_works_view.dart';
import 'package:aipictors/routes/explorer/widgets/explorer_tab_controller.dart';
import 'package:aipictors/routes/search/widgets/search_app_bar.dart';
import 'package:aipictors/utils/show_unavailable_snack_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索
class ExplorerScreen extends HookConsumerWidget {
  const ExplorerScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final isFilled = useState(false);

    const tabSize = 4;

    final searchContainer = SearchContainer(
      isFilled: isFilled.value,
      initialText: '',
      onSubmit: (controller) {
        if (!isFilled.value) {
          return null;
        }
        final text = controller.text;
        FirebaseAnalytics.instance.logSearch(searchTerm: text);
        isFilled.value = false;
        controller.clear();
        context.push('/search/$text');
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
                    searchContainer.clear();
                  },
                ),
              if (DefaultConfig.isNotProduction && isFilled.value == false)
                IconButton(
                  icon: const Icon(Icons.settings_rounded),
                  onPressed: () {
                    isFilled.value = false;
                    searchContainer.clear();
                    showUnavailableSnackBar(context);
                  },
                ),
            ],
            bottom: TabBar(
              // isScrollable: true,
              tabs: [
                Tab(text: '人気'.i18n),
                Tab(text: 'ベスト'.i18n),
                Tab(text: 'シリーズ'.i18n),
                Tab(text: 'タグ'.i18n),
              ],
            )),
        body: const TabBarView(children: [
          ExplorerPopularWorksView(
            key: PageStorageKey('explorer_popular_works'),
          ),
          ExplorerBestWorksView(
            key: PageStorageKey('explorer_best_works'),
          ),
          ExplorerAlbumsView(
            key: PageStorageKey('explorer_latest_folders'),
          ),
          ExplorerHotTagsView(
            key: PageStorageKey('explorer_hot_tags'),
          ),
        ]),
      ),
    );
  }
}
