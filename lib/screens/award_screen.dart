import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'award_daily_screen.dart';
import 'award_monthly_screen.dart';
import 'award_weekly_screen.dart';

class AwardScreen extends HookConsumerWidget {
  const AwardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final year = useState(DateTime.now().year);

    // final month = useState(DateTime.now().month);
    final month = useState(4);

    final day = useState(DateTime.now().day);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: const PageStorageKey('awards'),
        appBar: AppBar(
          title: const Text('ランキング'),
          bottom: const TabBar(tabs: [
            Tab(text: 'デイリー'),
            Tab(text: 'ウィークリー'),
            Tab(text: 'マンスリー'),
          ]),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today_rounded),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(children: [
          AwardDailyScreen(
            year: year.value,
            month: month.value,
            day: day.value,
          ),
          AwardMonthlyScreen(year: year.value, month: month.value),
          AwardWeeklyScreen(year: year.value, month: month.value),
        ]),
      ),
    );
  }
}
