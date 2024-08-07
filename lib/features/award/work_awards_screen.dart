import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/award/daily_work_awards_screen.dart';
import 'package:aipictors/features/award/monthly_work_awards_screen.dart';
import 'package:aipictors/features/award/weekly_work_awards_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品ランキング
class WorkAwardsScreen extends HookConsumerWidget {
  const WorkAwardsScreen({
    super.key,
  });

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
          title: Text('ランキング'.i18n),
          bottom: TabBar(tabs: [
            Tab(text: 'デイリー'.i18n),
            Tab(text: 'ウィークリー'.i18n),
            Tab(text: 'マンスリー'.i18n),
          ]),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today_rounded),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(children: [
          DailyWorkAwardsScreen(
            year: year.value,
            month: month.value,
            day: day.value,
          ),
          MonthlyWorkAwardsScreen(year: year.value, month: month.value),
          WeeklyWorkAwardsScreen(year: year.value, month: month.value),
        ]),
      ),
    );
  }
}
