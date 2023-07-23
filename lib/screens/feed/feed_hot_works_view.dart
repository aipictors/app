import 'package:aipictors/graphql/__generated__/feed_hot_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/end_of_content_container.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/feed_work_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード・ホットな作品の一覧
class FeedHotWorksView extends HookConsumerWidget {
  const FeedHotWorksView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GFeedHotWorksReq((builder) {
      return builder;
    });

    return RefreshIndicator(
      onRefresh: () async {
        final req = request.rebuild((builder) {
          return builder;
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
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(height: 0);
            },
            itemCount: workList.length + 1,
            itemBuilder: (context, index) {
              if (index == workList.length) {
                return const EndOfContentContainer();
              }
              final work = workList[index];
              return FeedWorkListTile(
                workId: work.id,
                workTitle: work.title,
                workImageURL: work.image?.downloadURL,
                workCreatedAt: work.createdAt,
                workImageAspectRatio: work.imageAspectRatio,
                userId: work.user.id,
                userName: work.user.name,
                userIconImageURL: work.user.iconImage?.downloadURL,
                likesCount: work.likesCount,
                commentsCount: work.commentsCount,
                isLiked: work.viewer?.isLiked == true,
                isBookmarked: work.viewer?.isBookmarked == true,
                isFollowee: work.user.viewer?.isFollowee == true,
                isMutedUser: work.user.viewer?.isMuted == true,
              );
            },
          );
        },
      ),
    );
  }
}
