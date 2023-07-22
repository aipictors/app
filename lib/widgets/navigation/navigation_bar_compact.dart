import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationBarCompact extends HookConsumerWidget {
  const NavigationBarCompact(
      {Key? key, required this.authStateProvider, required this.pageIndex})
      : super(key: key);

  final AutoDisposeStreamProvider authStateProvider;
  final ValueNotifier<int> pageIndex;

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    // ログイン状態が変わった際にホームに戻す
    ref.listen(
      authStateProvider,
      (_, next) {
        pageIndex.value = 0;
      },
    );

    return NavigationBar(
      selectedIndex: pageIndex.value,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: 'ホーム'.i18n,
        ),
        NavigationDestination(
          icon: const Icon(Icons.today_rounded),
          label: 'お題'.i18n,
        ),
        NavigationDestination(
          icon: const Icon(Icons.explore_rounded),
          label: '見つける'.i18n,
        ),
        if (authState.value == null)
          NavigationDestination(
            icon: const Icon(Icons.login_rounded),
            label: 'ログイン'.i18n,
          ),
        if (authState.value != null)
          NavigationDestination(
            icon: const Icon(Icons.notifications_rounded),
            label: '通知'.i18n,
          ),
        NavigationDestination(
          icon: const Icon(Icons.more_horiz_rounded),
          label: 'その他'.i18n,
        ),
      ],
      onDestinationSelected: (index) {
        pageIndex.value = index;
      },
    );
  }
}
