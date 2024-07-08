import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/feed/widgets/modal_follow_user_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_user_container.dart';
import 'package:aipictors/features/post/widgets/modal_mute_user_list_tile.dart';
import 'package:aipictors/features/user/functions/follow_user.dart';
import 'package:aipictors/features/user/functions/mute_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_share_work_text.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/list_tile/modal_share_list_tile.dart';
import 'package:aipictors/widgets/modal_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedActionModalContainer extends HookConsumerWidget {
  const FeedActionModalContainer({
    super.key,
    required this.workId,
    required this.userId,
    required this.userName,
    required this.workTitle,
    required this.userIconImageURL,
    required this.isFollowee,
    required this.isMutedUser,
  });

  final String workId;

  final String userId;

  final String userName;

  final String workTitle;

  final String? userIconImageURL;

  final bool isFollowee;

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
            ModalHeaderContainer(
              title: Expanded(
                  child: NotificationUserContainer(
                userName: userName,
                userIconImageURL: userIconImageURL,
              )),
            ),
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
            ModalFollowUserListTile(
              isActive: isFollowee,
              onTap: () {
                return onFollowUser(context);
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
