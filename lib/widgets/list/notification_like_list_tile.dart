import 'package:aipictors/widgets/list/notification_like_list_tile_compact.dart';
import 'package:aipictors/widgets/list/notification_like_list_tile_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikeListTile extends HookConsumerWidget {
  const NotificationLikeListTile({
    Key? key,
    required this.createdAt,
    required this.message,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
  }) : super(key: key);

  final int createdAt;

  final String message;

  final String? workId;

  final String? workTitle;

  final String? workImageURL;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    if (MediaQuery.of(context).size.width >= 600) {
      return NotificationLikeListTileMedium(
        createdAt: createdAt,
        message: message,
        workId: workId,
        workTitle: workTitle,
        workImageURL: workImageURL,
        userId: userId,
        userName: userName,
        userIconImageURL: userIconImageURL,
      );
    }
    return NotificationLikeListTileCompact(
      createdAt: createdAt,
      message: message,
      workId: workId,
      workTitle: workTitle,
      workImageURL: workImageURL,
      userId: userId,
      userName: userName,
      userIconImageURL: userIconImageURL,
    );
  }
}
