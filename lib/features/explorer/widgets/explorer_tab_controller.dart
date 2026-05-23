import 'package:aipictors/providers/explorer_tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タブ・探索
class ExplorerTabController extends HookConsumerWidget {
  const ExplorerTabController({
    super.key,
    required this.child,
    required this.length,
  });

  final Widget child;

  final int length;

  @override
  Widget build(context, ref) {
    final tabIndex = ref.watch(explorerTabIndexProvider);

    final safeInitialIndex = length == 0 ? 0 : tabIndex.clamp(0, length - 1);

    return DefaultTabController(
      initialIndex: safeInitialIndex,
      length: length,
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() {
          final notifier = ref.read(explorerTabIndexProvider.notifier);
          notifier.update(controller.index);
        });
        return child;
      }),
    );
  }
}
