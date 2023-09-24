import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/image/sticker_comment_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkActionStickersContainer extends HookConsumerWidget {
  const WorkActionStickersContainer({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final void Function(String? stickerId) onChange;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    const downloadURLs = [
      'https://www.aipictors.com/wp-content/uploads/2023/08/stamp_0.webp',
      'https://www.aipictors.com/wp-content/uploads/2023/08/stamp_1.webp',
      'https://www.aipictors.com/wp-content/uploads/2023/08/stamp_2.webp',
      'https://www.aipictors.com/wp-content/uploads/2023/08/stamp_3.webp',
      'https://www.aipictors.com/wp-content/uploads/2023/08/stamp_4.webp'
    ];

    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          const SizedBox(width: 16),
          StickerCommentImage(
            size: 52,
            downloadURL: downloadURLs[0],
          ),
          const SizedBox(width: 16),
          StickerCommentImage(
            size: 52,
            downloadURL: downloadURLs[1],
          ),
          const SizedBox(width: 16),
          StickerCommentImage(
            size: 52,
            downloadURL: downloadURLs[2],
          ),
          const SizedBox(width: 16),
          StickerCommentImage(
            size: 52,
            downloadURL: downloadURLs[3],
          ),
          const SizedBox(width: 16),
          StickerCommentImage(
            size: 52,
            downloadURL: downloadURLs[4],
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
