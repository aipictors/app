import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/viewer/widgets/__generated__/my_work_list_tile.data.gql.dart';
import 'package:aipictors/utils/to_readable_number.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyWorkListTile extends HookConsumerWidget {
  const MyWorkListTile({
    super.key,
    required this.work,
  });

  final GMyWorkListTile work;

  @override
  Widget build(context, ref) {
    return ListTile(
      leading: ListTileImage(thumbnailImageURL: work.largeThumbnailImageURL),
      title:
          Text(work.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'いいね _LIKES_COUNT_件'.i18n.replaceAllMapped(
                  RegExp(r'_LIKES_COUNT_'),
                  (match) => toReadableNumber(work.likesCount),
                ),
            style: TextStyle(color: Theme.of(context).dividerColor),
          ),
          const SizedBox(width: 12),
          Text(
            'コメント _COMMENTS_COUNT_件'.i18n.replaceAllMapped(
                  RegExp(r'_COMMENTS_COUNT_'),
                  (match) => toReadableNumber(work.commentsCount),
                ),
            style: TextStyle(color: Theme.of(context).dividerColor),
          ),
          const SizedBox(width: 12),
        ],
      ),
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: work.id,
        );
        context.push('/works/${work.id}');
      },
    );
  }
}
