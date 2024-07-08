import 'package:aipictors/features/feed/queries/__generated__/feed_latest_works.req.gql.dart';
import 'package:aipictors/features/feed/widgets/feed_work_list_tile.dart';
import 'package:aipictors/providers/audio_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/end_of_content.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード・最新の作品の一覧
class FeedLatestWorksView extends HookConsumerWidget {
  const FeedLatestWorksView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final audio = ref.watch(audioProvider);

    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GFeedLatestWorksReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          audio.play(AssetSource('snd_sine/progress_loop.wav'));
          final req = request.rebuild((builder) {
            builder
              ..vars.limit = config.graphqlQueryLimit
              ..vars.offset = 0;
          });
          client.value?.requestController.add(req);
          await Future.delayed(const Duration(seconds: 2));
          audio.play(AssetSource('snd_sine/transition_up.wav'));
        },
        child: OperationBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final workList = response.data?.works;
            if (workList == null) {
              return const DataNotFoundErrorContainer();
            }
            if (workList.isEmpty) {
              return const DataEmptyErrorContainer();
            }
            return ListView.separated(
              shrinkWrap: true,
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
                  workImageURL: work.imageURL,
                  workCreatedAt: work.createdAt,
                  workImageAspectRatio: work.imageAspectRatio,
                  userId: work.user.id,
                  userName: work.user.name,
                  userIconImageURL: work.user.iconUrl,
                  likesCount: work.likesCount,
                  commentsCount: work.commentsCount,
                  isLiked: work.isLiked == true,
                  isBookmarked: false,
                  isFollowee: work.user.isFollowee == true,
                  isMutedUser: work.user.isMuted == true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
