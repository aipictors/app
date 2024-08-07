import 'package:aipictors/features/folder/queries/__generated__/folder_works.req.gql.dart';
import 'package:aipictors/features/post/widgets/work_grid_item_container.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/works_grid_view.dart';
import 'package:ferry/ferry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FolderWorksView extends HookConsumerWidget {
  const FolderWorksView({
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
      operationRequest: GFolderWorksReq((builder) {
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
              return WorkGridItemContainer(
                imageUrl: work.largeThumbnailImageURL,
                imageAspectRatio: work.imageAspectRatio,
                thumbnailImagePosition: work.thumbnailImagePosition,
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'work',
                    itemId: work.id,
                  );
                  context.push('/works/${work.id}');
                },
              );
            },
          ),
        );
      },
    );
  }
}
