import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/mute_user.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentActionModalContainer extends HookConsumerWidget {
  const CommentActionModalContainer({
    Key? key,
    required this.commentId,
    required this.userId,
    required this.isMutedUser,
  }) : super(key: key);

  final String commentId;

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
            ModalHeaderContainer(
              title: Container(),
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
                'コメントを通報する'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.pop();
                context.push('/comments/$commentId/report');
              },
            ),
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
