import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// チュートリアル
/// 利用規約に同意していない場合はこのページが表示される
class TutorialScreen extends HookConsumerWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(context, ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('このアプリを利用するには利用規約とプライバシーポリシーに同意する必要があります。'.i18n),
            FilledButton(
              child: Text('同意する'.i18n),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
