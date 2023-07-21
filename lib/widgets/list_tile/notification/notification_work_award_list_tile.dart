import 'package:aipictors/config.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_work_award_list_tile_compact.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_work_award_list_tile_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkAwardListTile extends HookConsumerWidget {
  const NotificationWorkAwardListTile({
    Key? key,
    required this.createdAt,
    required this.message,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
  }) : super(key: key);

  final int createdAt;

  final String? message;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    if (DefaultConfig.mediumUIThreshold <= MediaQuery.of(context).size.width) {
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
