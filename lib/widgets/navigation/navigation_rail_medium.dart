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

    NavigationRailDestination loginORNotification() {
      if (authState.value == null) {
        return const NavigationRailDestination(
            icon: Icon(
              Icons.login_rounded,
              size: 30,
            ),
            label: Text('ログイン'),
            padding: EdgeInsets.symmetric(vertical: 10));
      }
      return const NavigationRailDestination(
          icon: Icon(
            Icons.notifications_rounded,
            size: 30,
          ),
          label: Text('通知'),
          padding: EdgeInsets.symmetric(vertical: 10));
    }

    return NavigationRail(
      selectedIndex: pageIndex.value,
      labelType: NavigationRailLabelType.selected,
      minWidth: 100,
      destinations: [
        const NavigationRailDestination(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: Text('ホーム'),
            padding: EdgeInsets.symmetric(vertical: 10)),
        const NavigationRailDestination(
            icon: Icon(
              Icons.today_rounded,
              size: 30,
            ),
            label: Text('お題'),
            padding: EdgeInsets.symmetric(vertical: 10)),
        const NavigationRailDestination(
            icon: Icon(
              Icons.explore_rounded,
              size: 30,
            ),
            label: Text('見つける'),
            padding: EdgeInsets.symmetric(vertical: 10)),
        loginORNotification(),
        const NavigationRailDestination(
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 30,
            ),
            label: Text('その他'),
            padding: EdgeInsets.symmetric(vertical: 10)),
      ],
      onDestinationSelected: (index) {
        pageIndex.value = index;
      },
    );
  }
}
