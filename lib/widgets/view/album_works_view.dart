import 'package:aipictors/graphql/__generated__/album_works.req.gql.dart';
import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/end_of_content_container.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/dialog/about_follow_dialog.dart';
import 'package:aipictors/widgets/list_tile/album_work_list_tile.dart';
import 'package:aipictors/widgets/view/album_header.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumWorksView extends HookConsumerWidget {
  const AlbumWorksView({
    super.key,
    required this.client,
    required this.albumId,
    required this.albumTitle,
    required this.albumDescription,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.isFollowee,
  });

  final Client client;

  final String albumId;

  final String albumTitle;

  final String albumDescription;

  final String userId;

  final String userName;

  final String? userIconImageURL;

  final bool isFollowee;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final authUserId = ref.watch(authUserIdProvider);

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
          return const DataEmptyErrorContainer();
        }
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(height: 0);
          },
          itemCount: workList.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return AlbumHeader(
                albumId: albumId,
                albumTitle: albumTitle,
                albumDescription: albumDescription,
                userId: userId,
                userName: userName,
                userIconImageURL: userIconImageURL,
                isFollowee: isFollowee,
                onFollow: () {
                  if (authUserId.value == null) {
                    return onShowLoginDialog(context, ref);
                  }
                  return onFollowUser(context, userId: userId);
                },
              );
            }
            if (index == workList.length + 1) {
              return const EndOfContentContainer();
            }
            final work = workList[index - 1];
            return AlbumWorkListTile(
              workId: work.id,
              workTitle: work.title,
              workImageURL: work.image!.downloadURL,
              workCreatedAt: work.createdAt,
              workImageAspectRatio: work.imageAspectRatio,
              userId: userId,
              userName: userName,
              likesCount: work.likesCount,
              commentsCount: work.commentsCount,
              isLiked: work.viewer?.isLiked == true,
            );
          },
        );
      },
    );
  }

  /// フォローする
  onFollowUser(BuildContext context, {required String userId}) {
    return followUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }

  /// フォローする
  onShowLoginDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AboutFollowDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () {
            context.pop();
            // ログインのページに遷移する
            final notifier = ref.read(homeTabIndexProvider.notifier);
            notifier.toLoginTab();
          },
        );
      },
    );
  }
}
