import 'package:aipictors/providers/stickers_tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タブ・スタンプ
class StickersTabController extends HookConsumerWidget {
  const StickersTabController({
    super.key,
    required this.child,
    required this.length,
  });

  final Widget child;

  final int length;

  @override
  Widget build(context, ref) {
    final tabIndex = ref.watch(stickersTabIndexProvider);

    const tabSize = 2;

    return DefaultTabController(
      initialIndex: tabIndex,
      length: tabSize,
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() {
          final notifier = ref.read(stickersTabIndexProvider.notifier);
          notifier.update(controller.index);
        });
        return child;
      }),
    );
  }
}
