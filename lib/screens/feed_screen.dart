import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedScreen extends HookConsumerWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("ホーム"),
          ],
        ),
      ),
    );
  }
}
