import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/screens/generation/generation_tasks_view.dart';
import 'package:aipictors/screens/generation/generation_view.dart';
import 'package:aipictors/widgets/controller/generation_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画像生成
class GenerationScreen extends HookConsumerWidget {
  const GenerationScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return GenerationTabController(
      child: Scaffold(
        key: const PageStorageKey('generation'),
        appBar: AppBar(
            title: Text('画像生成'.i18n),
            bottom: TabBar(
              // isScrollable: true,
              tabs: [
                Tab(text: '生成'.i18n),
                Tab(text: '履歴'.i18n),
              ],
            )),
        body: const TabBarView(children: [
          GenerationView(
            key: PageStorageKey('generation_image_generation'),
          ),
          GenerationTasksView(
            key: PageStorageKey('generation_tasks'),
          ),
        ]),
      ),
    );
  }
}
