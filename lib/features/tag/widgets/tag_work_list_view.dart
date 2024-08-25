import 'package:aipictors/features/tag/widgets/__generated__/tag_work_list_view.req.gql.dart';
import 'package:aipictors/features/tag/widgets/tag_work_grid_item.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/works_grid_view.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagWorkListView extends HookConsumerWidget {
  const TagWorkListView({
    super.key,
    required this.client,
    required this.tagName,
  });

  final Client client;

  final String tagName;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return SingleChildScrollView(
      child: OperationBuilder(
        client: client,
        operationRequest: GTagWorkListViewReq((builder) {
          builder
            ..vars.tagName = tagName
            ..vars.limit = config.graphqlQueryLimit
            ..vars.offset = 0;
        }),
        builder: (context, response) {
          final workList = response.data?.tag?.works;
          if (workList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (workList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return WorksGridView(
            itemCount: workList.length,
            itemBuilder: (context, index) {
              final work = workList[index];
              return TagWorkGridItem(work: work);
            },
          );
        },
      ),
    );
  }
}
