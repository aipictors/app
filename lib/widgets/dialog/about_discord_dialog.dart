import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutDiscordDialog extends HookConsumerWidget {
  const AboutDiscordDialog({
    super.key,
    required this.onAccept,
    required this.onCancel,
  });

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return AlertDialog(
      title: Text('ディスコへの招待'.i18n),
      content: Text(config.messageAboutDiscord),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
        FilledButton.tonal(
          onPressed: onAccept,
          child: Text('アプリを開く'.i18n),
        ),
      ],
    );
  }
}
