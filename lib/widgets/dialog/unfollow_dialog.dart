import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UnFollowDialog extends HookConsumerWidget {
  const UnFollowDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('フォローを解除しますか？'.i18n),
      content: Text('このユーザーの投稿はフォロー中タブに表示されなくなりますが、他のページから見ることができます。'.i18n),
      actions: [
        FilledButton.tonal(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
        TextButton(
          onPressed: onAccept,
          child: Text('解除する'.i18n),
        ),
      ],
    );
  }
}
