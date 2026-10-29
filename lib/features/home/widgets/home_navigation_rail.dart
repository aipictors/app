import 'package:aipictors/features/home/widgets/home_navigation_bar.dart';
import 'package:aipictors/features/viewer/__generated__/viewer_user.data.gql.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/providers/viewer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// https://codelabs.developers.google.com/codelabs/flutter-boring-to-beautiful?hl=ja#5
class HomeNavigationRail extends HookConsumerWidget {
  const HomeNavigationRail({super.key});

  @override
  Widget build(context, ref) {
    final pageIndex = ref.watch(homeTabIndexProvider);

    final ValueNotifier<GViewerUserData?> viewer = useState(null);
    ref.watch(viewerProvider.future).then((value) => viewer.value = value);

    return NavigationRail(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      labelType: NavigationRailLabelType.all,
      selectedIndex: pageIndex,
      destinations: [
        for (final item in HomeNavigationBar.items)
          NavigationRailDestination(
            icon: Icon(item.$1),
            selectedIcon: Icon(item.$2),
            label: Text(item.$3),
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
