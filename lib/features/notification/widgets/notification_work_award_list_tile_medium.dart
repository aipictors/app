import 'package:aipictors/features/notification/widgets/__generated__/notification_work_award_list_tile.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_deleted_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_medium.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkAwardListTileMedium extends HookConsumerWidget {
  const NotificationWorkAwardListTileMedium({
    super.key,
    required this.notification,
  });

  final GNotificationWorkAwardListTile notification;

  @override
  Widget build(context, ref) {
    if (notification.message == null) {
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
      leading: Icon(
        Icons.emoji_events_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      trailing: (notification.work != null)
          ? NotificationWorkMedium(work: notification.work)
          : null,
      title: Text(
        notification.message!,
        maxLines: 5,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
