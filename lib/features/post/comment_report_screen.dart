import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/post/functions/report_comment.dart';
import 'package:aipictors/features/report/report_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// コメントの報告
class CommentReportScreen extends HookConsumerWidget {
  const CommentReportScreen({
    super.key,
    required this.commentId,
  });

  final String commentId;

  @override
  Widget build(context, ref) {
    return ReportScreen(
      title: 'コメントの報告'.i18n,
      onSubmit: (GReportReason reason, String comment) {
        onReport(context, reason, comment);
      },
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason, String comment) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'report_comment',
    );
    //todo: graphql側にコメント機能を追加する
    reportComment((builder) {
      return builder
        ..vars.input.commentId = commentId
        ..vars.input.reason = reason;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('報告を送信しました。'.i18n)),
      );
    context.pop();
  }
}
