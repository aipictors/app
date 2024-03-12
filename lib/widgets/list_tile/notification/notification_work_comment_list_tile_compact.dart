import 'package:aipictors/widgets/container/notification_image_container_compact.dart';
import 'package:aipictors/widgets/container/notification_sticker_comment_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkCommentListTileCompact extends HookConsumerWidget {
  const NotificationWorkCommentListTileCompact({
    super.key,
    required this.createdAt,
    required this.message,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.stickerImageURL,
  });

  final int createdAt;

  final String? message;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  final String? stickerImageURL;

  @override
  Widget build(context, ref) {
    // ステッカー付きのコメント
    if (stickerImageURL != null) {
      return ListTile(
        onTap: () {
          if (workId == null) return;
          FirebaseAnalytics.instance.logSelectContent(
            contentType: 'work',
            itemId: workId!,
          );
          context.push('/works/$workId');
        },
        leading: const Icon(Icons.chat_bubble_rounded),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                context.push('/users/$userId');
              },
              child: NotificationUserContainer(
                userName: userName,
                userIconImageURL: userIconImageURL,
              ),
            ),
            const SizedBox(height: 8),
            if (message != null)
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            if (message != null) const SizedBox(height: 8),
            NotificationStickerCommentContainer(
              stickerImageURL: stickerImageURL,
              workImageURL: workImageURL,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  workTitle!,
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
        if (workId == null) return;
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: workId!,
        );
        context.push('/works/$workId');
      },
      leading: const Icon(Icons.chat_bubble_rounded),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NotificationUserContainer(
            userName: userName,
            userIconImageURL: userIconImageURL,
          ),
          const SizedBox(height: 8),
          if (message != null)
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (message != null) const SizedBox(height: 8),
          NotificationImageContainerCompact(
            workImageURL: workImageURL,
            workTitle: workTitle,
          ),
        ],
      ),
    );
  }
}
