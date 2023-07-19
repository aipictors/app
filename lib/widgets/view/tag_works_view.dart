import 'package:aipictors/graphql/__generated__/tag_works.req.gql.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/work_grid_item_container.dart';
import 'package:aipictors/widgets/view/works_grid_view.dart';
import 'package:ferry/ferry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagWorksView extends HookConsumerWidget {
  const TagWorksView({
    Key? key,
    required this.client,
    required this.tagName,
  }) : super(key: key);

  final Client client;

  final String tagName;

  @override
  Widget build(context, ref) {
    return SingleChildScrollView(
      child: OperationBuilder(
        client: client,
        operationRequest: GTagWorksReq((builder) {
          return builder
            ..vars.tagName = tagName
            ..vars.limit = 16
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
              return WorkGridItemContainer(
                imageUrl: work.thumbnailImage?.downloadURL,
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'work',
                    itemId: work.id,
                  );
                  context.push('/works/${work.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
