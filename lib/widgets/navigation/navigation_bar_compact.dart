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
        const NavigationDestination(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        const NavigationDestination(
          icon: Icon(Icons.today_rounded),
          label: 'お題',
        ),
        const NavigationDestination(
          icon: Icon(Icons.explore_rounded),
          label: '見つける',
        ),
        if (authState.value == null)
          const NavigationDestination(
            icon: Icon(Icons.login_rounded),
            label: 'ログイン',
          ),
        if (authState.value != null)
          const NavigationDestination(
            icon: Icon(Icons.notifications_rounded),
            label: '通知',
          ),
        const NavigationDestination(
          icon: Icon(Icons.more_horiz_rounded),
          label: 'その他',
        ),
      ],
      onDestinationSelected: (index) {
        pageIndex.value = index;
      },
    );
  }
}
