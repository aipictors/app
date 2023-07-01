import 'package:aipictors/screens/explorer/explorer_best_works_screen.dart';
import 'package:aipictors/screens/explorer/explorer_hot_works_screen.dart';
import 'package:aipictors/screens/explorer/explorer_popular_works_screen.dart';
import 'package:aipictors/screens/explorer/explorer_search_screen.dart';
import 'package:aipictors/widgets/app_bar/search_app_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplorerWorksScreen extends HookConsumerWidget {
  const ExplorerWorksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final search = useState('');

    final isFilled = useState(false);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: const PageStorageKey('explorer'),
        appBar: AppBar(
          title: SearchContainer(
            isFilled: isFilled.value,
            onSubmit: (text) {
              if (text.isNotEmpty) {
                FirebaseAnalytics.instance.logSearch(searchTerm: text);
              }
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
              ? const TabBar(tabs: [
                  Tab(text: 'ホット'),
                  Tab(text: '人気'),
                  Tab(text: 'ベスト'),
                ])
              : null,
        ),
        body: search.value.isNotEmpty
            ? ExplorerSearchScreen(search: search.value)
            : const TabBarView(children: [
                ExplorerHotWorksScreen(),
                ExplorerPopularWorksScreen(),
                ExplorerBestWorksScreen(),
              ]),
      ),
    );
  }
}
