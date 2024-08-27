import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/notification/widgets/__generated__/notification_liked_work_list_tile.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_deleted_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_medium.dart';
import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikedWorkListTileMedium extends HookConsumerWidget {
  const NotificationLikedWorkListTileMedium({
    super.key,
    required this.notification,
  });

  final GNotificationLikedWorkListTile notification;

  @override
  Widget build(context, ref) {
    if (notification.work?.id == null) {
      return const NotificationDeletedListTile();
    }

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
          contentType: 'user',
          itemId: notification.user!.id,
        );
        context.push('/users/${notification.user!.id}');
      },
      leading: Icon(
        Icons.favorite_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      trailing: NotificationWorkMedium(work: notification.work),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (notification.user?.name == null)
            Text(
              '誰かがあなたの作品をいいねしました。'.i18n,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (notification.user?.name != null)
            Row(
              children: [
                UserProfileAvatar(imageURL: notification.user!.iconUrl),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '_USER_NAME_さんがいいねしました。'.i18n.replaceAllMapped(
                          RegExp(r'_USER_NAME_'),
                          (match) => notification.user!.name,
                        ),
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
