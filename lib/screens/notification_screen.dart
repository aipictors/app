import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("通知"),
          ],
        ),
      ),
    );
  }
}
