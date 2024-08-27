import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/sticker/stickers_search_screen.dart';
import 'package:aipictors/features/sticker/widgets/stickers_tab_controller.dart';
import 'package:aipictors/features/sticker/my_stickers_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スタンプ
class StickersScreen extends HookConsumerWidget {
  const StickersScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return StickersTabController(
      length: 2,
      child: Scaffold(
        key: const PageStorageKey('stickers'),
        appBar: AppBar(
          title: Text('スタンプ'.i18n),
          bottom: TabBar(
            // isScrollable: true,
            tabs: [
              Tab(text: 'スタンプ広場'.i18n),
              Tab(text: 'マイスタンプ'.i18n),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StickersSearchScreen(
              key: PageStorageKey('stickers_space'),
            ),
            MyStickersScreen(
              key: PageStorageKey('viewer_stickers'),
            )
          ],
        ),
      ),
    );
  }
}
