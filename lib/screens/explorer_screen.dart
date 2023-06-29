import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/app_bar/search_app_bar.dart';
import 'explorer_best_screen.dart';
import 'explorer_hot_screen.dart';
import 'explorer_popular_screen.dart';
import 'explorer_search_screen.dart';

class ExplorerScreen extends HookConsumerWidget {
  const ExplorerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final search = useState('');

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: const PageStorageKey('explorer'),
        appBar: AppBar(
          title: SearchContainer(onSubmit: (text) {
            search.value = text;
          }),
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
                ExplorerHotScreen(),
                ExplorerPopularScreen(),
                ExplorerBestScreen(),
              ]),
      ),
    );
  }
}
