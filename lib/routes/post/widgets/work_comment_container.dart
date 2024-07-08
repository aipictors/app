import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/mutations/create_work_comment.dart';
import 'package:aipictors/mutations/delete_comment.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/routes/post/widgets/comment_action_modal_container.dart';
import 'package:aipictors/routes/post/widgets/comment_details_modal_container.dart';
import 'package:aipictors/routes/post/widgets/work_comment_form_container.dart';
import 'package:aipictors/routes/post/widgets/work_comment_list_tile.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkCommentContainer extends HookConsumerWidget {
  const WorkCommentContainer({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final client = ref.watch(clientProvider);

    final authUserId = ref.watch(authUserIdProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GWorkCommentsReq((builder) {
      builder.vars.workId = workId;
    });

    return Column(
      children: [
        if (authState.value?.uid != null)
          WorkCommentFormContainer(
            onSubmit: (text, stickerId) async {
              await createWorkComment((builder) {
                return builder
                  ..vars.input.workId = workId
                  ..vars.input.text = text
                  ..vars.input.stickerId = stickerId;
              });
              client.value?.requestController.add(request);
            },
          ),
        Operation(
          client: client.value!,
          operationRequest: request,
          builder: (context, response, error) {
            if (error != null) {
              return const SizedBox();
            }
            if (response == null || response.loading) {
              return const LoadingProgress();
            }
            if (response.graphqlErrors != null) {
              return const SizedBox();
            }
            final commentList = response.data?.work?.comments;
            if (commentList == null) {
              return const SizedBox();
            }
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: commentList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      WorkCommentListTile(
                        comment: commentList[index],
                        isResponse: false,
                        onTap: () {
                          if (commentList[index].user!.id == authUserId.value) {
                            return;
                          }
                          onOpenDetailsModal(context,
                              workId: workId, commentId: commentList[index].id);
                        },
                        onLongPress: () {
                          onOpenActionModal(
                            context,
                            commentId: commentList[index].id,
                            userId: commentList[index].user!.id,
                            isMutedUser: commentList[index].user!.isMuted,
                            isViewer:
                                authUserId.value == commentList[index].user!.id,
                            onDeleteComment: () async {
                              await deleteComment((builder) {
                                return builder
                                  ..vars.input.commentId =
                                      commentList[index].id;
                              });
                              client.value?.requestController.add(request);
                            },
                          );
                        },
                      ),
                      for (final response in commentList[index].responses)
                        WorkCommentListTile(
                          comment: response,
                          isResponse: true,
                          onTap: () {
                            if (commentList[index].user!.id ==
                                authUserId.value) {
                              return;
                            }
                            onOpenDetailsModal(context,
                                workId: workId,
                                commentId: commentList[index].id);
                          },
                          onLongPress: () {
                            onOpenActionModal(
                              context,
                              commentId: response.id,
                              userId: response.user!.id,
                              isMutedUser: response.user!.isMuted,
                              isViewer: authUserId.value == response.user!.id,
                              onDeleteComment: () async {
                                await deleteComment((builder) {
                                  return builder
                                    ..vars.input.commentId = response.id;
                                });
                                client.value?.requestController.add(request);
                              },
                            );
                          },
                        ),
                    ],
                  );
                });
          },
        ),
      ],
    );
  }

  onOpenDetailsModal(BuildContext context,
      {required String workId, required String commentId}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommentDetailsModalContainer(
          workId: workId,
          commentId: commentId,
        );
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
