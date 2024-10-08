import 'package:aipictors/features/explorer/__generated__/explorer_hot_tag_list_view.req.gql.dart';
import 'package:aipictors/features/explorer/widgets/tag_list_tile.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索・ホットタグ
class ExplorerHotTagListView extends HookConsumerWidget {
  const ExplorerHotTagListView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GExplorerHotTagListViewReq((builder) {
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
          final tagList = response.data?.hotTags;
          if (tagList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (tagList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            itemCount: tagList.length,
            itemBuilder: (context, index) {
              final tag = tagList[index];
              return TagListTile(tag: tag);
            },
          );
        },
      ),
    );
  }
}
