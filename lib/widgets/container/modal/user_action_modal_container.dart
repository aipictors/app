import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/utils/to_share_text.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:aipictors/widgets/list_tile/modal_mute_user_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserActionModalContainer extends HookConsumerWidget {
  const UserActionModalContainer({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.isMutedUser,
  }) : super(key: key);

  final String userId;

  final String userName;

  final String? userIconImageURL;

  final bool isMutedUser;

  @override
  Widget build(context, ref) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ModalHeaderContainer(
              title: NotificationUserContainer(
                userName: userName,
                userIconImageURL: userIconImageURL,
              ),
            ),
            ModalShareListTile(
              titleText: 'ユーザをシェアする'.i18n,
              shareText: toShareText(true, userId, userName, null),
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
