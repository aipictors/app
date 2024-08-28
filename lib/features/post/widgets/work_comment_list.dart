import 'package:aipictors/features/post/functions/create_work_comment.dart';
import 'package:aipictors/features/post/widgets/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/features/post/widgets/work_comment_form.dart';
import 'package:aipictors/features/post/widgets/work_comment_list_tile.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkCommentList extends HookConsumerWidget {
  const WorkCommentList({
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
          WorkCommentForm(
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
                      isMine: authUserId.value == commentList[index].id,
                      onDelete: () {
                        client.value?.requestController.add(request);
                      },
                    ),
                    if (commentList[index].responses != null)
                      for (final response in commentList[index].responses!)
                        WorkCommentListTile(
                          comment: response,
                          isMine: authUserId.value == response.user!.id,
                          isResponse: true,
                          onDelete: () {
                            client.value?.requestController.add(request);
                          },
                        ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
