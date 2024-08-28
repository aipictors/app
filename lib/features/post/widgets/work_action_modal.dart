import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/post/widgets/__generated__/work_action_modal.data.gql.dart';
import 'package:aipictors/features/post/widgets/modal_mute_user_list_tile.dart';
import 'package:aipictors/features/user/functions/mute_user.dart';
import 'package:aipictors/features/user/utils/to_share_user_text.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_share_work_text.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:aipictors/widgets/modal_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkActionModal extends HookConsumerWidget {
  const WorkActionModal({
    super.key,
    required this.work,
  });

  final GWorkActionModal work;

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
                workId: work.id,
                workTitle: work.title,
                userName: work.user.name,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            ModalShareListTile(
              titleText: 'ユーザをシェアする'.i18n,
              shareText: toShareUserText(
                userId: work.user.id,
                userName: work.user.name,
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            if (authUserId.value != work.user.id) ...[
              const Divider(),

              /// ログイン時のみミュートボタンを表示する
              if (authUserId.value != null)
                ModalMuteUserListTile(
                  isActive: work.user.isMuted,
                  onTap: () {
                    return onMuteUser(context);
                  },
                ),
              ModalReportListTile(
                titleText: '作品を報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/works/${work.id}/report');
                },
              ),
              ModalReportListTile(
                titleText: 'ユーザを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/users/${work.user.id}/report');
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
      return builder..vars.input.userId = work.user.id;
    });
  }
}
