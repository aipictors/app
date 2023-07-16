import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アカウントの作成
class AccountCreateScreen extends HookConsumerWidget {
  const AccountCreateScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント作成'),
      ),
    );
  }
}
