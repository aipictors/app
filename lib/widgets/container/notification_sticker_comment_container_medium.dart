import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationStickerCommentContainerMedium extends HookConsumerWidget {
  const NotificationStickerCommentContainerMedium({
    Key? key,
    required this.stickerImageURL,
    required this.workImageURL,
  }) : super(key: key);

  final String? stickerImageURL;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            stickerImageURL!,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            workImageURL!,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
        ),
      ],
    );
  }
}
