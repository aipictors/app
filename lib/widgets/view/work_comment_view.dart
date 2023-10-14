import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_comment_list_tile.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品のコメント
class WorkCommentView extends HookConsumerWidget {
  const WorkCommentView({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Operation(
      client: client.value!,
      operationRequest: GWorkCommentsReq((builder) {
        return builder..vars.workId = workId;
      }),
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
                ),
                for (final response in comment.responses)
                  WorkCommentListTile(
                    comment: response,
                    isResponse: true,
                    onTap: () {},
                  ),
              ],
            )
        ]);
      },
    );
  }
}
