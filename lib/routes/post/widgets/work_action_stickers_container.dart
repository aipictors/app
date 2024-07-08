import 'package:aipictors/graphql/__generated__/user_stickers.data.gql.dart';
import 'package:aipictors/graphql/__generated__/user_stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/stickers_container_cross_axis_count_provider.dart';
import 'package:aipictors/routes/post/widgets/selectable_comment_sticker_container.dart';
import 'package:aipictors/routes/sticker/widgets/stickers_header_container.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final searchText = useState('');

    int defaultStickersCount = 5;

    if (client.value == null) {
      return const LoadingProgress();
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
              if (stickerList == null) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      // デフォルトスタンプは画像をdownloadURLsから取得する
                      return SelectableCommentStickerContainer(
                        downloadURL: downloadURLs[index],
                        isSelected: stickerId == index.toString(),
                        onTap: () {
                          onChange(stickerId == index.toString()
                              ? null
                              : index.toString());
                        },
                      );
                    });
              }
              BuiltList<GUserStickersData_viewer_userStickers>
                  filteredStickerList = stickerList
                      .where((p0) => p0.title.contains(searchText.value))
                      .toBuiltList();
              if (searchText.value == '') {
                filteredStickerList = stickerList;
                defaultStickersCount = downloadURLs.length;
              } else {
                defaultStickersCount = 0;
              }
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
                              stickersContainerCrossAxisCountProvider.notifier);
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
                          itemCount: searchText.value == ''
                              ? filteredStickerList.length +
                                  defaultStickersCount
                              : filteredStickerList.length,
                          itemBuilder: (context, index) {
                            // デフォルトスタンプは画像をdownloadURLsから取得する
                            if (index < defaultStickersCount &&
                                searchText.value == '') {
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
                              downloadURL: filteredStickerList[
                                      index - defaultStickersCount]
                                  .imageUrl!,
                              isSelected: stickerId ==
                                  filteredStickerList[
                                          index - defaultStickersCount]
                                      .id,
                              onTap: () {
                                onChange(stickerId ==
                                        filteredStickerList[
                                                index - defaultStickersCount]
                                            .id
                                    ? null
                                    : filteredStickerList[
                                            index - defaultStickersCount]
                                        .id);
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
