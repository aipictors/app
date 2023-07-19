import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

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
            ListTile(
              leading: const Icon(Icons.share_rounded),
              title: Text(
                '作品をシェアする'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.pop();
                Share.share('check out! https://aipictors.com/works/$workId');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_rounded,
                color: isFollowee ? Theme.of(context).colorScheme.error : null,
              ),
              title: Text(
                isFollowee ? 'ユーザをフォロー中'.i18n : 'ユーザをフォローする'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                onFollowUser(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.block_rounded,
                color: isMutedUser ? Theme.of(context).colorScheme.error : null,
              ),
              title: Text(
                isMutedUser ? 'ユーザをミュート中'.i18n : 'ユーザをミュートする'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                onMuteUser(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.gpp_maybe_rounded),
              title: Text(
                'ユーザを通報する'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.pop();
                context.push('/users/$userId/report');
              },
            ),
            ListTile(
              leading: const Icon(Icons.gpp_maybe_rounded),
              title: Text(
                '作品を通報する'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
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
