import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/album/functions/report_album.dart';
import 'package:aipictors/features/report/report_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// シリーズの報告
class AlbumReportScreen extends HookConsumerWidget {
  const AlbumReportScreen({
    super.key,
    required this.albumId,
  });

  final String albumId;

  @override
  Widget build(context, ref) {
    return ReportScreen(
      title: 'シリーズの報告'.i18n,
      onSubmit: (GReportReason reason, String comment) {
        onReport(context, reason, comment);
      },
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason, String comment) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'report_album',
    );
    //todo: graphql側にコメント機能を追加する
    reportAlbum((builder) {
      return builder
        ..vars.input.albumId = albumId
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
