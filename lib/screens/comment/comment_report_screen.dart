import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// コメントの報告
class CommentReportScreen extends HookConsumerWidget {
  const CommentReportScreen({
    Key? key,
    required this.commentId,
  }) : super(key: key);

  final String commentId;

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('報告'.i18n),
      ),
    );
  }
}
