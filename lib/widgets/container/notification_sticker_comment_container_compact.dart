import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationStickerCommentContainerCompact extends HookConsumerWidget {
  const NotificationStickerCommentContainerCompact({
    Key? key,
    required this.stickerImageURL,
    required this.workImageURL,
  }) : super(key: key);

  final String? stickerImageURL;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    if (stickerImageURL == null || workImageURL == null) {
      return const SizedBox();
    }

    return Row(
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
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              workImageURL!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 80,
            ),
          ),
        ),
      ],
    );
  }
}
