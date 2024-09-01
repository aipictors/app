import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/features/post/widgets/comment_sticker_image.dart';
import 'package:aipictors/features/sticker/__generated__/my_bookmarked_stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

class WorkShortcutActionStickers extends HookConsumerWidget {
  const WorkShortcutActionStickers({
    super.key,
    required this.onSend,
  });

  final Future<void> Function(String? stickerId) onSend;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    final config = ref.watch(configProvider);
    const minItems = 2;

    final inProgressStickerId = useState<String?>(null);

    if (client.value == null) {
      return const LoadingProgress();
    }

    const downloadURLs = [
      'https://files.aipictors.com/431f3f95-a4e2-4763-a808-dffe8943d037',
      'https://files.aipictors.com/bfa27f23-e028-479d-aeae-6949df17c87c',
    ];

    if (client.value == null) {
      return const LoadingProgress();
    }

    return SizedBox(
      width: 150,
      child: OperationBuilder(
        client: client.value!,
        operationRequest: GMyBookmarkedStickersReq((builder) {
          builder
            ..vars.limit = config.graphqlQueryLimit
            ..vars.offset = 0
            ..vars.type = GBookmarkedStickerType.comment;
        }),
        builder: (context, response) {
          final stickerList = response.data?.viewer?.bookmarkedStickers;
          if (stickerList == null) {
            return Container();
          }
          return ListView.builder(
            itemCount: max(minItems, stickerList.length),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              // ブックマークしたスタンプがある場合は表示する
              if (index <= stickerList.length - 1) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton.filledTonal(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: inProgressStickerId.value == null
                        ? () async {
                            inProgressStickerId.value = stickerList[index].id;
                            await onSend(stickerList[index].id);
                            inProgressStickerId.value = null;
                          }
                        : null,
                    icon: inProgressStickerId.value == stickerList[index].id
                        ? const SizedBox(
                            width: 40,
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : CommentStickerImage(
                            size: 40,
                            downloadURL: stickerList[index].imageUrl ?? '',
                          ),
                  ),
                );
              } else if (index - stickerList.length <= downloadURLs.length) {
                final stickerId = index - stickerList.length;
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton.filledTonal(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: inProgressStickerId.value == null
                        ? () async {
                            inProgressStickerId.value = stickerId.toString();
                            await onSend(stickerId.toString());
                            inProgressStickerId.value = null;
                          }
                        : null,
                    icon: inProgressStickerId.value == stickerId.toString()
                        ? const SizedBox(
                            width: 40,
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : CommentStickerImage(
                            size: 40,
                            downloadURL: downloadURLs[stickerId],
                          ),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
