import 'package:aipictors/widgets/list/notification_reply_list_tile_compact.dart';
import 'package:aipictors/widgets/list/notification_reply_list_tile_medium.dart';
import 'package:aipictors/config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationReplyListTile extends HookConsumerWidget {
  const NotificationReplyListTile({
    Key? key,
    required this.createdAt,
    required this.message,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.stickerImageURL,
  }) : super(key: key);

  final int createdAt;

  final String message;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  final String? stickerImageURL;

  @override
  Widget build(context, ref) {
    if (MediaQuery.of(context).size.width >= DefaultConfig.mediumUIThreshold) {
      return NotificationReplyListTileMedium(
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
    return NotificationReplyListTileCompact(
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
