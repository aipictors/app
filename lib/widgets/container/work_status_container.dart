import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkStatusContainer extends HookConsumerWidget {
  const WorkStatusContainer({
    super.key,
    required this.likesCount,
    required this.viewsCount,
  });

  final int likesCount;

  final int viewsCount;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.favorite_rounded),
              const SizedBox(width: 8),
              Text(
                likesCount.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              const Icon(Icons.visibility_rounded),
              const SizedBox(width: 8),
              Text(
                viewsCount.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
