import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/post/widgets/__generated__/comment_action_modal.data.gql.dart';
import 'package:aipictors/features/post/widgets/modal_mute_user_list_tile.dart';
import 'package:aipictors/features/user/functions/mute_user.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:aipictors/widgets/modal_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentActionModal extends HookConsumerWidget {
  const CommentActionModal({
    super.key,
    required this.comment,
    required this.isMine,
    required this.onDeleteComment,
  });

  final GCommentActionModal comment;

  final bool isMine;

  final VoidCallback onDeleteComment;

  @override
  Widget build(context, ref) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ModalHeaderContainer(title: SizedBox()),
            if (!isMine) ...[
              ModalMuteUserListTile(
                isActive: comment.user!.isMuted,
                onTap: () {
                  return onMuteUser(context);
                },
              ),
              const Divider(),
              ModalReportListTile(
                titleText: 'コメントを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/comments/${comment.id}/report');
                },
              ),
              ModalReportListTile(
                titleText: 'ユーザを報告する'.i18n,
                onTap: () {
                  context.pop();
                  context.push('/users/${comment.user!.id}/report');
                },
              ),
            ],
            if (isMine)
              ListTile(
                title: Text(
                  'コメントを削除する'.i18n,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  onDeleteComment();
                  context.pop();
                },
                //onTap: () {}
              )
          ],
        ),
      ),
    );
  }

  /// ユーザをミュートする
  onMuteUser(BuildContext context) {
    return muteUser((builder) {
      return builder..vars.input.userId = comment.user!.id;
    });
  }
}
