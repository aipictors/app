import 'package:aipictors/config.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_share_album_text.dart';
import 'package:aipictors/utils/to_share_user_text.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/list_tile/modal_mute_user_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumActionModalContainer extends HookConsumerWidget {
  const AlbumActionModalContainer({
    Key? key,
    required this.albumId,
    required this.albumTitle,
    required this.albumSlug,
    required this.userId,
    required this.userName,
    required this.isMutedUser,
  }) : super(key: key);

  final String albumId;

  final String albumTitle;

  final String albumSlug;

  final String userId;

  final String userName;

  final bool isMutedUser;

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
                userId: userId,
                albumSlug: albumSlug,
                albumTitle: albumTitle,
                userName: userName,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            ModalShareListTile(
              titleText: 'ユーザをシェアする'.i18n,
              shareText: toShareUserText(
                userId: userId,
                userName: userName,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            if (authUserId.value != userId) ...[
              const Divider(),

              /// ログイン時のみミュートボタンを表示する
              if (authUserId.value == null)
                ModalMuteUserListTile(
                  isActive: isMutedUser,
                  onTap: () {
                    return onMuteUser(context);
                  },
                ),
              ModalReportListTile(
                titleText: 'シリーズを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/albums/$albumId/report');
                },
              ),
              ModalReportListTile(
                titleText: 'ユーザを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/users/$userId/report');
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
