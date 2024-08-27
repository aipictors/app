import 'package:aipictors/features/user/__generated__/user_works.req.gql.dart';
import 'package:aipictors/features/user/widgets/user_work_grid_item.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:aipictors/widgets/works_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserWorkGridView extends HookConsumerWidget {
  const UserWorkGridView({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    return OperationBuilder(
      client: client.value!,
      operationRequest: GUserWorksReq((builder) {
        builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.user_id = userId
          ..vars.offset = 0;
      }),
      builder: (context, response) {
        final workList = response.data?.user?.works;
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
            return UserWorkGridItem(work: work);
          },
        );
      },
    );
  }
}
