import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/report_album.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アルバムの報告
class AlbumReportScreen extends HookConsumerWidget {
  const AlbumReportScreen({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  final String albumId;

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アルバムの報告'.i18n),
      ),
      body: ListView(children: [
        ListTile(title: Text('該当する報告理由を選択してください。'.i18n)),
        ListTile(
          title: Text(
            '誹謗中傷'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('他人に誹謗中傷など嫌がらせをしている。'.i18n),
          onTap: () {
            onReport(context, GReportReason.SLANDER);
          },
        ),
        ListTile(
          title: Text(
            'スパム'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('イラストとは関係のない商品のURLなどを大量に投稿している。'.i18n),
          onTap: () {
            onReport(context, GReportReason.SPAM);
          },
        ),
      ]),
    );
  }

  /// レポートを送信する
  onReport(BuildContext context, GReportReason reason) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'report_album',
    );
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
