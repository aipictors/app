import 'package:aipictors/graphql/__generated__/viewer_feed_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list/feed_work_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード・フォローしているユーザやタグに関連する作品の一覧
class FeedHomeView extends HookConsumerWidget {
  const FeedHomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    return OperationBuilder(
      client: client.value!,
      operationRequest: GViewerFeedWorksReq((builder) {
        return builder
          ..vars.limit = 16
          ..vars.offset = 0;
      }),
      builder: (context, response) {
        final feedWorkList = response.data?.viewer?.feedWorks;
        if (feedWorkList == null) {
          return const DataNotFoundErrorContainer();
        }
        if (feedWorkList.isEmpty) {
          return const DataEmptyErrorContainer();
        }
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(height: 0);
          },
          itemCount: feedWorkList.length,
          itemBuilder: (context, index) {
            final work = feedWorkList[index];
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
