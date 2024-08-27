import 'package:aipictors/features/notification/widgets/__generated__/notification_liked_works_summary_list_tile.data.gql.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikedWorksSummaryListTileCompact extends HookConsumerWidget {
  const NotificationLikedWorksSummaryListTileCompact({
    super.key,
    required this.notification,
  });

  final GNotificationLikedWorksSummaryListTile notification;

  @override
  Widget build(context, ref) {
    return ListTile(
      leading: Icon(
        Icons.favorite_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        notification.message!,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
