import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/screens/work/work_screen_compact.dart';
import 'package:aipictors/screens/work/work_screen_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品の詳細
class WorkScreen extends HookConsumerWidget {
  const WorkScreen({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(context, ref) {
    final layout = Layout.fromWith(MediaQuery.of(context).size.width);
    if (layout.notCompact) {
      return WorkScreenMedium(workId: workId);
    } else {
      return WorkScreenCompact(workId: workId);
    }
    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: GWorkReq((builder) {
        return builder..vars.id = workId;
      }),
      builder: (context, response) {
        final work = response.data?.work;
        if (work == null) {
          return const DataNotFoundErrorScreen();
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
            isLiked: work.viewer?.isLiked == true,
            isFolded: work.viewer?.isBookmarked == true,
          ),
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
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
                          WorkUserProfileContainer(user: work.user),
                          if (authUserId.value != work.user.id)
                            FollowButton(
                              isActive: work.user.viewer?.isFollowee == true,
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
                    const SizedBox(height: 8 * 1.5),
                    InteractiveWorkImage(
                      downloadURL: work.image!.downloadURL,
                    ),
                    for (final subWork in work.subWorks)
                      InteractiveWorkImage(
                        downloadURL: subWork.image.downloadURL,
                      ),
                    const SizedBox(height: 8 * 2),
                    WorkStatusContainer(
                      likesCount: work.likesCount,
                      viewsCount: work.viewsCount,
                    ),
                    const SizedBox(height: 8),
                    WorkTextContainer(
                      title: work.title,
                      description: work.description,
                    ),
                    if (work.tagNames.isNotEmpty) const SizedBox(height: 8),
                    if (work.tagNames.isNotEmpty)
                      WorkTagsContainer(tagNames: work.tagNames.toList()),
                    const SizedBox(height: 8 * 2),
                    const Divider(height: 0),
                    const SizedBox(height: 8 * 1),
                    WorkCommentContainer(workId: workId),
                    const SizedBox(height: 8 * 2),
                  ],
                ),
              ),
            ),
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
