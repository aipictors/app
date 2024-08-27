import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/post/widgets/modal_mute_user_list_tile.dart';
import 'package:aipictors/features/user/functions/mute_user.dart';
import 'package:aipictors/features/user/utils/to_share_user_text.dart';
import 'package:aipictors/features/user/widgets/__generated__/user_action_modal.data.gql.dart';
import 'package:aipictors/features/user/widgets/user_profile.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:aipictors/widgets/modal_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserActionModal extends HookConsumerWidget {
  const UserActionModal({
    super.key,
    required this.user,
  });

  final GUserActionModal user;

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
            ModalHeaderContainer(
              title: Expanded(
                child: UserProfile(user: user),
              ),
            ),
            ModalShareListTile(
              titleText: 'ユーザをシェアする'.i18n,
              shareText: toShareUserText(
                userId: user.id,
                userName: user.name,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            if (authUserId.value != user.id) ...[
              const Divider(),

              /// ログイン時のみミュートボタンを表示する
              if (authUserId.value != null)
                ModalMuteUserListTile(
                  isActive: user.isMuted,
                  onTap: () {
                    return onMuteUser(context);
                  },
                ),
              ModalReportListTile(
                titleText: 'ユーザを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/users/${user.id}/report');
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
      return builder..vars.input.userId = user.id;
    });
  }
}
