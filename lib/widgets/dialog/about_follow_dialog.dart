import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フォローに関するダイアログ
class AboutFollowDialog extends HookConsumerWidget {
  const AboutFollowDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: const Text('フォローしたいね！'),
      content: const Text('ログインしてユーザをフォローしよう。フォローすれば新しい投稿にもすぐに気付けます。'),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('やめる'),
        ),
        FilledButton.tonal(
          onPressed: onAccept,
          child: const Text('ログイン'),
        ),
      ],
    );
  }
}
