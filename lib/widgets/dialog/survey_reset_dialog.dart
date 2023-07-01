import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SurveyResetDialog extends HookConsumerWidget {
  const SurveyResetDialog({
    Key? key,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return AlertDialog(
      title: const Text('リセットしますか？'),
      content: Text(config.messageSurveyReset),
      actions: [
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: onAccept,
          child: const Text('削除する'),
        ),
        TextButton(
          onPressed: onCancel,
          child: const Text('やめる'),
        ),
      ],
    );
  }
}
