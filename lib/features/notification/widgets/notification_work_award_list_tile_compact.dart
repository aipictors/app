import 'package:aipictors/features/notification/widgets/__generated__/notification_work_award_list_tile.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_deleted_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_compact.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkAwardListTileCompact extends HookConsumerWidget {
  const NotificationWorkAwardListTileCompact({
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
      onTap: () {
        if (notification.work?.id == null) return;
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: notification.work!.id,
        );
        context.push('/works/${notification.work?.id}');
      },
      leading: Icon(
        Icons.emoji_events_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            notification.message!,
            maxLines: 5,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          if (notification.work?.id != null)
            NotificationWorkCompact(work: notification.work)
        ],
      ),
    );
  }
}
