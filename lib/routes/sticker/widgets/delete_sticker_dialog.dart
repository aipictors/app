import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteStickerDialog extends HookConsumerWidget {
  const DeleteStickerDialog({
    super.key,
    required this.onAccept,
    required this.onCancel,
  });

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('スタンプを削除しますか？'.i18n),
      content: Text(
          '他のユーザーが作成したスタンプは、公開されていれば再度マイスタンプに追加できますが、自分が作成したスタンプは完全に削除されます。'
              .i18n),
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
