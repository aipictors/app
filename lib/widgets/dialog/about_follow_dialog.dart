import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フォローに関するダイアログ
class AboutFollowDialog extends HookConsumerWidget {
  const AboutFollowDialog({
    super.key,
    required this.onAccept,
    required this.onCancel,
  });

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('フォローしたいね！'.i18n),
      content: Text('ログインしてユーザをフォローしよう。フォローすれば新しい投稿にもすぐに気付けます。'.i18n),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
        FilledButton.tonal(
          onPressed: onAccept,
          child: Text('ログイン'.i18n),
        ),
      ],
    );
  }
}
