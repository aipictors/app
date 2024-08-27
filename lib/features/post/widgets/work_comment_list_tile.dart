import 'package:aipictors/features/post/functions/delete_comment.dart';
import 'package:aipictors/features/post/widgets/__generated__/work_comment_list_tile.data.gql.dart';
import 'package:aipictors/features/post/widgets/comment_action_modal.dart';
import 'package:aipictors/features/post/widgets/comment_details_modal.dart';
import 'package:aipictors/features/post/widgets/sticker_image.dart';
import 'package:aipictors/features/post/widgets/work_user_profile.dart';
import 'package:aipictors/utils/to_readable_date_time.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkCommentListTile extends HookConsumerWidget {
  const WorkCommentListTile({
    super.key,
    required this.comment,
    required this.isMine,
    required this.isResponse,
    required this.onDelete,
  });

  final GWorkCommentListTile comment;

  final bool isMine;

  final bool isResponse;

  final VoidCallback onDelete;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 0,
      leading: isResponse
          ? Icon(
              Icons.subdirectory_arrow_right_rounded,
              color: Theme.of(context).disabledColor,
            )
          : null,
      title: Column(
        children: [
          const SizedBox(height: 16),
          WorkUserProfile(user: comment.user!),
          const SizedBox(height: 8),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (comment.sticker == null && comment.text.isEmpty) const Text('-'),
          if (comment.text.isNotEmpty) Text(comment.text),
          if (comment.sticker != null) const SizedBox(height: 4),
          if (comment.sticker != null)
            StickerImage(
              imageURL: comment.sticker!.imageUrl,
            ),
          const SizedBox(height: 8),
          Text(
            toReadableDateTime(comment.createdAt),
            softWrap: true,
            style: TextStyle(
              color: Theme.of(context).dividerColor,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CommentDetailsModal(
              workId: comment.workId!,
              commentId: comment.id,
            );
          },
        );
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CommentActionModal(
              comment: comment,
              isMine: isMine,
              onDeleteComment: () async {
                await deleteComment((builder) {
                  return builder..vars.input.commentId = comment.id;
                });
                onDelete();
              },
            );
          },
        );
      },
    );
  }
}
