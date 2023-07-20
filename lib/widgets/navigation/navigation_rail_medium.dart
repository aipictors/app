import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationRailMedium extends HookConsumerWidget {
  const NavigationRailMedium(
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

    //destinations内ではif文が使えない
    NavigationRailDestination loginORNotification() {
      if (authState.value == null) {
        return NavigationRailDestination(
            icon: const Icon(
              Icons.login_rounded,
              size: 30,
            ),
            label: Text('ログイン'.i18n),
            padding: const EdgeInsets.symmetric(vertical: 10));
      }
      return NavigationRailDestination(
          icon: const Icon(
            Icons.notifications_rounded,
            size: 30,
          ),
          label: Text('通知'.i18n),
          padding: const EdgeInsets.symmetric(vertical: 10));
    }

    return NavigationRail(
      selectedIndex: pageIndex.value,
      labelType: NavigationRailLabelType.all,
      minWidth: 100,
      destinations: [
        NavigationRailDestination(
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
            label: Text('ホーム'.i18n),
            padding: const EdgeInsets.symmetric(vertical: 10)),
        NavigationRailDestination(
            icon: const Icon(
              Icons.today_rounded,
              size: 30,
            ),
            label: Text('お題'.i18n),
            padding: const EdgeInsets.symmetric(vertical: 10)),
        NavigationRailDestination(
            icon: const Icon(
              Icons.explore_rounded,
              size: 30,
            ),
            label: Text('見つける'.i18n),
            padding: const EdgeInsets.symmetric(vertical: 10)),
        loginORNotification(),
        NavigationRailDestination(
            icon: const Icon(
              Icons.more_horiz_rounded,
              size: 30,
            ),
            label: Text('その他'.i18n),
            padding: const EdgeInsets.symmetric(vertical: 10)),
      ],
      onDestinationSelected: (index) {
        pageIndex.value = index;
      },
    );
  }
}
