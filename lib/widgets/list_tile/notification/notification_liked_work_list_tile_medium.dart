import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/avatar/user_profile_avatar.dart';
import 'package:aipictors/widgets/container/notification_image_container_medium.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_deleted_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikedWorkListTileMedium extends HookConsumerWidget {
  const NotificationLikedWorkListTileMedium({
    Key? key,
    required this.createdAt,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
  }) : super(key: key);

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
      contentPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 0,
        bottom: 0,
      ),
      onTap: () {
        if (workId == null) return;
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
      trailing: NotificationImageContainerMedium(
        workImageURL: workImageURL,
        workTitle: workTitle,
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
                Text(
                  '$userNameさんがいいねしました。',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
