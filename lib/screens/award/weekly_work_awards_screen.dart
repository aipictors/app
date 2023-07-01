import 'package:aipictors/providers/query_weekly_work_awards_provider.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeeklyWorkAwardsScreen extends HookConsumerWidget {
  const WeeklyWorkAwardsScreen({
    Key? key,
    required this.year,
    required this.month,
  }) : super(key: key);

  final int year;

  final int month;

  @override
  Widget build(context, ref) {
    final provider = queryWeeklyWorkAwardsProvider(
      QueryWeeklyWorkAwardsProps(
        year: year,
        month: month,
        weekIndex: 0,
      ),
    );

    final queryWorks = ref.watch(provider);

    return queryWorks.when(
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
        final awards = data.workAwards;
        if (awards.isEmpty) {
          return const DataNotFoundErrorContainer();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: awards.length,
          itemBuilder: (context, index) {
            final award = awards[index];
            final work = award.work;
            return InkWell(
              onTap: () {
                context.push('/works/${work.id}');
              },
              child: GridWorkImage(
                imageUrl: work.thumbnailImage!.downloadURL,
              ),
            );
          },
        );
      },
    );
  }
}
