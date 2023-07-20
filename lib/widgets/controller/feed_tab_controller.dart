import 'package:aipictors/providers/feed_tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード
class FeedTabController extends HookConsumerWidget {
  const FeedTabController({
    Key? key,
    required this.child,
    required this.length,
  }) : super(key: key);

  final Widget child;

  final int length;

  @override
  Widget build(context, ref) {
    final tabIndex = ref.watch(feedTabIndexProvider);

    const tabSize = 4;

    return DefaultTabController(
      initialIndex: tabIndex.value,
      length: tabSize,
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() {
          tabIndex.value = controller.index;
        });
        return child;
      }),
    );
  }
}
