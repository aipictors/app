import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkGridView extends HookConsumerWidget {
  const WorkGridView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  final int itemCount;

  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(context, ref) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      cacheExtent: 0.0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 3,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
