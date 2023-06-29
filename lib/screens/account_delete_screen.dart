import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountDeleteScreen extends HookConsumerWidget {
  const AccountDeleteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント削除'),
      ),
    );
  }
}
