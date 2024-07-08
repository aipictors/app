import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画像生成
class GenerationConstructionScreen extends HookConsumerWidget {
  const GenerationConstructionScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('画像生成'),
      ),
      body: const Center(
        child: Text(
          '準備中',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
