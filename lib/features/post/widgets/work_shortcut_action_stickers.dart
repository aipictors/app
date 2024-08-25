import 'package:aipictors/features/post/widgets/comment_sticker_image.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkShortcutActionStickers extends HookConsumerWidget {
  const WorkShortcutActionStickers({
    super.key,
    required this.onSend,
  });

  final Future<void> Function(String? stickerId) onSend;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final inProgressStickerId = useState<String?>(null);

    if (client.value == null) {
      return const LoadingProgress();
    }

    //todo: graphqlから取得するように変更する
    const downloadURLs = [
      'https://files.aipictors.com/431f3f95-a4e2-4763-a808-dffe8943d037',
      'https://files.aipictors.com/bfa27f23-e028-479d-aeae-6949df17c87c',
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
        // const SizedBox(width: 8),
        // IconButton.filledTonal(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   onPressed: () {},
        //   icon: const Icon(Icons.more_horiz_rounded),
        // ),
      ],
    );
  }
}
