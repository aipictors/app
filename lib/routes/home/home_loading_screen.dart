import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アプリの読み込み中
class HomeLoadingScreen extends HookConsumerWidget {
  const HomeLoadingScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
