import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigMutedTagsScreen extends HookConsumerWidget {
  const ConfigMutedTagsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ミュートしたタグ'),
      ),
    );
  }
}
