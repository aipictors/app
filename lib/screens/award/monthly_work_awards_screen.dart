import 'package:aipictors/graphql/__generated__/work_awards.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/error/empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonthlyWorkAwardsScreen extends HookConsumerWidget {
  const MonthlyWorkAwardsScreen({
    Key? key,
    required this.year,
    required this.month,
  }) : super(key: key);

  final int year;

  final int month;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    return Operation(
      client: client.value!,
      operationRequest: GWorkAwardsReq((builder) {
        return builder
          ..vars.limit = 128
          ..vars.offset = 0
          ..vars.where.year = year
          ..vars.where.month = month;
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
        final awards = response.data?.workAwards;
        if (awards == null) {
          return const DataNotFoundErrorContainer();
        }
        if (awards.isEmpty) {
          return const EmptyErrorContainer();
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
