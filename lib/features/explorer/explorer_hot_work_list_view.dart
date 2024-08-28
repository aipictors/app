import 'package:aipictors/features/explorer/__generated__/explorer_hot_work_list_view.req.gql.dart';
import 'package:aipictors/features/explorer/widgets/explorer_post_grid_item.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索・ホットな作品
class ExplorerHotWorkListView extends HookConsumerWidget {
  const ExplorerHotWorkListView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GExplorerHotWorkListViewReq((builder) {
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
          final workList = response.data?.hotWorks;
          if (workList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (workList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return GridView.builder(
            key: const PageStorageKey('explorer_hot_works'),
            // physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: workList.length,
            itemBuilder: (context, index) {
              final work = workList[index];
              return ExplorerPostGridItem(work: work);
            },
          );
        },
      ),
    );
  }
}
