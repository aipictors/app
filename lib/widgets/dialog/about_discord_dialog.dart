import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutDiscordDialog extends HookConsumerWidget {
  const AboutDiscordDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: const Text('ディスコへの招待'),
      content:
          const Text('私たちのサーバ「Aipictors」では、製品に関する情報交換が日々行われています。ぜひ参加ください！'),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('やめる'),
        ),
        FilledButton.tonal(
          onPressed: onAccept,
          child: const Text('アプリを開く'),
        ),
      ],
    );
  }
}
