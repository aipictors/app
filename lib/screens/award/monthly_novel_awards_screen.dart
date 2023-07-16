import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 小説ランキング（月別）
class MonthlyNovelAwardsScreen extends HookConsumerWidget {
  const MonthlyNovelAwardsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
    );
  }
}
