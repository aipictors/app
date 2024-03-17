import 'package:aipictors/graphql/__generated__/hot_tags.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/tag_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索・ホットタグ
class ExplorerHotTagsView extends HookConsumerWidget {
  const ExplorerHotTagsView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GHotTagsReq((builder) {
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
              return TagListTile(
                title: tag.name,
                imageURL: tag.firstWork?.thumbnailImage?.downloadURL,
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'tag',
                    itemId: tag.name,
                  );
                  context.push('/tags/${tag.name}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
