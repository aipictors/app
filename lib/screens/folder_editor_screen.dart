import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewerEditorScreen extends HookConsumerWidget {
  const ViewerEditorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('シリーズ'),
      ),
    );
  }
}
