import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteImageGenerationTaskDialog extends HookConsumerWidget {
  const DeleteImageGenerationTaskDialog({
    super.key,
    required this.onAccept,
    required this.onCancel,
  });

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('生成履歴を削除しますか？'.i18n),
      content: Text('削除した履歴は復元できません。'.i18n),
      actions: [
        FilledButton.tonal(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
        TextButton(
          onPressed: onAccept,
          child: Text('削除する'.i18n),
        ),
      ],
    );
  }
}
