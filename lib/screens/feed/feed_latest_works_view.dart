import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/graphql/__generated__/feed_latest_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list/feed_work_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード・最新の作品の一覧
class FeedLatestWorksView extends HookConsumerWidget {
  const FeedLatestWorksView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GFeedLatestWorksReq((builder) {
      return builder
        ..vars.limit = 16
        ..vars.offset = 0
        ..vars.where.rating = GRating.G;
    });

    return OperationBuilder(
      client: client.value!,
      operationRequest: request,
      builder: (context, response) {
        final works = response.data?.works;
        if (works == null) {
          return const DataNotFoundErrorContainer();
        }
        if (works.isEmpty) {
          return const DataEmptyErrorContainer();
        }
        return ListView.separated(
          key: const PageStorageKey('feed_latest_works'),
          separatorBuilder: (context, index) {
            return const Divider(height: 0);
          },
          itemCount: works.length,
          itemBuilder: (context, index) {
            final work = works[index];
            return FeedWorkListTile(
              workId: work.id,
              workTitle: work.title,
              workImageURL: work.image!.downloadURL,
              workCreatedAt: work.createdAt,
              workImageAspectRatio: work.imageAspectRatio,
              userId: work.user.id,
              userName: work.user.name,
              userIconImageURL: work.user.iconImage?.downloadURL,
              likesCount: work.likesCount,
              commentsCount: work.commentsCount,
              isLiked: work.viewer?.isLiked == true,
              isBookmarked: work.viewer?.isBookmarked == true,
            );
          },
        );
      },
    );
  }
}
