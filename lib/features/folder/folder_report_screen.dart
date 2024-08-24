import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/folder/functions/report_folder.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('フォルダの報告'.i18n),
      ),
      body: ListView(children: [
        ListTile(title: Text('該当する報告理由を選択してください。'.i18n)),
        ListTile(
          title: Text(
            '対象年齢が異なる'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('対象年齢が異なる（過度な性的表現など）'.i18n),
          onTap: () {
            onReport(context, GReportReason.AGE_MISMATCH);
          },
        ),
        ListTile(
          title: Text(
            '実写の児童ポルノの恐れがある'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('実写に見える作品で、児童ポルノと認定される恐れのある内容が含まれている'.i18n),
          onTap: () {
            onReport(context, GReportReason.CHILD_PORNOGRAPHY);
          },
        ),
        ListTile(
          title: Text(
            '商業用目的の投稿'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('商業用の広告や宣伝、勧誘を目的とする情報が含まれている'.i18n),
          onTap: () {
            onReport(context, GReportReason.COMMERCIAL_CONTENT);
          },
        ),
        ListTile(
          title: Text(
            '過度なグロテスク表現'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('過度なグロテスク表現が含まれている'.i18n),
          onTap: () {
            onReport(context, GReportReason.EXCESSIVE_GORE);
          },
        ),
        ListTile(
          title: Text(
            '禁止コンテンツへの誘導'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('サイトで禁止されているコンテンツへの誘導が含まれている'.i18n),
          onTap: () {
            onReport(context, GReportReason.ILLEGAL_CONTENT);
          },
        ),
        ListTile(
          title: Text(
            'モザイク処理がされていない'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('必要なモザイク加工がされていない'.i18n),
          onTap: () {
            onReport(context, GReportReason.NO_MOSAIC);
          },
        ),
        ListTile(
          title: Text(
            'プライバシー・肖像権の侵害'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('ライバシーまたは肖像権を侵害している'.i18n),
          onTap: () {
            onReport(context, GReportReason.PRIVACY_VIOLATION);
          },
        ),
        ListTile(
          title: Text(
            'テイストが異なる'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('テイストが異なる'.i18n),
          onTap: () {
            onReport(context, GReportReason.TASTE_MISMATCH);
          },
        ),
        ListTile(
          title: Text(
            '無断転載している'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('無断転載している'.i18n),
          onTap: () {
            onReport(context, GReportReason.UNAUTHORIZED_REPOST);
          },
        ),
        ListTile(
          title: Text(
            'その他'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('その他'.i18n),
          onTap: () {
            onReport(context, GReportReason.OTHER);
          },
        ),
      ]),
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'report_folder',
    );
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
