import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutDialog extends HookConsumerWidget {
  const LogoutDialog({
    super.key,
    required this.onAccept,
    required this.onCancel,
  });

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('ログアウトしますか？'.i18n),
      actions: [
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: onAccept,
          child: Text('ログアウト'.i18n),
        ),
        TextButton(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
      ],
    );
  }
}
