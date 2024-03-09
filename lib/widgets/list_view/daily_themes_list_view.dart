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
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemesListView extends HookConsumerWidget {
  const DailyThemesListView({
    super.key,
    required this.month,
    required this.year,
  });

  final int month;

  final int year;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }
    return OperationBuilder(
      client: client.value!,
      operationRequest: GDailyThemesReq((builder) {
        return builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.offset = 0
          ..vars.where.month = month
          ..vars.where.year = year;
      }),
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
              isCurrent: isCurrent(year, month, dailyTheme.day),
              day: dailyTheme.day,
              weekDay: toWeekday(year, month, dailyTheme.day),
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
    );
  }

  bool isCurrent(int year, int month, int day) {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}
