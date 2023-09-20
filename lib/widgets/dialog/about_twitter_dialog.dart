import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
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
    final config = ref.watch(configProvider);

    return AlertDialog(
      title: const Text('Twitter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(config.messageAboutTwitter),
          const SizedBox(height: 16),
          FilledButton.tonal(
            style: FilledButton.styleFrom(
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
            style: FilledButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onOpenPrompton,
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
          child: Text('閉じる'.i18n),
        ),
      ],
    );
  }
}
