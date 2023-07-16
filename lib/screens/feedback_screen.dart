import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィードバック
class FeedbackScreen extends HookConsumerWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text('フィードバック'.i18n)),
      body: Container(),
    );
  }
}
