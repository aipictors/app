import 'package:aipictors/features/sticker/widgets/__generated__/sticker_card.data.gql.dart';
import 'package:aipictors/features/sticker/widgets/sticker_status.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerCard extends HookConsumerWidget {
  const StickerCard({
    super.key,
    required this.sticker,
    required this.onTap,
  });

  final GStickerCard sticker;

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
                imageUrl: sticker.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4 * 1.5),
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    sticker.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            const Spacer(),
            StickerStatus(sticker: sticker),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
