import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/list/modal_mute_user_list_tile.dart';
import 'package:aipictors/widgets/list/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list/modal_share_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkActionModalContainer extends HookConsumerWidget {
  const WorkActionModalContainer({
    Key? key,
    required this.workId,
    required this.userId,
    required this.isMutedUser,
  }) : super(key: key);

  final String workId;

  final String userId;

  final bool isMutedUser;

  @override
  Widget build(context, ref) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ModalHeaderContainer(title: SizedBox()),
            ModalShareListTile(
              titleText: '作品をシェアする'.i18n,
              shareText: 'check out! https://aipictors.com/works/$userId',
              onTap: () {
                context.pop();
              },
            ),
            ModalShareListTile(
              titleText: 'ユーザをシェアする'.i18n,
              shareText: 'check out! https://aipictors.com/user/$userId',
              onTap: () {
                context.pop();
              },
            ),
            ModalMuteUserListTile(
              isActive: isMutedUser,
              onTap: () {
                return onMuteUser(context);
              },
            ),
            const Divider(),
            ModalReportListTile(
              titleText: '作品を通報する'.i18n,
              onTap: () {
                context.pop();
                context.push('/works/$workId/report');
              },
            ),
            ModalReportListTile(
              titleText: 'ユーザを通報する'.i18n,
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
