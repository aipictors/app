import 'package:aipictors/widgets/container/sticker_status_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerCard extends HookConsumerWidget {
  const StickerCard({
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
    return InkWell(
      onTap: onTap,
      child: Card.outlined(
        margin: const EdgeInsets.all(0),
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
            const SizedBox(height: 4 * 1.5),
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
            StickerStatusContainer(
                downloadsCount: downloadsCount, usesCount: usesCount),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
