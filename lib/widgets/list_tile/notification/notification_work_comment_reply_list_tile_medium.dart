import 'package:aipictors/widgets/avatar/user_profile_avatar.dart';
import 'package:aipictors/widgets/container/notification_image_container_medium.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkCommentReplyListTileMedium extends HookConsumerWidget {
  const NotificationWorkCommentReplyListTileMedium({
    Key? key,
    required this.createdAt,
    required this.message,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.stickerImageURL,
  }) : super(key: key);

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
      leading: const Icon(Icons.call_missed_outgoing_rounded),
      trailing: NotificationImageContainerMedium(
        workImageURL: workImageURL,
        workTitle: workTitle,
      ),
      title: Row(
        children: [
          UserProfileAvatar(imageURL: userIconImageURL),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              '$userNameさんがあなたに返信しました。',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (message != null)
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (message != null) const SizedBox(height: 8),
          if (stickerImageURL != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                stickerImageURL!,
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
