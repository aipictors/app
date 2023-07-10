import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/graphql/__generated__/feed_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list/feed_work_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedLatestWorksScreen extends HookConsumerWidget {
  const FeedLatestWorksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GFeedWorksReq((builder) {
      return builder
        ..vars.limit = 16
        ..vars.offset = 0
        ..vars.where.rating = GRating.G;
    });

    return OperationBuilder(
      client: client.value!,
      operationRequest: request,
      isEmpty: (data) {
        return data?.works?.isEmpty;
      },
      builder: (data) {
        return ListView.separated(
          key: const PageStorageKey('feed_home'),
          separatorBuilder: (context, index) {
            return const Divider(height: 0);
          },
          itemCount: data.works!.length,
          itemBuilder: (context, index) {
            final work = data.works![index];
            return FeedWorkListTile(
              workId: work.id,
              workTitle: work.title,
              workImageURL: work.thumbnailImage!.downloadURL,
              workCreatedAt: work.createdAt,
              userName: work.user.name,
              userIconImageURL: work.user.iconImage?.downloadURL,
              likesCount: work.likesCount,
              commentsCount: work.commentsCount,
              isLiked: work.viewer.isLiked,
              isBookmarked: work.viewer.isBookmarked,
            );
          },
        );
      },
    );
  }
}
