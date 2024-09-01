import 'package:aipictors/features/post/widgets/selectable_comment_sticker.dart';
import 'package:aipictors/features/sticker/__generated__/user_stickers.req.gql.dart';
import 'package:aipictors/features/sticker/widgets/stickers_header_container.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/my_bookmarked_stickers_for_comment_provider.dart';
import 'package:aipictors/providers/my_bookmarked_stickers_for_reply_provider.dart';
import 'package:aipictors/providers/stickers_container_cross_axis_count_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkActionStickerList extends HookConsumerWidget {
  const WorkActionStickerList({
    super.key,
    required this.onChange,
    required this.stickerId,
    this.isReply,
  });

  final void Function(String? stickerId) onChange;

  final String? stickerId;

  final bool? isReply;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final config = ref.watch(configProvider);

    final crossAxisCount = ref.watch(stickersContainerCrossAxisCountProvider);

    final searchText = useState('');

    final myBookmarkedStickers = useState<List>([]);

    if (isReply == true) {
      ref.watch(myBookmarkedStickersForReplyProvider.future).then((value) {
        if (value?.viewer?.bookmarkedStickers != null) {
          myBookmarkedStickers.value =
              value!.viewer!.bookmarkedStickers.toList();
        }
      });
    } else {
      ref.watch(myBookmarkedStickersForCommentProvider.future).then((value) {
        if (value?.viewer?.bookmarkedStickers != null) {
          myBookmarkedStickers.value =
              value!.viewer!.bookmarkedStickers.toList();
        }
      });
    }

    if (client.value == null) {
      return const LoadingProgress();
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OperationBuilder(
            client: client.value!,
            operationRequest: GUserStickersReq((builder) {
              builder
                ..vars.limit = config.graphqlQueryLimit
                ..vars.offset = 0;
            }),
            builder: (context, response) {
              final stickerList = response.data?.viewer?.userStickers;
              if (stickerList == null) {
                return Container();
              }
              final combinedList = [
                ...myBookmarkedStickers.value,
                ...stickerList.where((mySticker) => !myBookmarkedStickers.value
                    .any((bookmarkedSticker) =>
                        bookmarkedSticker.id == mySticker.id))
              ];
              final List filteredStickerList = searchText.value == ''
                  ? combinedList
                  : combinedList
                      .where((p0) => p0.title.contains(searchText.value))
                      .toList();
              return SizedBox(
                height: 256,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      StickersHeaderContainer(
                        currentSize: crossAxisCount,
                        maxItems: 10,
                        onSubmit: (String text) async {
                          searchText.value = text;
                        },
                        onSizeChanged: (int size) {
                          final notifier = ref.read(
                            stickersContainerCrossAxisCountProvider.notifier,
                          );
                          notifier.update(size);
                        },
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          // スタンプを検索している場合はデフォルトスタンプを非表示にする
                          itemCount: filteredStickerList.length,
                          itemBuilder: (context, index) {
                            return SelectableCommentSticker(
                              downloadURL: filteredStickerList[index].imageUrl!,
                              isSelected:
                                  stickerId == filteredStickerList[index].id,
                              onTap: () {
                                onChange(
                                    stickerId == filteredStickerList[index].id
                                        ? null
                                        : filteredStickerList[index].id);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
