import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_liked_work_list_tile_compact.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_liked_work_list_tile_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikedWorkListTile extends HookConsumerWidget {
  const NotificationLikedWorkListTile({
    Key? key,
    required this.createdAt,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
  }) : super(key: key);

  final int createdAt;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return LayoutBuilder(builder: (context, constraints) {
      final notCompact = Layout.fromWith(constraints.maxWidth).notCompact;
      if (config.themeMediumLayout || notCompact) {
        return NotificationLikedWorkListTileMedium(
          createdAt: createdAt,
          workId: workId,
          workTitle: workTitle,
          workImageURL: workImageURL,
          userId: userId,
          userName: userName,
          userIconImageURL: userIconImageURL,
        );
      }
      return NotificationLikedWorkListTileCompact(
        createdAt: createdAt,
        workId: workId,
        workTitle: workTitle,
        workImageURL: workImageURL,
        userId: userId,
        userName: userName,
        userIconImageURL: userIconImageURL,
      );
    });
  }
}
