import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/daily_theme/__generated__/daily_theme_screen.req.gql.dart';
import 'package:aipictors/features/daily_theme/widgets/daily_theme_work_grid_item.dart';
import 'package:aipictors/features/home/widgets/data_not_found_error_screen.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/works_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 日別テーマ
class DailyThemeScreen extends HookConsumerWidget {
  const DailyThemeScreen({
    super.key,
    required this.themeId,
  });

  final String themeId;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GDailyThemeScreenReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0
        ..vars.id = themeId;
    });

    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: request,
      builder: (context, response) {
        final dailyTheme = response.data?.dailyTheme;
        if (dailyTheme == null ||
            dailyTheme.works == null ||
            dailyTheme.works!.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: Text('お題'.i18n)),
            body: const DataNotFoundErrorScreen(),
          );
        }
        return Scaffold(
          appBar: AppBar(title: Text(dailyTheme.title)),
          body: SingleChildScrollView(
            child: WorksGridView(
              itemCount: dailyTheme.works!.length,
              itemBuilder: (context, index) {
                final work = dailyTheme.works![index];
                return DailyThemeWorkGridItem(work: work);
              },
            ),
          ),
        );
      },
    );
  }
}
