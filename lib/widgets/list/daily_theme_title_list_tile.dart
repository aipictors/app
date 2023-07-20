import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeTitleListTile extends HookConsumerWidget {
  const DailyThemeTitleListTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Text(
        '今日のテーマは「$title」だよ！',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
