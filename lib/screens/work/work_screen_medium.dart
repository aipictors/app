import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/work.req.gql.dart';
import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/error/data_not_found_error_screen.dart';
import 'package:aipictors/screens/error/deleted_work_error_container.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/app_bar/work_bottom_app_bar.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/button/follow_button.dart';
import 'package:aipictors/widgets/container/modal/work_action_modal_container.dart';
import 'package:aipictors/widgets/container/work_comment_container.dart';
import 'package:aipictors/widgets/container/work_status_container.dart';
import 'package:aipictors/widgets/container/work_tags_container.dart';
import 'package:aipictors/widgets/container/work_text_container.dart';
import 'package:aipictors/widgets/container/work_user_profile_container.dart';
import 'package:aipictors/widgets/image/interactive_work_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品の詳細
class WorkScreenMedium extends HookConsumerWidget {
  const WorkScreenMedium({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    final authUserId = ref.watch(authUserIdProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: GWorkReq((builder) {
        builder.vars.id = workId;
      }),
      builder: (context, response) {
        final work = response.data?.work;
        if (work == null) {
          return const DataNotFoundErrorScreen();
        }
        if (work.isDeleted) {
          return const DeletedWorkErrorScreen();
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text('作品'.i18n),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_horiz_rounded),
                onPressed: () {
                  onOpenActionModal(
                    context,
                    userId: work.user.id,
                    userName: work.user.name,
                    workTitle: work.title,
                    isMutedUser: work.user.viewer?.isMuted == true,
                  );
                },
              ),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: WorkBottomAppContainer(
            workId: workId,
            userId: work.user.id,
            isLiked: work.viewer?.isLiked == true,
            isFolded: work.viewer?.isBookmarked == true,
          ),
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ListView.builder(
                      itemCount: (work.subWorks.isEmpty)
                          ? 1
                          : work.subWorks.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return InteractiveWorkImage(
                            downloadURL: work.image!.downloadURL,
                          );
                        } else {
                          return InteractiveWorkImage(
                            downloadURL:
                                work.subWorks[index - 1].image.downloadURL,
                          );
                        }
                      }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: WorkUserProfileContainer(
                                      user: work.user)),
                              if (authUserId.value != work.user.id)
                                FollowButton(
                                  isActive:
                                      work.user.viewer?.isFollowee == true,
                                  onPressed: () {
                                    return onFollowUser(
                                      context,
                                      userId: work.user.id,
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                        WorkStatusContainer(
                          likesCount: work.likesCount,
                          viewsCount: work.viewsCount,
                        ),
                        const SizedBox(height: 8),
                        WorkTextContainer(
                          title: work.title,
                          description: work.description,
                        ),
                        const SizedBox(height: 8 * 2),
                        WorkTagsContainer(tagNames: work.tagNames.toList()),
                        const SizedBox(height: 8 * 2),
                        const Divider(height: 0),
                        WorkCommentContainer(workId: workId),
                        const SizedBox(height: 8 * 2),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        );
      },
    );
  }

  onOpenActionModal(
    BuildContext context, {
    required String userId,
    required String userName,
    required String workTitle,
    required bool isMutedUser,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return WorkActionModalContainer(
          workId: workId,
          workTitle: workTitle,
          userId: userId,
          userName: userName,
          isMutedUser: isMutedUser,
        );
      },
    );
  }

  /// フォローする
  onFollowUser(BuildContext context, {required String userId}) {
    return followUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }
}
