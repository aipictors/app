import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/selectable_comment_sticker_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkActionStickersContainer extends HookConsumerWidget {
  const WorkActionStickersContainer({
    Key? key,
    required this.onChange,
    required this.stickerId,
  }) : super(key: key);

  final void Function(String? stickerId) onChange;

  final String? stickerId;

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: GridView.count(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 5,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            SelectableCommentStickerContainer(
              downloadURL: downloadURLs[0],
              isSelected: stickerId == '0',
              onTap: () {
                onChange(stickerId == '0' ? null : '0');
              },
            ),
            SelectableCommentStickerContainer(
              downloadURL: downloadURLs[1],
              isSelected: stickerId == '1',
              onTap: () {
                onChange(stickerId == '1' ? null : '1');
              },
            ),
            SelectableCommentStickerContainer(
              downloadURL: downloadURLs[2],
              isSelected: stickerId == '2',
              onTap: () {
                onChange(stickerId == '2' ? null : '2');
              },
            ),
            SelectableCommentStickerContainer(
              downloadURL: downloadURLs[3],
              isSelected: stickerId == '3',
              onTap: () {
                onChange(stickerId == '3' ? null : '3');
              },
            ),
            SelectableCommentStickerContainer(
              downloadURL: downloadURLs[4],
              isSelected: stickerId == '4',
              onTap: () {
                onChange(stickerId == '4' ? null : '4');
              },
            ),
          ],
        ),
      ),
    );
  }
}
