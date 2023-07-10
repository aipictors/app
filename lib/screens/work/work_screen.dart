import 'package:aipictors/graphql/__generated__/work.req.gql.dart';
import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/error/data_not_found_error_screen.dart';
import 'package:aipictors/screens/error/operation_error_screen.dart';
import 'package:aipictors/screens/error/unexpected_error_screen.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/app_bar/work_bottom_app_bar.dart';
import 'package:aipictors/widgets/button/follow_button.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/work_status_container.dart';
import 'package:aipictors/widgets/container/work_tags_container.dart';
import 'package:aipictors/widgets/container/work_text_container.dart';
import 'package:aipictors/widgets/container/work_user_profile_container.dart';
import 'package:aipictors/widgets/list/work_comment_list_tile.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkScreen extends HookConsumerWidget {
  const WorkScreen({
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
      operationRequest: GWorkReq((builder) {
        return builder..vars.id = workId;
      }),
      builder: (context, response, error) {
        if (error != null) {
          return const UnexpectedErrorScreen();
        }
        if (response == null || response.loading) {
          return const LoadingScreen();
        }
        if (response.graphqlErrors != null) {
          return OperationErrorScreen(errors: response.graphqlErrors!);
        }
        final work = response.data?.work;
        if (work == null) {
          return const DataNotFoundErrorScreen();
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              '作品',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          extendBody: true,
          bottomNavigationBar: WorkBottomAppContainer(
            workId: workId,
            isLiked: work.viewer.isLiked,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WorkUserProfileContainer(user: work.user),
                        const FollowButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Image.network(
                    work.image!.downloadURL,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  WorkStatusContainer(
                    likesCount: work.likesCount,
                    viewsCount: work.viewsCount,
                  ),
                  const SizedBox(height: 8),
                  WorkTextContainer(
                    title: work.title,
                    description: work.description,
                  ),
                  const SizedBox(height: 8),
                  WorkTagsContainer(tagNames: work.tagNames.toList()),
                  const SizedBox(height: 16),
                  Operation(
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
                      final comments = response.data?.work?.comments;
                      if (comments == null) {
                        return const SizedBox();
                      }
                      return Column(children: [
                        for (final comment in comments)
                          Column(
                            children: [
                              const Divider(height: 0),
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
