import 'package:aipictors/graphql/__generated__/album_works.req.gql.dart';
import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/error/empty_data_error_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/button/follow_button.dart';
import 'package:aipictors/widgets/container/end_of_content_container.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:aipictors/widgets/list_tile/album_work_list_tile.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumWorksView extends HookConsumerWidget {
  const AlbumWorksView({
    Key? key,
    required this.client,
    required this.albumId,
    required this.albumDescription,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.isFollowee,
  }) : super(key: key);

  final Client client;

  final String albumId;

  final String albumDescription;

  final String userId;

  final String userName;

  final String userIconImageURL;

  final bool isFollowee;

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
              return (Column(children: [
                ListTile(
                  title: NotificationUserContainer(
                      userName: userName, userIconImageURL: userIconImageURL),
                  trailing: FollowButton(
                    isActive: isFollowee,
                    onPressed: () {
                      return onFollowUser(context, userId: userId);
                    },
                  ),
                ),
                Text(albumDescription)
              ]));
            }
            if (index == workList.length) {
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
              isLiked: work.viewer!.isLiked,
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
}
