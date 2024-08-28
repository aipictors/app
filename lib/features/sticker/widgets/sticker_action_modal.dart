import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/post/widgets/modal_mute_user_list_tile.dart';
import 'package:aipictors/features/sticker/widgets/__generated__/sticker_action_modal.data.gql.dart';
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

class StickerActionModal extends HookConsumerWidget {
  const StickerActionModal({
    super.key,
    required this.sticker,
  });

  final GStickerActionModal sticker;

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
                userId: sticker.user.id,
                userName: sticker.user.name,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            if (authUserId.value != sticker.user.id) ...[
              const Divider(),

              /// ログイン時のみミュートボタンを表示する
              if (authUserId.value != null)
                ModalMuteUserListTile(
                  isActive: sticker.user.isMuted,
                  onTap: () {
                    return onMuteUser(context);
                  },
                ),
            ],
            ModalReportListTile(
              titleText: 'スタンプを報告する'.i18n,
              onTap: () {
                context.pop();
                context.push('/stickers/${sticker.id}/report');
              },
            ),
            ModalReportListTile(
              titleText: 'ユーザを報告する'.i18n,
              onTap: () {
                context.pop();
                context.push('/users/${sticker.user.id}/report');
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
      return builder..vars.input.userId = sticker.user.id;
    });
  }
}
