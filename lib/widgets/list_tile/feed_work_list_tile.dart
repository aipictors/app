import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/create_work_like.dart';
import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/utils/to_readable_date_time.dart';
import 'package:aipictors/utils/to_share_work_text.dart';
import 'package:aipictors/widgets/button/feed_like_button.dart';
import 'package:aipictors/widgets/button/follow_text_button.dart';
import 'package:aipictors/widgets/container/modal/comment_modal_container.dart';
import 'package:aipictors/widgets/container/modal/feed_action_modal_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:aipictors/widgets/dialog/about_follow_dialog.dart';
import 'package:aipictors/widgets/image/feed_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class FeedWorkListTile extends HookConsumerWidget {
  const FeedWorkListTile({
    Key? key,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.workCreatedAt,
    required this.workImageAspectRatio,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.isLiked,
    required this.isBookmarked,
    required this.likesCount,
    required this.commentsCount,
    required this.isMutedUser,
    required this.isFollowee,
  }) : super(key: key);

  final String workId;

  final String workTitle;

  final int workCreatedAt;

  final double workImageAspectRatio;

  final String userId;

  final String userName;

  final String? userIconImageURL;

  final String? workImageURL;

  final int likesCount;

  final int commentsCount;

  final bool isLiked;

  final bool isBookmarked;

  final bool isMutedUser;

  final bool isFollowee;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);
    final authUserId = ref.watch(authUserIdProvider);

    return ListTile(
      onTap: () {
        context.push('/works/$workId');
      },
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 0,
        bottom: 0,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.push('/users/$userId');
                },
                child: NotificationUserContainer(
                  userName: userName,
                  userIconImageURL: userIconImageURL,
                ),
              ),
            ),
            if (authUserId.value != userId)
              FollowTextButton(
                isActive: isFollowee,
                onPressed: () {
                  if (authUserId.value == null) {
                    return onShowLoginDialog(context, ref, userId: userId);
                  }
                  return onFollowUser(context, userId: userId);
                },
              ),
            const SizedBox(width: 8),
            IconButton(
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                onOpenActionModal(context);
              },
              icon: const Icon(Icons.more_horiz_rounded),
            )
          ]),
          const SizedBox(height: 8),
          FeedImage(
            imageURL: workImageURL,
            imageAspectRatio: workImageAspectRatio,
          ),
          const SizedBox(height: 12),
          Text(
            workTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            toReadableDateTime(workCreatedAt),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                // FeedFolderButton(
                //   isActive: isBookmarked,
                //   onTap: () async {
                //     onAddToFolder(context);
                //   },
                // ),
                // const SizedBox(width: 8),
                if (authUserId.value != userId)
                  FeedLikeButton(
                    count: likesCount,
                    isActive: isLiked,
                    onTap: () async {
                      onCreateLike(context);
                    },
                  ),
                if (authUserId.value == userId) ...[
                  const Icon(
                    Icons.favorite_rounded,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    likesCount.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],

                IconButton(
                  onPressed: () {
                    final text = toShareWorkText(
                      workId: workId,
                      workTitle: workTitle,
                      userName: userName,
                      hashtagText: config.xPostText,
                    );
                    Share.share(text);
                  },
                  icon: const Icon(Icons.share),
                )
              ]),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  onOpenComment(context);
                },
                child: Text(
                  '_COMMENTS_COUNT_件のコメント'.i18n.replaceAllMapped(
                        RegExp(r'_COMMENTS_COUNT_'),
                        (match) => commentsCount.toString(),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  /// 作品をいいねする
  void onCreateLike(BuildContext context) {
    FirebaseAnalytics.instance.logEvent(
      name: 'create_work_like',
      parameters: {
        'item_id': workId,
      },
    );
    createWorkLike((builder) {
      return builder..vars.input.workId = workId;
    });
  }

  /// 作品をブックマークする
  void onAddToFolder(BuildContext context) {}

  /// 作品の詳細を開く
  void onOpenWork(BuildContext context) {
    FirebaseAnalytics.instance.logSelectContent(
      contentType: 'work',
      itemId: workId,
    );
    context.push('/works/$workId');
  }

  /// 作品のコメントを開く
  void onOpenComment(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CommentModalContainer(workId: workId);
      },
    );
  }

  /// モーダルを開く
  void onOpenActionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FeedActionModalContainer(
          workId: workId,
          userId: userId,
          userName: userName,
          workTitle: workTitle,
          userIconImageURL: userIconImageURL,
          isFollowee: isFollowee,
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

  /// フォローする
  onShowLoginDialog(
    BuildContext context,
    WidgetRef ref, {
    required String userId,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AboutFollowDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () {
            context.pop();
            // ログインのページに遷移する
            final notifier = ref.read(homeTabIndexProvider.notifier);
            notifier.toLoginTab();
          },
        );
      },
    );
  }
}
