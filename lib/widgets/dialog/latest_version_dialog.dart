import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LatestVersionDialog extends HookConsumerWidget {
  const LatestVersionDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('アップデート'.i18n),
      content: Text('新しいバージョンのアプリが存在します。ストアからアップデートすることができます。'.i18n),
      actions: [
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: onAccept,
          child: Text('削除する'.i18n),
        ),
        TextButton(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
      ],
    );
  }
}
