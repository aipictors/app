import 'package:aipictors/config.dart';
import 'package:aipictors/widgets/container/notification_sticker_comment_container_compact.dart';
import 'package:aipictors/widgets/container/notification_sticker_comment_container_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationStickerCommentContainer extends HookConsumerWidget {
  const NotificationStickerCommentContainer({
    Key? key,
    required this.stickerImageURL,
    required this.workImageURL,
  }) : super(key: key);

  final String? stickerImageURL;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    if (DefaultConfig.mediumUIThreshold <= MediaQuery.of(context).size.width) {
      return NotificationStickerCommentContainerMedium(
        stickerImageURL: stickerImageURL,
        workImageURL: workImageURL,
      );
    }

    return NotificationStickerCommentContainerCompact(
      stickerImageURL: stickerImageURL,
      workImageURL: workImageURL,
    );
  }
}
