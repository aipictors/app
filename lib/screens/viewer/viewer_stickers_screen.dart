import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 投稿したスタンプ
class ViewerStickersScreen extends HookConsumerWidget {
  const ViewerStickersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('スタンプ'.i18n),
      ),
    );
  }
}
