import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:aipictors/widgets/list_tile/modal_follow_user_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_mute_user_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedActionModalContainer extends HookConsumerWidget {
  const FeedActionModalContainer({
    Key? key,
    required this.workId,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.isFollowee,
    required this.isMutedUser,
  }) : super(key: key);

  final String workId;

  final String userId;

  final String userName;

  final String? userIconImageURL;

  final bool isFollowee;

  final bool isMutedUser;

  @override
  Widget build(context, ref) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
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
              titleText: '作品をシェアする'.i18n,
              shareText: 'check out! https://www.aipictors.com/works/$workId',
              onTap: () {
                context.pop();
              },
            ),
            ModalFollowUserListTile(
              isActive: isFollowee,
              onTap: () {
                return onFollowUser(context);
              },
            ),
            const Divider(),
            ModalMuteUserListTile(
              isActive: isMutedUser,
              onTap: () {
                return onMuteUser(context);
              },
            ),
            ModalReportListTile(
              titleText: 'ユーザを報告する'.i18n,
              onTap: () {
                context.pop();
                context.push('/users/$userId/report');
              },
            ),
            ModalReportListTile(
              titleText: '作品を報告する'.i18n,
              onTap: () {
                context.pop();
                context.push('/works/$workId/report');
              },
            ),
          ],
        ),
      ),
    );
  }

  /// ユーザをフォローする
  onFollowUser(BuildContext context) {
    return followUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }

  /// ユーザをミュートする
  onMuteUser(BuildContext context) {
    return muteUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }
}
