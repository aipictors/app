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
import 'package:ferry/ferry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final useCache = useState(true);

    final request = GDailyThemesReq((builder) {
      builder
        ..fetchPolicy = FetchPolicy.CacheAndNetwork
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0
        ..vars.where.month = month
        ..vars.where.year = year;
    });

    // ページ切り替え時に前ページのデータがキャッシュで表示されるのを防ぐため、キャッシュの有無を確認する
    // TODO: ferryのキャッシュ設定を変更し、もっといい方法で修正する

    // キャッシュの有無を確認する
    final hasCache = client.value!.cache.readQuery(request);
    if (hasCache == null) {
      useCache.value = false;
    } else {
      useCache.value = true;
    }

    return OperationBuilder(
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

        // キャッシュがないのにDataSourceがキャッシュなら、異なる月のデータを表示しているので、DataSourceが変わるまで待つ
        if (useCache.value == false &&
            response.dataSource == DataSource.Cache) {
          return const LoadingContainer();
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
