import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/post/functions/report_work.dart';
import 'package:aipictors/features/report/report_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品の報告
class WorkReportScreen extends HookConsumerWidget {
  const WorkReportScreen({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  Widget build(context, ref) {
    return ReportScreen(
      title: '作品の報告'.i18n,
      onSubmit: (GReportReason reason, String comment) {
        onReport(context, reason, comment);
      },
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason, String comment) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'report_work',
    );
    reportWork((builder) {
      return builder
        ..vars.input.workId = workId
        ..vars.input.reason = reason
        ..vars.input.comment = comment;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('報告を送信しました。'.i18n)),
      );
    context.pop();
  }
}
