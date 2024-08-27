import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/notification/widgets/__generated__/notification_work_award_list_tile.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_work_award_list_tile_compact.dart';
import 'package:aipictors/features/notification/widgets/notification_work_award_list_tile_medium.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkAwardListTile extends HookConsumerWidget {
  const NotificationWorkAwardListTile({
    super.key,
    required this.notification,
  });

  final GNotificationWorkAwardListTile notification;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final layout = Layout.fromWidthAndConfig(
      MediaQuery.of(context).size.width,
      config,
    );

    if (layout == Layout.medium) {
      return NotificationWorkAwardListTileMedium(
        notification: notification,
      );
    }

    return NotificationWorkAwardListTileCompact(
      notification: notification,
    );
  }
}
