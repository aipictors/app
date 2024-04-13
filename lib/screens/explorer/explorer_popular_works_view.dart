import 'package:aipictors/graphql/__generated__/popular_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索・人気の作品
class ExplorerPopularWorksView extends HookConsumerWidget {
  const ExplorerPopularWorksView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GPopularWorksReq((builder) {
      builder;
    });

    return RefreshIndicator(
      onRefresh: () async {
        final req = request.rebuild((builder) {
          builder;
        });
        client.value?.requestController.add(req);
        await Future.delayed(const Duration(seconds: 2));
      },
      child: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final workList = response.data?.popularWorks;
          if (workList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (workList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: workList.length,
            itemBuilder: (context, index) {
              final work = workList[index];
              return InkWell(
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'work',
                    itemId: work.id,
                  );
                  context.push('/works/${work.id}');
                },
                child: GridWorkImage(
                  imageURL: work.thumbnailImage?.downloadURL,
                  imageAspectRatio: work.imageAspectRatio,
                  thumbnailImagePosition: work.thumbnailImagePosition,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
