import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ブックマークした作品の一覧
class ViewerBookmarkedWorksScreen extends HookConsumerWidget {
  const ViewerBookmarkedWorksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ブックマーク'.i18n),
      ),
    );
  }
}
