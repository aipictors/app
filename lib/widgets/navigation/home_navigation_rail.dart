import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// https://codelabs.developers.google.com/codelabs/flutter-boring-to-beautiful?hl=ja#5
class HomeNavigationRail extends HookConsumerWidget {
  const HomeNavigationRail({super.key});

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final pageIndex = ref.watch(homeTabIndexProvider);

    return NavigationRail(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      labelType: NavigationRailLabelType.all,
      selectedIndex: pageIndex,
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.home),
          label: Text('ホーム'.i18n),
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.today_rounded),
          label: Text('お題'.i18n),
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.explore_rounded),
          label: Text('見つける'.i18n),
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
        if (authState.value == null)
          NavigationRailDestination(
            icon: const Icon(Icons.login_rounded),
            label: Text('ログイン'.i18n),
            padding: const EdgeInsets.symmetric(vertical: 4),
          ),
        if (authState.value != null)
          NavigationRailDestination(
            icon: const Icon(Icons.notifications_rounded),
            label: Text('通知'.i18n),
            padding: const EdgeInsets.symmetric(vertical: 4),
          ),
        NavigationRailDestination(
          icon: const Icon(Icons.more_horiz_rounded),
          label: Text('その他'.i18n),
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
      ],
      onDestinationSelected: (index) {
        final notifier = ref.read(homeTabIndexProvider.notifier);
        notifier.update(index);
      },
    );
  }
}
