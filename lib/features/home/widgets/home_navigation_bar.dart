import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 下のタブ（ホーム・探す・生成・通知・マイページ）
class HomeNavigationBar extends HookConsumerWidget {
  const HomeNavigationBar({super.key});

  static const items = [
    (Icons.home_outlined, Icons.home_rounded, 'ホーム'),
    (Icons.search_rounded, Icons.manage_search_rounded, '探す'),
    (Icons.auto_awesome_outlined, Icons.auto_awesome_rounded, '生成'),
    (Icons.notifications_none_rounded, Icons.notifications_rounded, '通知'),
    (Icons.person_outline_rounded, Icons.person_rounded, 'マイページ'),
  ];

  @override
  Widget build(context, ref) {
    final pageIndex = ref.watch(homeTabIndexProvider).clamp(0, items.length - 1);
    return NavigationBar(
      selectedIndex: pageIndex,
      height: 64,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        for (var i = 0; i < items.length; i++)
          i == 2
              ? NavigationDestination(
                  icon: Container(
                    width: 46,
                    height: 32,
                    decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(16)),
                    child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 20),
                  ),
                  label: items[i].$3,
                )
              : NavigationDestination(
                  icon: Icon(items[i].$1),
                  selectedIcon: Icon(items[i].$2),
                  label: items[i].$3,
                ),
      ],
      onDestinationSelected: (index) {
        Ds.tap();
        ref.read(homeTabIndexProvider.notifier).update(index);
      },
    );
  }
}
