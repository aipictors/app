import 'package:aipictors/providers/generation_tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タブ・生成
class GenerationTabController extends HookConsumerWidget {
  const GenerationTabController({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(context, ref) {
    final tabIndex = ref.watch(generationTabIndexProvider);

    const tabSize = 2;

    return DefaultTabController(
      initialIndex: tabIndex,
      length: tabSize,
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() {
          final notifier = ref.read(generationTabIndexProvider.notifier);
          notifier.update(controller.index);
        });
        return child;
      }),
    );
  }
}
