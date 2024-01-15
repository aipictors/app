import 'package:aipictors/widgets/container/notification_image_container_medium.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkAwardListTileMedium extends HookConsumerWidget {
  const NotificationWorkAwardListTileMedium({
    super.key,
    required this.createdAt,
    required this.message,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
  });

  final int createdAt;

  final String message;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

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
      leading: Icon(
        Icons.emoji_events_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      trailing: (workId != null)
          ? NotificationImageContainerMedium(
              workImageURL: workImageURL,
              workTitle: workTitle,
            )
          : null,
      title: Text(
        message,
        maxLines: 5,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
