import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// イイネに関するダイアログ
class AboutLikeDialog extends HookConsumerWidget {
  const AboutLikeDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: Text('イイネしたいね！'.i18n),
      content: Text('ログインして作品にイイネしよう。イイネの他にもコメントやスタンプが送信できます。'.i18n),
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
