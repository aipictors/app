import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/feed/widgets/__generated__/feed_action_list.data.gql.dart';
import 'package:aipictors/features/feed/widgets/feed_user_profile.dart';
import 'package:aipictors/features/feed/widgets/modal_follow_user_list_tile.dart';
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

class FeedActionList extends HookConsumerWidget {
  const FeedActionList({
    super.key,
    required this.work,
  });

  final GFeedActionList work;

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
              title: Expanded(child: FeedUserProfile(user: work.user)),
            ),
            ModalShareListTile(
              titleText: '作品をシェアする'.i18n,
              shareText: toShareWorkText(
                workId: work.id,
                workTitle: work.title,
                userName: work.user?.name ?? 'Unknown User',
                hashtagText: config.xPostText,
              ),
              onTap: () {
                context.pop();
              },
            ),
            ModalFollowUserListTile(
              isActive: work.user?.isFollowee ?? false,
              onTap: () {
                return onFollowUser(context);
              },
            ),
            if (authUserId.value != work.user?.id) ...[
              const Divider(),

              /// ログイン時のみミュートボタンを表示する
              if (authUserId.value != null)
                ModalMuteUserListTile(
                  isActive: work.user?.isMuted ?? false,
                  onTap: () {
                    return onMuteUser(context);
                  },
                ),
              ModalReportListTile(
                titleText: 'ユーザを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/users/${work.user?.id}/report');
                },
              ),
              ModalReportListTile(
                titleText: '作品を報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/works/${work.id}/report');
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
      return builder..vars.input.userId = work.user!.id;
    });
  }

  /// ユーザをミュートする
  onMuteUser(BuildContext context) {
    return muteUser((builder) {
      return builder..vars.input.userId = work.user!.id;
    });
  }
}
