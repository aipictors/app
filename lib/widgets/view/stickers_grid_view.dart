import 'package:aipictors/widgets/container/sticker_grid_item_container.dart';
import 'package:built_collection/built_collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickersGridView extends HookConsumerWidget {
  const StickersGridView({
    super.key,
    required this.stickerList,
    required this.crossAxisCount,
    this.physics,
  });

  final BuiltList stickerList;

  final int crossAxisCount;

  final ScrollPhysics? physics;

  @override
  Widget build(context, ref) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.725,
      ),
      physics: (physics != null) ? physics : const ClampingScrollPhysics(),
      itemCount: stickerList.length,
      itemBuilder: (context, index) {
        final sticker = stickerList[index];
        return StickerGridItemContainer(
          title: sticker.title,
          imageUrl: sticker.image!.downloadURL,
          downloadsCount: sticker.downloadsCount,
          usesCount: sticker.usesCount,
          onTap: () {
            FirebaseAnalytics.instance.logSelectContent(
              contentType: 'sticker',
              itemId: sticker.id,
            );
            context.push('/stickers/${sticker.id}');
          },
        );
      },
    );
  }
}
