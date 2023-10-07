import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_share_work_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class ShareWorkButton extends HookConsumerWidget {
  const ShareWorkButton({
    Key? key,
    required this.workId,
    required this.workTitle,
    required this.userName,
  }) : super(key: key);

  final String workId;
  final String workTitle;
  final String userName;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return IconButton(
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        final box = context.findRenderObject() as RenderBox;
        final text = toShareWorkText(
          workId: workId,
          workTitle: workTitle,
          userName: userName,
          hashtagText: config.xPostText,
        );
        Share.share(
          text,
          // iPadで動作させるため
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        );
      },
      icon: const Icon(Icons.share),
    );
  }
}
