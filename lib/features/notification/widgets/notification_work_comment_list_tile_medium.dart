import 'package:aipictors/features/notification/widgets/__generated__/notification_work_comment_list_tile.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_user_profile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_medium.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkCommentListTileMedium extends HookConsumerWidget {
  const NotificationWorkCommentListTileMedium({
    super.key,
    required this.notification,
  });

  final GNotificationWorkCommentListTile notification;

  @override
  Widget build(context, ref) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 0,
        bottom: 0,
      ),
      onTap: () {
        if (notification.work?.id == null) return;
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: notification.work!.id,
        );
        context.push('/works/${notification.work!.id}');
      },
      onLongPress: () {
        if (notification.user?.id == null) return;
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'userId',
          itemId: notification.user!.id,
        );
        context.push('/users/${notification.user!.id}');
      },
      leading: const Icon(Icons.chat_bubble_rounded),
      trailing: NotificationWorkMedium(work: notification.work),
      title: NotificationUserProfile(user: notification.user),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (notification.message != null)
            Text(
              notification.message!,
              maxLines: 5,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (notification.message != null) const SizedBox(height: 8),
          if (notification.sticker?.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: notification.sticker!.imageUrl!,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
        ],
      ),
    );
  }
}
