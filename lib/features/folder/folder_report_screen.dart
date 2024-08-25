import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/folder/functions/report_folder.dart';
import 'package:aipictors/features/report/report_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フォルダの報告
class FolderReportScreen extends HookConsumerWidget {
  const FolderReportScreen({
    super.key,
    required this.folderId,
  });

  final String folderId;

  @override
  Widget build(context, ref) {
    return ReportScreen(
      title: 'フォルダの報告'.i18n,
      onSubmit: (GReportReason reason, String comment) {
        onReport(context, reason, comment);
      },
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason, String comment) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'report_folder',
    );
    //todo: graphql側にコメント機能を追加する
    reportFolder((builder) {
      return builder
        ..vars.input.folderId = folderId
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
