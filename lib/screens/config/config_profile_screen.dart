import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定・プロフィール
class ConfigProfileScreen extends HookConsumerWidget {
  const ConfigProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
      ),
    );
  }
}
