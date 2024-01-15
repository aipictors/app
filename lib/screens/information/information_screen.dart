import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/screens/Information/promotions_screen.dart';
import 'package:aipictors/widgets/controller/explorer_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// お知らせ
class InformationScreen extends HookConsumerWidget {
  const InformationScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return ExplorerTabController(
      //length: 2,
      length: 1,
      child: Scaffold(
        key: const PageStorageKey('explorer'),
        appBar: AppBar(
            title: Text('お知らせ'.i18n),
            bottom: TabBar(
              tabs: [
                Tab(text: 'イベント'.i18n),
                //Tab(text: 'お知らせ'.i18n),
              ],
            )),
        body: const TabBarView(children: [
          PromotionsScreen(
            key: PageStorageKey('information_promotion'),
          ),
          /*
          AnnouncementsScreen(
            key: PageStorageKey('information_announcement'),
          ),
          */
        ]),
      ),
    );
  }
}
