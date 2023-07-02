import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutDialog extends HookConsumerWidget {
  const LogoutDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: const Text('ログアウトしますか？'),
      actions: [
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: onAccept,
          child: const Text('ログアウト'),
        ),
        TextButton(
          onPressed: onCancel,
          child: const Text('やめる'),
        ),
      ],
    );
  }
}
