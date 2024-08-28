import 'package:aipictors/features/sticker/widgets/__generated__/sticker_status.data.gql.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerStatus extends HookConsumerWidget {
  const StickerStatus({
    super.key,
    required this.sticker,
  });

  final GStickerStatus sticker;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FittedBox(
        child: Row(
          children: [
            Row(
              children: [
                const Icon(Icons.download_rounded),
                const SizedBox(width: 8),
                Text(
                  sticker.downloadsCount.toString(),
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
                  sticker.usesCount.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
