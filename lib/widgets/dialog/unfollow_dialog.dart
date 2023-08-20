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
      title: const Text('フォローを解除しますか？'),
      content: const Text('このユーザーの投稿はフォロー中タブに表示されなくなりますが、他のページから見ることができます。'),
      actions: [
        FilledButton.tonal(
          onPressed: onCancel,
          child: const Text('やめる'),
        ),
        TextButton(
          onPressed: onAccept,
          child: const Text('解除する'),
        ),
      ],
    );
  }
}
