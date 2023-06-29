import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_work_comments_provider.dart';
import '../providers/query_work_provider.dart';
import '../widgets/app_bar/work_bottom_app_bar.dart';
import '../widgets/button/follow_button.dart';
import '../widgets/container/data_not_found_error_container.dart';
import '../widgets/container/loading_container.dart';
import '../widgets/container/unexpected_error_container.dart';
import '../widgets/container/work_response_container.dart';
import '../widgets/container/work_status_container.dart';
import '../widgets/container/work_tags_container.dart';
import '../widgets/container/work_text_container.dart';
import '../widgets/container/work_user_profile_container.dart';

class WorkScreen extends HookConsumerWidget {
  const WorkScreen({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(context, ref) {
    final queryWork = ref.watch(queryWorkProvider(workId));

    final queryWorkComments = ref.watch(
      queryWorkCommentsProvider(
        QueryWorkCommentsProps(workId: workId),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          '作品',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const WorkBottomAppContainer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: queryWork.when(
            error: (error, stackTrace) {
              return const UnexpectedErrorContainer();
            },
            loading: () {
              return const LoadingContainer();
            },
            data: (data) {
              if (data == null) {
                return const DataNotFoundErrorContainer();
              }
              final work = data.work;
              if (work == null) {
                return const DataNotFoundErrorContainer();
              }
              return Column(
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
                  queryWorkComments.when(
                    error: (error, stackTrace) {
                      return const UnexpectedErrorContainer();
                    },
                    loading: () {
                      return const LoadingContainer();
                    },
                    data: (data) {
                      if (data == null) {
                        return const DataNotFoundErrorContainer();
                      }
                      final comments = data.work!.comments;
                      return Column(
                        children: [
                          for (final comment in comments)
                            Column(
                              children: [
                                const Divider(height: 0),
                                WorkResponseContainer(
                                  comment: comment,
                                  isResponse: false,
                                ),
                                for (final response in comment.responses)
                                  WorkResponseContainer(
                                    comment: response,
                                    isResponse: true,
                                  ),
                              ],
                            )
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
