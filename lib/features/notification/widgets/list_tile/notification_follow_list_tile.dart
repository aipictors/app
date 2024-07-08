import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/notification/widgets/list_tile/notification_deleted_list_tile.dart';
import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationFollowListTile extends HookConsumerWidget {
  const NotificationFollowListTile({
    super.key,
    required this.createdAt,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
  });

  final int createdAt;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    if (userId == null) {
      return const NotificationDeletedListTile();
    }

    return ListTile(
      onTap: () {
        if (userId == null) return;
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'user',
          itemId: userId!,
        );
        context.push('/users/$userId');
      },
      leading: Icon(
        Icons.handshake_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Row(
        children: [
          UserProfileAvatar(imageURL: userIconImageURL),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              '_USER_NAME_さんがあなたをフォローしました。'.i18n.replaceAllMapped(
                  RegExp(r'_USER_NAME_'), (match) => userName!),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
