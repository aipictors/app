import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeletedStickerErrorContainer extends HookConsumerWidget {
  const DeletedStickerErrorContainer({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(context, ref) {
    return Center(
      child: Text(
        message ?? 'スタンプが削除されました。'.i18n,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
