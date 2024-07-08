import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/notification/widgets/list_tile/notification_deleted_list_tile.dart';
import 'package:aipictors/features/notification/widgets/list_tile/notification_work_award_list_tile_compact.dart';
import 'package:aipictors/features/notification/widgets/list_tile/notification_work_award_list_tile_medium.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkAwardListTile extends HookConsumerWidget {
  const NotificationWorkAwardListTile({
    super.key,
    required this.createdAt,
    required this.message,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
  });

  final int createdAt;

  final String? message;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final layout =
        Layout.fromWidthAndConfig(MediaQuery.of(context).size.width, config);

    if (workId == null && message == null) {
      return const NotificationDeletedListTile();
    }

    if (layout == Layout.medium) {
      return NotificationWorkAwardListTileMedium(
        createdAt: createdAt,
        message: message ?? '-',
        workId: workId,
        workTitle: workTitle,
        workImageURL: workImageURL,
      );
    }

    return NotificationWorkAwardListTileCompact(
      createdAt: createdAt,
      message: message ?? '-',
      workId: workId,
      workTitle: workTitle,
      workImageURL: workImageURL,
    );
  }
}
