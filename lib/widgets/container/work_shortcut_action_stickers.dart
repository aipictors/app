import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/image/comment_sticker_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkShortcutActionStickers extends HookConsumerWidget {
  const WorkShortcutActionStickers({
    Key? key,
    required this.onSend,
  }) : super(key: key);

  final Future<void> Function(String? stickerId) onSend;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final inProgressStickerId = useState<String?>(null);

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

    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        IconButton.filledTonal(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onPressed: inProgressStickerId.value == null
              ? () async {
                  inProgressStickerId.value = '0';
                  await onSend('0');
                  inProgressStickerId.value = null;
                }
              : null,
          icon: inProgressStickerId.value == '0'
              ? const SizedBox(
                  width: 40,
                  child: CircularProgressIndicator.adaptive(),
                )
              : CommentStickerImage(
                  size: 40,
                  downloadURL: downloadURLs[0],
                ),
        ),
        const SizedBox(width: 8),
        IconButton.filledTonal(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onPressed: inProgressStickerId.value == null
              ? () async {
                  inProgressStickerId.value = '1';
                  await onSend('1');
                  inProgressStickerId.value = null;
                }
              : null,
          icon: inProgressStickerId.value == '1'
              ? const SizedBox(
                  width: 40,
                  child: CircularProgressIndicator.adaptive(),
                )
              : CommentStickerImage(
                  size: 40,
                  downloadURL: downloadURLs[1],
                ),
        ),
        const SizedBox(width: 8),
        IconButton.filledTonal(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_rounded),
        ),
      ],
    );
  }
}
