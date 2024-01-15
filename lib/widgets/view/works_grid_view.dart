import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorksGridView extends HookConsumerWidget {
  const WorksGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;

  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(context, ref) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
      cacheExtent: 0.0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
