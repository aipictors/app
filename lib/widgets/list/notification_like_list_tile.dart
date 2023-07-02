import 'package:aipictors/widgets/container/notification_image_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikeListTile extends HookConsumerWidget {
  const NotificationLikeListTile({
    Key? key,
    required this.createdAt,
    required this.message,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
  }) : super(key: key);

  final int createdAt;

  final String message;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    // ユーザによるいいね
    if (workId != null && userId != null) {
      return ListTile(
        onTap: () {
          context.push('/works/$workId');
        },
        leading: Icon(
          Icons.favorite_rounded,
          color: Theme.of(context).colorScheme.error,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NotificationUserContainer(
              userName: userName!,
              userIconImageURL: userIconImageURL,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            NotificationImageContainer(
              workImageURL: workImageURL!,
              workTitle: workTitle!,
            ),
          ],
        ),
      );
    }

    // いいねの集計
    if (workId != null && userId == null) {
      return ListTile(
        onTap: () {
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
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            NotificationImageContainer(
              workImageURL: workImageURL!,
              workTitle: workTitle!,
            ),
          ],
        ),
      );
    }

    return ListTile(
      leading: Icon(
        Icons.favorite_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
