import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/mutations/create_work_comment.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
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
            onSubmit: (text) async {
              await createWorkComment((builder) {
                return builder
                  ..vars.input.workId = workId
                  ..vars.input.text = text;
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
            return Column(children: [
              for (final comment in commentList)
                Column(
                  children: [
                    WorkCommentListTile(
                      comment: comment,
                      isResponse: false,
                    ),
                    for (final response in comment.responses)
                      WorkCommentListTile(
                        comment: response,
                        isResponse: true,
                      ),
                  ],
                )
            ]);
          },
        ),
      ],
    );
  }
}
