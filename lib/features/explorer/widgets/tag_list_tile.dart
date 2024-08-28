import 'package:aipictors/features/explorer/widgets/__generated__/tag_list_tile.data.gql.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagListTile extends HookConsumerWidget {
  const TagListTile({
    super.key,
    required this.tag,
  });

  final GTagListTileFragment tag;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 0,
        bottom: 0,
      ),
      title: Text(
        tag.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Container(),
      trailing: ListTileImage(
        thumbnailImageURL: tag.firstWork?.smallThumbnailImageURL,
      ),
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'tag',
          itemId: tag.name,
        );
        context.push('/tags/${tag.name}');
      },
    );
  }
}
