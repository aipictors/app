import 'package:aipictors/providers/query_daily_theme_provider.dart';
import 'package:aipictors/widgets/app_bar/daily_theme_app_bar.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:aipictors/widgets/grid/work_grid_view.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeScreen extends HookConsumerWidget {
  const DailyThemeScreen({
    Key? key,
    required this.themeId,
  }) : super(key: key);

  final String themeId;

  @override
  Widget build(context, ref) {
    final dailyThemes = ref.watch(
      queryDailyThemeProvider(
        QueryDailyThemeProps(themeId: themeId),
      ),
    );

    return Scaffold(
      body: dailyThemes.when(
        error: (error, stackTrace) {
          return const UnexpectedErrorContainer();
        },
        loading: () {
          return const LoadingContainer();
        },
        data: (data) {
          if (data == null) {
            return const DataNotFoundErrorContainer();
          }
          final dailyTheme = data.dailyTheme;
          if (dailyTheme == null) {
            return const DataNotFoundErrorContainer();
          }
          return CustomScrollView(
            slivers: [
              DailyThemeAppBar(title: dailyTheme.title),
              SliverToBoxAdapter(
                child: WorkGridView(
                  itemCount: dailyTheme.works.length,
                  itemBuilder: (context, index) {
                    final work = dailyTheme.works[index];
                    return GestureDetector(
                      onTap: () {
                        FirebaseAnalytics.instance.logSelectContent(
                          contentType: 'work',
                          itemId: work.id,
                        );
                        context.push('/works/${work.id}');
                      },
                      child: GridWorkImage(
                        imageUrl: work.thumbnailImage!.downloadURL,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
