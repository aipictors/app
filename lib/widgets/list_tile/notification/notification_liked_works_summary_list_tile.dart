import 'package:aipictors/config.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_liked_works_summary_list_tile_compact.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_liked_works_summary_list_tile_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikedWorksSummaryListTile extends HookConsumerWidget {
  const NotificationLikedWorksSummaryListTile({
    Key? key,
    required this.createdAt,
    required this.message,
  }) : super(key: key);

  final int createdAt;

  final String? message;

  @override
  Widget build(context, ref) {
    if (DefaultConfig.mediumUIThreshold <= MediaQuery.of(context).size.width) {
      return NotificationLikedWorksSummaryListTileMedium(
        createdAt: createdAt,
        message: message ?? '-',
      );
    }

    return NotificationLikedWorksSummaryListTileCompact(
      createdAt: createdAt,
      message: message ?? '-',
    );
  }
}
