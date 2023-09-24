import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/daily_themes.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/utils/to_weekday.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/daily_theme_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemesScreen extends HookConsumerWidget {
  const DailyThemesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    final year = useState(DateTime.now().year);

    final month = useState(DateTime.now().month);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GDailyThemesReq((builder) {
      return builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0
        ..vars.where.month = month.value
        ..vars.where.year = year.value;
    });

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
        actions: [
          FilledButton.tonal(
            child: Text('前月'.i18n),
            onPressed: () {
              // context.push('/daily_themes_month');
              onPrev(year, month);
            },
          ),
        ],
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final dailyThemeList = response.data?.dailyThemes;
          if (response.loading) {
            return const LoadingContainer();
          }
          if (dailyThemeList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (dailyThemeList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16, left: 0, right: 0),
            itemCount: dailyThemeList.length,
            itemBuilder: (context, index) {
              final dailyTheme = dailyThemeList[index];
              final firstWork = dailyTheme.firstWork;
              return DailyThemeListTile(
                isCurrent: isCurrent(year.value, month.value, dailyTheme.day),
                day: dailyTheme.day,
                weekDay: toWeekday(year.value, month.value, dailyTheme.day),
                title: dailyTheme.title,
                worksCount: dailyTheme.worksCount,
                imageURL: firstWork?.thumbnailImage?.downloadURL,
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'daily_theme',
                    itemId: dailyTheme.id,
                  );
                  context.push('/daily_themes/${dailyTheme.id}');
                },
              );
            },
          );
        },
      ),
    );
  }

  /// 先月に変更する
  void onPrev(ValueNotifier<int> year, ValueNotifier<int> month) {
    if (month.value == 1 && year.value == 2022) return;
    if (month.value == 1) {
      year.value -= 1;
      month.value = 12;
      return;
    }
    month.value -= 1;
  }

  /// 先月が存在する
  bool hasPrev(int year, int month) {
    if (year == 2023 && month < 3) return false;
    return true;
  }

  /// 来月に変更する
  void onNext(ValueNotifier<int> year, ValueNotifier<int> month) {
    if (month.value == 12) {
      year.value += 1;
      month.value = 1;
      return;
    }
    month.value += 1;
  }

  /// 来月が存在する
  bool hasNext(int year, int month) {
    final now = DateTime.now();
    if (year == now.year && month == now.month) {
      return false;
    }
    return true;
  }

  bool isCurrent(int year, int month, int day) {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}
