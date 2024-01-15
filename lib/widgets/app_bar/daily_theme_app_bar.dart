import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeAppBar extends HookConsumerWidget {
  const DailyThemeAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(context, ref) {
    return SliverAppBar(
      pinned: true,
      leading: IconButton.filledTonal(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      stretch: true,
      expandedHeight: 128,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      ),
    );
  }
}
