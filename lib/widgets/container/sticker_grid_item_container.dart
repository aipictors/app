import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerGridItemContainer extends HookConsumerWidget {
  const StickerGridItemContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.downloadsCount,
    required this.usesCount,
    required this.onTap,
  });

  final String title;
  final String? imageUrl;

  final int downloadsCount;
  final int usesCount;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    return Card.outlined(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const SizedBox(width: 8),
              Row(
                children: [
                  const Icon(Icons.download_rounded),
                  const SizedBox(width: 4),
                  Text(downloadsCount.toString())
                ],
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  const Icon(Icons.pets_rounded),
                  const SizedBox(width: 4),
                  Text(usesCount.toString())
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
