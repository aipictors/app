import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/routes/post/widgets/modal_mute_user_list_tile.dart';
import 'package:aipictors/utils/to_share_user_text.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:aipictors/widgets/modal_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerActionModalContainer extends HookConsumerWidget {
  const StickerActionModalContainer({
    super.key,
    required this.userName,
    required this.stickerId,
    required this.userId,
    required this.isMutedUser,
  });

  final String stickerId;

  final String userId;

  final String userName;

  final bool isMutedUser;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final authUserId = ref.watch(authUserIdProvider);

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ModalHeaderContainer(title: SizedBox()),
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
              if (authUserId.value != null)
                ModalMuteUserListTile(
                  isActive: isMutedUser,
                  onTap: () {
                    return onMuteUser(context);
                  },
                ),
            ],
            ModalReportListTile(
              titleText: 'スタンプを報告する'.i18n,
              onTap: () {
                context.pop();
                context.push('/stickers/$stickerId/report');
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
