import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutTwitterDialog extends HookConsumerWidget {
  const AboutTwitterDialog({
    Key? key,
    required this.onOpen,
    required this.onOpenPrompton,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onOpen;

  final VoidCallback onOpenPrompton;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: const Text('Twitter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'ツイッターでは、製品のアップデートや不具合に関する情報を配信しています。フォローいただけると嬉しいです！',
          ),
          const SizedBox(height: 16),
          FilledButton.tonal(
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onOpen,
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text('@aipictors'),
            ),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onOpen,
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text('@promptonio'),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('閉じる'),
        ),
      ],
    );
  }
}
