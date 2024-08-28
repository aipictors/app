import 'package:aipictors/features/notification/widgets/__generated__/notification_work_comment_reply_list_tile.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_sticker_comment.dart';
import 'package:aipictors/features/notification/widgets/notification_user_profile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_compact.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkCommentReplyListTileCompact extends HookConsumerWidget {
  const NotificationWorkCommentReplyListTileCompact({
    super.key,
    required this.notification,
  });

  final GNotificationWorkCommentReplyListTile notification;

  @override
  Widget build(context, ref) {
    // ステッカー付きのコメント
    if (notification.sticker != null) {
      return ListTile(
        onTap: () {
          if (notification.work?.id == null) return;
          FirebaseAnalytics.instance.logSelectContent(
            contentType: 'work',
            itemId: notification.work!.id,
          );
          context.push('/works/${notification.work!.id}');
        },
        leading: const Icon(Icons.call_missed_outgoing_rounded),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                FirebaseAnalytics.instance.logSelectContent(
                  contentType: 'user',
                  itemId: notification.user!.id,
                );
                context.push('/users/${notification.user!.id}');
              },
              child: NotificationUserProfile(user: notification.user),
            ),
            const SizedBox(height: 8),
            if (notification.message != null)
              Text(
                notification.message!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            if (notification.message != null) const SizedBox(height: 8),
            NotificationStickerComment(
              stickerImageURL: notification.sticker!.imageUrl,
              workImageURL: notification.work!.largeThumbnailImageURL,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  notification.work!.title,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return ListTile(
      onTap: () {
        if (notification.work?.id == null) return;
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: notification.work!.id,
        );
        context.push('/works/${notification.work?.id}');
      },
      leading: const Icon(Icons.call_missed_outgoing_rounded),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NotificationUserProfile(user: notification.user),
          const SizedBox(height: 8),
          if (notification.message != null)
            Text(
              notification.message!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (notification.message != null) const SizedBox(height: 8),
          NotificationWorkCompact(work: notification.work),
        ],
      ),
    );
  }
}
