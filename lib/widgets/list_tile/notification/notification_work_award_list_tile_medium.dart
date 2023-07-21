import 'package:aipictors/widgets/container/notification_image_container.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_deleted_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkAwardListTileMedium extends HookConsumerWidget {
  const NotificationWorkAwardListTileMedium({
    Key? key,
    required this.createdAt,
    required this.message,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
  }) : super(key: key);

  final int createdAt;

  final String message;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    if (workId == null) {
      return const NotificationDeletedListTile();
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
      leading: Icon(
        Icons.emoji_events_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
              maxLines: 5,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          NotificationImageContainer(
            workImageURL: workImageURL,
            workTitle: workTitle,
          ),
        ],
      ),
    );
  }
}
