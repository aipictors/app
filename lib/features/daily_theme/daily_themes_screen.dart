import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/daily_theme/widgets/daily_theme_list_view.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemesScreen extends HookConsumerWidget {
  const DailyThemesScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    // 2023年3月からのお題をアプリで閲覧できる
    const startMonth = 3;

    const startYear = 2023;

    final client = ref.watch(clientProvider);

    final year = useState(DateTime.now().year);

    final month = useState(DateTime.now().month);

    final currentYear = DateTime.now().year;

    final currentMonth = DateTime.now().month;

    final yearDiff = DateTime.now().year - startYear;

    final monthDiff = DateTime.now().month - startMonth;

    final dailyThemesCount = (yearDiff) * 12 + (monthDiff) + 1;

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      key: const PageStorageKey('daily_themes'),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '_YEAR_年 _MONTH_月'
              .i18n
              .replaceAllMapped(
                RegExp(r'_YEAR_'),
                (match) => year.value.toString(),
              )
              .replaceAllMapped(
                RegExp(r'_MONTH_'),
                (match) => month.value.toString(),
              ),
        ),
      ),
      body: PageView.builder(
        itemCount: dailyThemesCount,
        onPageChanged: (index) {
          final newDate = DateTime(currentYear, currentMonth - index);
          year.value = newDate.year;
          month.value = newDate.month;
        },
        itemBuilder: (context, index) {
          return DailyThemeListView(month: month.value, year: year.value);
        },
      ),
    );
  }
}
