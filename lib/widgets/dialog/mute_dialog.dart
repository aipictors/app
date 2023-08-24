import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MuteDialog extends HookConsumerWidget {
  const MuteDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('このユーザーをミュートしますか？'.i18n),
      content: Text('このユーザーの投稿は表示されなくなります。\n設定画面からいつでも解除することができます。'.i18n),
      actions: [
        FilledButton.tonal(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
        TextButton(
          onPressed: onAccept,
          child: Text('ミュートする'.i18n),
        ),
      ],
    );
  }
}
