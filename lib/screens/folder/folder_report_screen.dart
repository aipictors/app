import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フォルダの報告
class FolderReportScreen extends HookConsumerWidget {
  const FolderReportScreen({
    Key? key,
    required this.folderId,
  }) : super(key: key);

  final String folderId;

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('報告'.i18n),
      ),
    );
  }
}
