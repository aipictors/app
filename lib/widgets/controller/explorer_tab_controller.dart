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

    const tabSize = 4;

    return DefaultTabController(
      initialIndex: tabIndex,
      length: tabSize,
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
