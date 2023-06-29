import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_monthly_work_awards_provider.dart';
import '../widgets/container/data_not_found_error_container.dart';
import '../widgets/container/loading_container.dart';
import '../widgets/container/unexpected_error_container.dart';
import '../widgets/image/grid_work_image.dart';

class AwardMonthlyScreen extends HookConsumerWidget {
  const AwardMonthlyScreen({
    Key? key,
    required this.year,
    required this.month,
  }) : super(key: key);

  final int year;

  final int month;

  @override
  Widget build(context, ref) {
    final queryWorks = ref.watch(
      queryMonthlyWorkAwardsProvider(
        QueryMonthlyWorkAwardsProps(
          year: year,
          month: month,
        ),
      ),
    );

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
