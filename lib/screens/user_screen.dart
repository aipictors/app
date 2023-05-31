import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("ユーザ"),
          ],
        ),
      ),
    );
  }
}
