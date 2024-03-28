import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/mutations/delete_comment.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/modal/comment_action_modal_container.dart';
import 'package:aipictors/widgets/list_tile/work_comment_list_tile.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品のコメント
class WorkCommentView extends HookConsumerWidget {
  const WorkCommentView({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final authUserId = ref.watch(authUserIdProvider);

    final request = GWorkCommentsReq((builder) {
      builder.vars.workId = workId;
    });

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Operation(
      client: client.value!,
      operationRequest: request,
      builder: (context, response, error) {
        if (error != null) {
          return const SizedBox();
        }
        if (response == null || response.loading) {
          return const LoadingContainer();
        }
        if (response.graphqlErrors != null) {
          return const SizedBox();
        }
        final commentList = response.data?.work?.comments;
        if (commentList == null) {
          return const SizedBox();
        }
        return Column(children: [
          for (final comment in commentList)
            Column(
              children: [
                WorkCommentListTile(
                  comment: comment,
                  isResponse: false,
                  onTap: () {},
                  onLongPress: () {
                    onOpenActionModal(
                      context,
                      commentId: comment.id,
                      userId: comment.user!.id,
                      isMutedUser: comment.user!.isMuted,
                      isViewer: authUserId.value == comment.user!.id,
                      onDeleteComment: () async {
                        await deleteComment((builder) {
                          return builder..vars.input.commentId = comment.id;
                        });
                        client.value?.requestController.add(request);
                      },
                    );
                  },
                ),
                for (final response in comment.responses)
                  WorkCommentListTile(
                    comment: response,
                    isResponse: true,
                    onTap: () {},
                    onLongPress: () {
                      onOpenActionModal(
                        context,
                        commentId: response.id,
                        userId: response.user!.id,
                        isMutedUser: response.user!.isMuted,
                        isViewer: authUserId.value == response.user!.id,
                        onDeleteComment: () async {
                          await deleteComment((builder) {
                            return builder..vars.input.commentId = response.id;
                          });
                          client.value?.requestController.add(request);
                        },
                      );
                    },
                  ),
              ],
            )
        ]);
      },
    );
  }

  onOpenActionModal(
    BuildContext context, {
    required String commentId,
    required String userId,
    required bool isMutedUser,
    required bool isViewer,
    required VoidCallback onDeleteComment,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommentActionModalContainer(
          commentId: commentId,
          userId: userId,
          isMutedUser: isMutedUser,
          isViewer: isViewer,
          onDeleteComment: onDeleteComment,
        );
      },
    );
  }
}
