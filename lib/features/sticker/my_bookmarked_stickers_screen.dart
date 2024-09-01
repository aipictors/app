import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/sticker/my_bookmarked_stickers_view.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ブックマークしたスタンプ
class MyBookmarkedStickersScreen extends HookConsumerWidget {
  const MyBookmarkedStickersScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    if (client.value == null) {
      return const LoadingProgress();
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ブックマークしたスタンプ'.i18n),
          bottom: TabBar(
            tabs: [
              Tab(text: 'コメント用'.i18n),
              Tab(text: '返信用'.i18n),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyBookmarkedStickersView(GBookmarkedStickerType.comment),
            MyBookmarkedStickersView(GBookmarkedStickerType.reply),
          ],
        ),
      ),
    );
  }
}
