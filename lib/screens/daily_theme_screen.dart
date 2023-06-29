import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_daily_theme_provider.dart';
import '../widgets/container/data_not_found_error_container.dart';
import '../widgets/container/grid_work_image_container.dart';
import '../widgets/container/loading_container.dart';
import '../widgets/container/unexpected_error_container.dart';
import '../widgets/grid/work_grid_view.dart';

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
          if (data.data == null) {
            return const DataNotFoundErrorContainer();
          }
          final dailyTheme = data.data?.dailyTheme;
          if (dailyTheme == null) {
            return const DataNotFoundErrorContainer();
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: IconButton.filledTonal(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                ),
                backgroundColor: Theme.of(context).primaryColorLight,
                stretch: true,
                expandedHeight: 128,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    dailyTheme.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  // background: ,
                ),
              ),
              SliverToBoxAdapter(
                child: WorkGridView(
                  itemCount: dailyTheme.works.length,
                  itemBuilder: (context, index) {
                    final work = dailyTheme.works[index];
                    return GestureDetector(
                      onTap: () {
                        context.push("/works/${work.id}");
                      },
                      child: GridWorkImageContainer(
                        downloadURL: work.image!.downloadURL,
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
