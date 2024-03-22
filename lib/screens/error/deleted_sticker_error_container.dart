import 'package:aipictors/widgets/container/error/deleted_sticker_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 削除された作品
class DeletedStickerErrorScreen extends HookConsumerWidget {
  const DeletedStickerErrorScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const DeletedStickerErrorContainer(),
    );
  }
}
