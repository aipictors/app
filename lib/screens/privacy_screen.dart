import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivacyScreen extends HookConsumerWidget {
  const PrivacyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プライバシーポリシー'),
      ),
    );
  }
}
