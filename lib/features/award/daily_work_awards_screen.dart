import 'package:aipictors/features/award/__generated__/work_awards.req.gql.dart';
import 'package:aipictors/features/award/widgets/work_award_grid_item.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品ランキング（日別）
class DailyWorkAwardsScreen extends HookConsumerWidget {
  const DailyWorkAwardsScreen({
    super.key,
    required this.year,
    required this.month,
    required this.day,
  });

  final int year;

  final int month;

  final int day;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GWorkAwardsReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0
        ..vars.where.year = year
        ..vars.where.month = month
        ..vars.where.day = day;
    });

    return OperationBuilder(
      client: client.value!,
      operationRequest: request,
      builder: (context, response) {
        final awardList = response.data?.workAwards;
        if (awardList == null) {
          return const DataNotFoundErrorContainer();
        }
        if (awardList.isEmpty) {
          return const DataEmptyErrorContainer();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: awardList.length,
          itemBuilder: (context, index) {
            final award = awardList[index];
            final work = award.work;
            if (work == null) {
              return const SizedBox();
            }
            return InkWell(
              onTap: () {
                FirebaseAnalytics.instance.logSelectContent(
                  contentType: 'work',
                  itemId: work.id,
                );
                context.push('/works/${work.id}');
              },
              child: WorkAwardGridItem(workAward: award),
            );
          },
        );
      },
    );
  }
}
