import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///  投稿したフォルダの一覧
class ViewerFoldersScreen extends HookConsumerWidget {
  const ViewerFoldersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('シリーズ'.i18n),
      ),
    );
  }
}
