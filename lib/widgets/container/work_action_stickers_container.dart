import 'package:aipictors/graphql/__generated__/user_stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/stickers_container_cross_axis_count_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/button/adjust_sticker_size_button.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/selectable_comment_sticker_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkActionStickersContainer extends HookConsumerWidget {
  const WorkActionStickersContainer({
    super.key,
    required this.onChange,
    required this.stickerId,
  });

  final void Function(String? stickerId) onChange;

  final String? stickerId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final config = ref.watch(configProvider);

    final crossAxisCount = ref.watch(stickersContainerCrossAxisCountProvider);

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AdjustStickerSizeButton(
                            currentSize: crossAxisCount,
                            maxItems: 10,
                            onSizeChanged: (int size) async {
                              final notifier = ref.read(
                                  stickersContainerCrossAxisCountProvider
                                      .notifier);
                              notifier.update(size);
                            },
                          ),
                        ],
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
                          itemCount: (stickerList?.length ?? 0) + 5,
                          itemBuilder: (context, index) {
                            // デフォルトスタンプは画像をdownloadURLsから取得する
                            if (index < 5) {
                              return SelectableCommentStickerContainer(
                                downloadURL: downloadURLs[index],
                                isSelected: stickerId == index.toString(),
                                onTap: () {
                                  onChange(stickerId == index.toString()
                                      ? null
                                      : index.toString());
                                },
                              );
                            }
                            // ユーザースタンプ
                            return SelectableCommentStickerContainer(
                              downloadURL:
                                  stickerList![index - 5].image!.downloadURL,
                              isSelected:
                                  stickerId == stickerList[index - 5].id,
                              onTap: () {
                                onChange(stickerId == stickerList[index - 5].id
                                    ? null
                                    : stickerList[index - 5].id);
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
