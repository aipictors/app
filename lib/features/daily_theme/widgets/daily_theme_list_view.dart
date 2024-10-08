import 'dart:developer';

import 'package:aipictors/features/daily_theme/widgets/__generated__/daily_theme_list.req.gql.dart';
import 'package:aipictors/features/daily_theme/widgets/daily_theme_list_tile.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:ferry/ferry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeListView extends HookConsumerWidget {
  const DailyThemeListView({
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
    print(month);
    print(year);

    final request = GDailyThemeListReq((builder) {
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
          return const LoadingProgress();
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
          return const LoadingProgress();
        }
        inspect(dailyThemeList);
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 16, left: 0, right: 0),
          itemCount: dailyThemeList.length,
          itemBuilder: (context, index) {
            final dailyTheme = dailyThemeList[index];
            return DailyThemeListTile(
              dailyTheme: dailyTheme,
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
}
