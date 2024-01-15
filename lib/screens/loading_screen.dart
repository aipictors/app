import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ページの読み込み中
class LoadingScreen extends HookConsumerWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
