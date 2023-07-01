import 'package:aipictors/providers/config_provider.dart';
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
    final config = ref.watch(configProvider);

    return AlertDialog(
      title: const Text('ディスコへの招待'),
      content: Text(config.messageAboutDiscord),
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
