import 'package:aipictors/providers/query_daily_work_awards_provider.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyWorkAwardsScreen extends HookConsumerWidget {
  const DailyWorkAwardsScreen({
    Key? key,
    required this.year,
    required this.month,
    required this.day,
  }) : super(key: key);

  final int year;

  final int month;

  final int day;

  @override
  Widget build(context, ref) {
    final queryWorks = ref.watch(
      queryDailyWorkAwardsProvider(
        QueryDailyWorkAwardsProps(
          year: year,
          month: month,
          day: day,
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
        );
      },
    );
  }
}
