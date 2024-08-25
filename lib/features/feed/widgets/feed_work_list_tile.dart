import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/config/widgets/about_follow_dialog.dart';
import 'package:aipictors/features/feed/widgets/__generated__/feed_work_list_tile.data.gql.dart';
import 'package:aipictors/features/feed/widgets/comment_modal_container.dart';
import 'package:aipictors/features/feed/widgets/feed_action_modal_container.dart';
import 'package:aipictors/features/feed/widgets/feed_like_button.dart';
import 'package:aipictors/features/feed/widgets/follow_text_button.dart';
import 'package:aipictors/features/feed/widgets/share_work_button.dart';
import 'package:aipictors/features/notification/widgets/notification_user_container.dart';
import 'package:aipictors/features/post/functions/create_work_like.dart';
import 'package:aipictors/features/user/functions/follow_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/utils/to_readable_date_time.dart';
import 'package:aipictors/widgets/image/feed_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedWorkListTile extends HookConsumerWidget {
  const FeedWorkListTile({super.key, required this.work});

  final GFeedWorkListTile work;

  @override
  Widget build(context, ref) {
    final authUserId = ref.watch(authUserIdProvider);

    return ListTile(
      onTap: () {
        context.push('/works/${work.id}');
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
                  context.push('/users/${work.user.id}');
                },
                child: NotificationUserContainer(
                  userName: work.user.name,
                  userIconImageURL: work.user.iconUrl,
                ),
              ),
            ),
            if (authUserId.value != work.user.id)
              FollowTextButton(
                isActive: work.user.isFollowee,
                onPressed: () {
                  if (authUserId.value == null) {
                    return onShowLoginDialog(context, ref);
                  }
                  return onFollowUser(context, userId: work.user.id);
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
            imageURL: work.imageURL,
            imageAspectRatio: work.imageAspectRatio,
          ),
          const SizedBox(height: 12),
          Text(
            work.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            toReadableDateTime(work.createdAt),
            style: Theme.of(context).textTheme.bodySmall,
          ),
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
                if (authUserId.value != work.user.id)
                  FeedLikeButton(
                    count: work.likesCount,
                    isActive: work.isLiked,
                    onTap: () async {
                      onCreateLike(context);
                    },
                  ),
                if (authUserId.value == work.user.id)
                  const Icon(
                    Icons.favorite_rounded,
                    size: 28,
                  ),
                if (authUserId.value == work.user.id) const SizedBox(width: 8),
                if (authUserId.value == work.user.id)
                  Text(
                    work.likesCount.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                const SizedBox(width: 8),
                ShareWorkButton(
                  workId: work.id,
                  workTitle: work.title,
                  userName: work.user.name,
                ),
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
                    (match) {
                      return work.commentsCount.toString();
                    },
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
        'item_id': work.id,
      },
    );
    createWorkLike((builder) {
      return builder..vars.input.workId = work.id;
    });
  }

  /// 作品をブックマークする
  void onAddToFolder(BuildContext context) {}

  /// 作品の詳細を開く
  void onOpenWork(BuildContext context) {
    FirebaseAnalytics.instance.logSelectContent(
      contentType: 'work',
      itemId: work.id,
    );
    context.push('/works/${work.id}');
  }

  /// 作品のコメントを開く
  void onOpenComment(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CommentModalContainer(workId: work.id);
      },
    );
  }

  /// モーダルを開く
  void onOpenActionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FeedActionModalContainer(
          workId: work.id,
          userId: work.user.id,
          userName: work.user.name,
          workTitle: work.title,
          userIconImageURL: work.user.iconUrl,
          isFollowee: work.user.isFollowee,
          isMutedUser: work.user.isMuted,
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
    WidgetRef ref,
  ) async {
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
