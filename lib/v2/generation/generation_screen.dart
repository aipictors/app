import 'package:flutter/material.dart';

/// 画像生成タブ（Web の /generation と同じことができる画面）
class GenerationScreen extends StatelessWidget {
  const GenerationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('生成')));
  }
}
