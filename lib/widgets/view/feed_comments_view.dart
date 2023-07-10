import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedCommentsView extends HookConsumerWidget {
  const FeedCommentsView({
    Key? key,
    required this.client,
    required this.workId,
  }) : super(key: key);

  final Client client;

  final String workId;

  @override
  Widget build(context, ref) {
    return OperationBuilder(
      client: client,
      operationRequest: GWorkCommentsReq((builder) {
        return builder..vars.workId = workId;
      }),
      isEmpty: (data) {
        return data?.work?.comments.isEmpty;
      },
      builder: (data) {
        final comments = data.work!.comments;
        return SingleChildScrollView(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ListTile(
                title: Text(comment.user.name),
                subtitle: Text(comment.text),
              );
            },
          ),
        );
      },
    );
  }
}
