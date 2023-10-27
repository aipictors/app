import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_share_user_text.dart';
import 'package:aipictors/utils/to_share_work_text.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/list_tile/modal_mute_user_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkActionModalContainer extends HookConsumerWidget {
  const WorkActionModalContainer({
    Key? key,
    required this.workId,
    required this.workTitle,
    required this.userId,
    required this.userName,
    required this.isMutedUser,
  }) : super(key: key);

  final String workId;

  final String workTitle;

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
              titleText: '作品をシェアする'.i18n,
              shareText: toShareWorkText(
                workId: workId,
                workTitle: workTitle,
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
                titleText: '作品を報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/works/$workId/report');
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
