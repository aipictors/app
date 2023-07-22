import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/providers/config_provider.dart';
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
    final config = ref.watch(configProvider);

    final layout = Layout.fromWith(MediaQuery.of(context).size.width);

    if (config.themeMediumLayout || layout.notCompact) {
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
