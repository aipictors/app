import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerStatusContainer extends HookConsumerWidget {
  const StickerStatusContainer({
    super.key,
    required this.downloadsCount,
    required this.usesCount,
  });

  final int downloadsCount;

  final int usesCount;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.download_rounded),
              const SizedBox(width: 8),
              Text(
                downloadsCount.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              const Icon(Icons.pets_rounded),
              const SizedBox(width: 8),
              Text(
                usesCount.toString(),
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
