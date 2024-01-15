import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/avatar/user_profile_avatar.dart';
import 'package:aipictors/widgets/container/notification_image_container_compact.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_deleted_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikedWorkListTileCompact extends HookConsumerWidget {
  const NotificationLikedWorkListTileCompact({
    super.key,
    required this.createdAt,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
  });

  final int createdAt;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    if (workId == null) {
      return const NotificationDeletedListTile();
    }

    return ListTile(
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: workId!,
        );
        context.push('/works/$workId');
      },
      leading: Icon(
        Icons.favorite_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (userName == null)
            Text(
              '誰かがあなたの作品をいいねしました。'.i18n,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (userName != null)
            Row(
              children: [
                UserProfileAvatar(imageURL: userIconImageURL),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    '_USER_NAME_さんがいいねしました。'.i18n.replaceAllMapped(
                        RegExp(r'_USER_NAME_'), (match) => userName!),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 8),
          NotificationImageContainerCompact(
            workImageURL: workImageURL,
            workTitle: workTitle,
          ),
        ],
      ),
    );
  }
}
