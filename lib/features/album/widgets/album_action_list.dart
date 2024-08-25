import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/album/utils/to_share_album_text.dart';
import 'package:aipictors/features/album/widgets/__generated__/album_action_list.data.gql.dart';
import 'package:aipictors/features/post/widgets/modal_mute_user_list_tile.dart';
import 'package:aipictors/features/user/functions/mute_user.dart';
import 'package:aipictors/features/user/utils/to_share_user_text.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:aipictors/widgets/modal_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumActionList extends HookConsumerWidget {
  const AlbumActionList({
    super.key,
    required this.album,
  });

  final GAlbumActionList album;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);
    final authUserId = ref.watch(authUserIdProvider);

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ModalHeaderContainer(title: SizedBox()),
            ModalShareListTile(
              titleText: 'シリーズをシェアする'.i18n,
              shareText: toShareAlbumText(
                userId: album.user.id,
                albumSlug: album.slug ?? '',
                albumTitle: album.title,
                userName: album.user.name,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            ModalShareListTile(
              titleText: 'ユーザをシェアする'.i18n,
              shareText: toShareUserText(
                userId: album.user.id,
                userName: album.user.name,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            if (authUserId.value != album.user.id) ...[
              const Divider(),

              /// ログイン時のみミュートボタンを表示する
              if (authUserId.value != null)
                ModalMuteUserListTile(
                  isActive: album.user.isMuted,
                  onTap: () {
                    return onMuteUser(context);
                  },
                ),
              ModalReportListTile(
                titleText: 'シリーズを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/albums/${album.id}/report');
                },
              ),
              ModalReportListTile(
                titleText: 'ユーザを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/users/${album.user.id}/report');
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// ユーザをミュートする
  onMuteUser(BuildContext context) {
    return muteUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }
}
