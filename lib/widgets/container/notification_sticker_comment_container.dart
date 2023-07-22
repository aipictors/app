import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/providers/config_provider.dart';
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
    final config = ref.watch(configProvider);

    return LayoutBuilder(builder: (context, constraints) {
      final notCompact = Layout.fromWith(constraints.maxWidth).notCompact;
      if (config.themeMediumLayout || notCompact) {
        return NotificationStickerCommentContainerMedium(
          stickerImageURL: stickerImageURL,
          workImageURL: workImageURL,
        );
      }
      return NotificationStickerCommentContainerCompact(
        stickerImageURL: stickerImageURL,
        workImageURL: workImageURL,
      );
    });
  }
}
