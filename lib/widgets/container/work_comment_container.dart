import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/mutations/create_work_comment.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/modal/comment_details_modal_container.dart';
import 'package:aipictors/widgets/container/work_comment_form_container.dart';
import 'package:aipictors/widgets/list_tile/work_comment_list_tile.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkCommentContainer extends HookConsumerWidget {
  const WorkCommentContainer({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final client = ref.watch(clientProvider);

    final authUserId = ref.watch(authUserIdProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GWorkCommentsReq((builder) {
      return builder..vars.workId = workId;
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
              return const LoadingContainer();
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
                            if (commentList[index].user!.id ==
                                authUserId.value) {
                              return;
                            }
                            onOpenDetailsModal(context,
                                workId: workId,
                                commentId: commentList[index].id);
                          }),
                      for (final response in commentList[index].responses)
                        WorkCommentListTile(
                          comment: response,
                          isResponse: true,
                          onTap: () {
                            onOpenDetailsModal(context,
                                workId: workId,
                                commentId: commentList[index].id);
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
}
