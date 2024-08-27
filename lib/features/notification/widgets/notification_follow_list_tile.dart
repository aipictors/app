import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/notification/widgets/__generated__/notification_follow_list_tile.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_deleted_list_tile.dart';
import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationFollowListTile extends HookConsumerWidget {
  const NotificationFollowListTile({
    super.key,
    required this.notification,
  });

  final GNotificationFollowListTile notification;

  @override
  Widget build(context, ref) {
    if (notification.user?.id == null) {
      return const NotificationDeletedListTile();
    }

    return ListTile(
      onTap: () {
        if (notification.user?.id == null) return;
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'user',
          itemId: notification.user!.id,
        );
        context.push('/users/${notification.user!.id}');
      },
      leading: Icon(
        Icons.handshake_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Row(
        children: [
          UserProfileAvatar(imageURL: notification.user!.iconUrl),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              '_USER_NAME_さんがあなたをフォローしました。'.i18n.replaceAllMapped(
                  RegExp(r'_USER_NAME_'), (match) => notification.user!.name),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
