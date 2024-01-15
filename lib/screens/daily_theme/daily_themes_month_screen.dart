import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemesMonthsScreen extends HookConsumerWidget {
  const DailyThemesMonthsScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      key: const PageStorageKey('daily_themes'),
      body: Container(),
    );
  }
}
