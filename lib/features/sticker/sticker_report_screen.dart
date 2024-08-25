import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/config.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/report/report_screen.dart';
import 'package:aipictors/features/sticker/functions/report_sticker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スタンプの報告
class StickerReportScreen extends HookConsumerWidget {
  const StickerReportScreen({
    super.key,
    required this.stickerId,
  });

  final String stickerId;

  @override
  Widget build(context, ref) {
    return ReportScreen(
      title: 'スタンプの報告'.i18n,
      onSubmit: (GReportReason reason, String comment) {
        onReport(context, reason, comment);
      },
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason, String comment) async {
    FirebaseAnalytics.instance.logEvent(
      name: DefaultConfig.customEvent['report_sticker'],
    );
    //todo: graphql側にコメント機能を追加する
    reportSticker((builder) {
      return builder
        ..vars.input.stickerId = stickerId
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
