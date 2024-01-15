import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SurveyResetDialog extends HookConsumerWidget {
  const SurveyResetDialog({
    super.key,
    required this.onAccept,
    required this.onCancel,
  });

  final VoidCallback onCancel;

  final VoidCallback onAccept;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return AlertDialog(
      title: Text('リセットしますか？'.i18n),
      content: Text(config.messageSurveyReset),
      actions: [
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: onAccept,
          child: Text('削除する'.i18n),
        ),
        TextButton(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
      ],
    );
  }
}
