import 'package:aipictors/providers/feed_tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タブ・フィード
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

    return DefaultTabController(
      initialIndex: tabIndex,
      length: length,
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() {
          final notifier = ref.read(feedTabIndexProvider.notifier);
          notifier.update(controller.index);
        });
        return child;
      }),
    );
  }
}
