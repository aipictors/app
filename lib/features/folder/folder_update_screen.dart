import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フォルダ・編集
class FolderUpdateScreen extends HookConsumerWidget {
  const FolderUpdateScreen({
    super.key,
    required this.folderId,
  });

  final String folderId;

  @override
  Widget build(context, ref) {
    return const Scaffold();
  }
}
