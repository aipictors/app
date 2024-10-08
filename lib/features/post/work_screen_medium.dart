import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/home/widgets/data_not_found_error_screen.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/post/__generated__/work.req.gql.dart';
import 'package:aipictors/features/post/widgets/deleted_work_error_container.dart';
import 'package:aipictors/features/post/widgets/work_action_modal.dart';
import 'package:aipictors/features/post/widgets/work_bottom_app_bar.dart';
import 'package:aipictors/features/post/widgets/work_comment_list.dart';
import 'package:aipictors/features/post/widgets/work_status.dart';
import 'package:aipictors/features/post/widgets/work_tag_list.dart';
import 'package:aipictors/features/post/widgets/work_text.dart';
import 'package:aipictors/features/post/widgets/work_user_profile.dart';
import 'package:aipictors/features/user/functions/follow_user.dart';
import 'package:aipictors/features/user/widgets/follow_button.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/utils/to_readable_date_time.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
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
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return WorkActionModal(work: work);
                    },
                  );
                },
              ),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: WorkBottomAppBar(work: work),
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
                    itemCount:
                        (work.subWorks.isEmpty) ? 1 : work.subWorks.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return InteractiveWorkImage(
                          downloadURL: work.imageURL,
                        );
                      } else {
                        return InteractiveWorkImage(
                          downloadURL: work.subWorks[index - 1].imageUrl!,
                        );
                      }
                    },
                  ),
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
                              Expanded(child: WorkUserProfile(user: work.user)),
                              if (authUserId.value != work.user.id)
                                FollowButton(
                                  isActive: work.user.isFollowee == true,
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
                        WorkStatus(
                          likesCount: work.likesCount,
                          viewsCount: work.viewsCount,
                        ),
                        const SizedBox(height: 8),
                        WorkText(
                          title: work.title,
                          description: work.description,
                        ),
                        const SizedBox(height: 8 * 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            toReadableDateTime(work.createdAt),
                            softWrap: true,
                            style: TextStyle(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8 * 2),
                        WorkTagList(tagNames: work.tagNames.toList()),
                        const SizedBox(height: 8 * 2),
                        const Divider(height: 0),
                        WorkCommentList(workId: workId),
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

  /// フォローする
  onFollowUser(BuildContext context, {required String userId}) {
    return followUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }
}
