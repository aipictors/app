import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/notification/widgets/list_tile/notification_work_comment_list_tile_compact.dart';
import 'package:aipictors/features/notification/widgets/list_tile/notification_work_comment_list_tile_medium.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkCommentListTile extends HookConsumerWidget {
  const NotificationWorkCommentListTile({
    super.key,
    required this.createdAt,
    required this.message,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.stickerImageURL,
  });

  final int createdAt;

  final String? message;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  final String? stickerImageURL;
  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final layout =
        Layout.fromWidthAndConfig(MediaQuery.of(context).size.width, config);

    if (layout == Layout.medium) {
      return NotificationWorkCommentListTileMedium(
        createdAt: createdAt,
        message: message,
        userId: userId,
        userName: userName,
        userIconImageURL: userIconImageURL,
        workId: workId,
        workTitle: workTitle,
        workImageURL: workImageURL,
        stickerImageURL: stickerImageURL,
      );
    }

    return NotificationWorkCommentListTileCompact(
      createdAt: createdAt,
      message: message,
      userId: userId,
      userName: userName,
      userIconImageURL: userIconImageURL,
      workId: workId,
      workTitle: workTitle,
      workImageURL: workImageURL,
      stickerImageURL: stickerImageURL,
    );
  }
}
