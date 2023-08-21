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
      title: const Text('アップデート'),
      content: const Text('新しいバージョンのアプリが存在します。ストアからアップデートすることができます。'),
      actions: [
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: onAccept,
          child: const Text('削除する'),
        ),
        TextButton(
          onPressed: onCancel,
          child: const Text('やめる'),
        ),
      ],
    );
  }
}
