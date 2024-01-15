import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedCommentsView extends HookConsumerWidget {
  const FeedCommentsView({
    super.key,
    required this.client,
    required this.workId,
  });

  final Client client;

  final String workId;

  @override
  Widget build(context, ref) {
    return OperationBuilder(
      client: client,
      operationRequest: GWorkCommentsReq((builder) {
        return builder..vars.workId = workId;
      }),
      builder: (context, response) {
        final commentList = response.data?.work?.comments;
        if (commentList == null) {
          return const SizedBox();
        }
        return SingleChildScrollView(
          child: ListView.builder(
            itemCount: commentList.length,
            itemBuilder: (context, index) {
              final comment = commentList[index];
              return ListTile(
                title: Text(comment.user?.name ?? '-'),
                subtitle: Text(comment.text),
              );
            },
          ),
        );
      },
    );
  }
}
