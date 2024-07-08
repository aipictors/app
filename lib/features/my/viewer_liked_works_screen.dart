import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/graphql/__generated__/viewer_liked_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// いいねした作品の一覧
class ViewerLikedWorksScreen extends HookConsumerWidget {
  const ViewerLikedWorksScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GViewerLikedWorksReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('いいねした作品'.i18n),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final workList = response.data?.viewer?.likedWorks;
          if (workList == null) {
            return const UnexpectedErrorContainer();
          }
          if (workList.isEmpty) {
            return DataEmptyErrorContainer(
              message: 'いいねした作品はないみたい'.i18n,
            );
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
                  imageURL: work.largeThumbnailImageURL,
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
