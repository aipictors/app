import 'package:aipictors/features/folder/widgets/__generated__/folder_work_list_view.req.gql.dart';
import 'package:aipictors/features/folder/widgets/folder_post_grid_item.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/works_grid_view.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FolderWorkListView extends HookConsumerWidget {
  const FolderWorkListView({
    super.key,
    required this.client,
    required this.folderId,
  });

  final Client client;

  final String folderId;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return OperationBuilder(
      client: client,
      operationRequest: GFolderWorkListViewReq((builder) {
        builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.folderId = folderId
          ..vars.offset = 0;
      }),
      builder: (context, response) {
        final workList = response.data?.folder?.works;
        if (workList == null) {
          return const SizedBox();
        }
        return SingleChildScrollView(
          child: WorksGridView(
            itemCount: workList.length,
            itemBuilder: (context, index) {
              final work = workList[index];
              return FolderPostGridItem(work: work);
            },
          ),
        );
      },
    );
  }
}
