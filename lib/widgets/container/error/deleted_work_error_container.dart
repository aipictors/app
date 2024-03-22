import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeletedWorkErrorContainer extends HookConsumerWidget {
  const DeletedWorkErrorContainer({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(context, ref) {
    return Center(
      child: Text(
        message ?? '作品が削除されました。'.i18n,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
