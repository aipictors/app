import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/viewer/queries/__generated__/viewer_user.data.gql.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/providers/viewer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeNavigationBar extends HookConsumerWidget {
  const HomeNavigationBar({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final pageIndex = ref.watch(homeTabIndexProvider);

    final ValueNotifier<GViewerUserData?> viewer = useState(null);
    ref.watch(viewerProvider.future).then((value) => viewer.value = value);

    return NavigationBar(
      selectedIndex: pageIndex,
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
        if (authState.value == null)
          NavigationDestination(
            icon: const Icon(Icons.explore_rounded),
            label: '見つける'.i18n,
          ),
        if (authState.value != null)
          NavigationDestination(
            icon: const Icon(Icons.science_rounded),
            label: '生成'.i18n,
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
        if (viewer.value?.viewer?.currentPass?.type != null)
          NavigationDestination(
            icon: const Icon(Icons.photo_rounded),
            label: '画像生成'.i18n,
          ),
        NavigationDestination(
          icon: const Icon(Icons.more_horiz_rounded),
          label: 'その他'.i18n,
        ),
      ],
      onDestinationSelected: (index) {
        final notifier = ref.read(homeTabIndexProvider.notifier);
        notifier.update(index);
      },
    );
  }
}
