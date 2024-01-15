import 'package:aipictors/config.dart';
import 'package:aipictors/screens/explorer/explorer_search_view.dart';
import 'package:aipictors/utils/show_unavailable_snack_bar.dart';
import 'package:aipictors/widgets/app_bar/search_app_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 検索
class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(context, ref) {
    final search = useState(text);

    final isFilled = useState(true);

    final searchContainer = SearchContainer(
      isFilled: isFilled.value,
      initialText: search.value,
      onSubmit: (controller) {
        final text = controller.text;
        FirebaseAnalytics.instance.logSearch(searchTerm: text);
        search.value = text;
      },
      onFill: (value) {
        isFilled.value = value;
      },
    );

    return Scaffold(
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
            if (DefaultConfig.isNotProduction && isFilled.value == false)
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
        ),
        body: ExplorerSearchView(search: search.value));
  }
}
