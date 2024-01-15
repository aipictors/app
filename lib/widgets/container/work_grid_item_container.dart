import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkGridItemContainer extends HookConsumerWidget {
  const WorkGridItemContainer({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  final String? imageUrl;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    return InkWell(
      onTap: onTap,
      child: GridWorkImage(imageURL: imageUrl),
    );
  }
}
