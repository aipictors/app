import 'package:aipictors/graphql/__generated__/feed_hot_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list/feed_work_list_tile.dart';
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

    return OperationBuilder(
      client: client.value!,
      operationRequest: request,
      builder: (context, response) {
        final hotWorks = response.data?.hotWorks;
        if (hotWorks == null) {
          return const DataNotFoundErrorContainer();
        }
        if (hotWorks.isEmpty) {
          return const DataEmptyErrorContainer();
        }
        return ListView.separated(
          key: const PageStorageKey('feed_hot_works'),
          separatorBuilder: (context, index) {
            return const Divider(height: 0);
          },
          itemCount: hotWorks.length,
          itemBuilder: (context, index) {
            final work = hotWorks[index];
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
    );
  }
}
