import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/report/report_screen.dart';
import 'package:aipictors/features/user/functions/report_user.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ユーザの報告
class UserReportScreen extends HookConsumerWidget {
  const UserReportScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(context, ref) {
    return ReportScreen(
      title: 'ユーザーの報告'.i18n,
      onSubmit: (GReportReason reason, String comment) {
        onReport(context, reason, comment);
      },
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason, String comment) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'report_user',
    );
    reportUser((builder) {
      return builder
        ..vars.input.userId = userId
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
