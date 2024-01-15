import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeTitleListTile extends HookConsumerWidget {
  const DailyThemeTitleListTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Text(
        '今日のテーマは_TITLE_だよ！'
            .i18n
            .replaceAllMapped(RegExp(r'_TITLE_'), (match) => title),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
