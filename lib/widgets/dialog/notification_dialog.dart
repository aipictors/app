import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationDialog extends HookConsumerWidget {
  const NotificationDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onClose,
  }) : super(key: key);

  final String? title;

  final String? description;

  final VoidCallback onClose;

  @override
  Widget build(context, ref) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: description != null ? Text(description!) : null,
      actions: [
        FilledButton.tonal(
          onPressed: onClose,
          child: Text('閉じる'.i18n),
        ),
      ],
    );
  }
}
