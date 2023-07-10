import 'package:aipictors/graphql/__generated__/daily_theme.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/app_bar/daily_theme_app_bar.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/error/empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:aipictors/widgets/view/works_grid_view.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
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
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    return Operation(
      client: client.value!,
      operationRequest: GDailyThemeReq((builder) {
        return builder
          ..vars.limit = 16
          ..vars.offset = 0
          ..vars.id = themeId;
      }),
      builder: (context, response, error) {
        if (error != null) {
          return const UnexpectedErrorContainer();
        }
        if (response == null || response.loading) {
          return const LoadingContainer();
        }
        if (response.graphqlErrors != null) {
          return const UnexpectedErrorContainer();
        }
        final dailyTheme = response.data?.dailyTheme;
        if (dailyTheme == null) {
          return const DataNotFoundErrorContainer();
        }
        final works = dailyTheme.works;
        if (works.isEmpty) {
          return const EmptyErrorContainer();
        }
        return CustomScrollView(
          slivers: [
            DailyThemeAppBar(title: dailyTheme.title),
            SliverToBoxAdapter(
              child: WorksGridView(
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
    );
  }
}
