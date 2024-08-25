import 'package:aipictors/features/album/widgets/__generated__/album_work_list.req.gql.dart';
import 'package:aipictors/features/album/widgets/__generated__/album_work_list_view.data.gql.dart';
import 'package:aipictors/features/album/widgets/album_list_item_header.dart';
import 'package:aipictors/features/album/widgets/album_work_list_tile.dart';
import 'package:aipictors/features/config/widgets/about_follow_dialog.dart';
import 'package:aipictors/features/user/functions/follow_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/end_of_content.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumWorkListView extends HookConsumerWidget {
  const AlbumWorkListView(
      {super.key, required this.client, required this.album});

  final Client client;

  final GAlbumWorkListView album;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final authUserId = ref.watch(authUserIdProvider);

    return OperationBuilder(
      client: client,
      operationRequest: GAlbumWorkListReq((builder) {
        builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.offset = 0
          ..vars.albumId = album.id;
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
              return AlbumListItemHeader(
                album: album,
                onFollow: () {
                  if (authUserId.value == null) {
                    return onShowLoginDialog(context, ref);
                  }
                  return onFollowUser(context, userId: album.user.id);
                },
              );
            }
            if (index == workList.length + 1) {
              return const EndOfContentContainer();
            }
            final work = workList[index - 1];
            return AlbumWorkListTile(work: work);
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
            Navigator.of(context).popUntil((route) => route.isFirst);
            final notifier = ref.read(homeTabIndexProvider.notifier);
            notifier.toLoginTab();
          },
        );
      },
    );
  }
}
