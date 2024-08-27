import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/notification/widgets/__generated__/notification_work.data.gql.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkCompact extends HookConsumerWidget {
  const NotificationWorkCompact({
    super.key,
    required this.work,
  });

  final GNotificationWork? work;

  @override
  Widget build(context, ref) {
    if (work == null) {
      return Text(
        'この作品は削除されました。'.i18n,
        style: Theme.of(context).textTheme.labelMedium,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: work!.largeThumbnailImageURL,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 80,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              work!.title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
