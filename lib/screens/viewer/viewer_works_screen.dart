import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///  投稿した作品
class ViewerWorksScreen extends HookConsumerWidget {
  const ViewerWorksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('作品'.i18n),
      ),
    );
  }
}
