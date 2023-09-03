import 'package:aipictors/graphql/__generated__/album_works.req.gql.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/work_grid_item_container.dart';
import 'package:aipictors/widgets/view/works_grid_view.dart';
import 'package:ferry/ferry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumWorksView extends HookConsumerWidget {
  const AlbumWorksView({
    Key? key,
    required this.client,
    required this.albumId,
  }) : super(key: key);

  final Client client;

  final String albumId;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return OperationBuilder(
      client: client,
      operationRequest: GAlbumWorksReq((builder) {
        return builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.offset = 0
          ..vars.albumId = albumId;
      }),
      builder: (context, response) {
        final workList = response.data?.album?.works;
        if (workList == null) {
          return const SizedBox();
        }
        return SingleChildScrollView(
          child: WorksGridView(
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
          ),
        );
      },
    );
  }
}
