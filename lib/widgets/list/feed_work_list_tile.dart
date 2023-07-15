import 'package:aipictors/mutations/create_work_like.dart';
import 'package:aipictors/utils/to_readable_date_time.dart';
import 'package:aipictors/widgets/button/feed_bookmark_button.dart';
import 'package:aipictors/widgets/button/feed_like_button.dart';
import 'package:aipictors/widgets/container/modal/comment_modal_container.dart';
import 'package:aipictors/widgets/container/modal/user_action_modal_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:aipictors/widgets/image/feed_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedWorkListTile extends HookConsumerWidget {
  const FeedWorkListTile({
    Key? key,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.workCreatedAt,
    required this.workImageAspectRatio,
    required this.userName,
    required this.userIconImageURL,
    required this.isLiked,
    required this.isBookmarked,
    required this.likesCount,
    required this.commentsCount,
  }) : super(key: key);

  final String workId;

  final String workTitle;

  final int workCreatedAt;

  final double workImageAspectRatio;

  final String userName;

  final String? userIconImageURL;

  final String? workImageURL;

  final int likesCount;

  final int commentsCount;

  final bool isLiked;

  final bool isBookmarked;

  @override
  Widget build(context, ref) {
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
              child: NotificationUserContainer(
                userName: userName,
                userIconImageURL: userIconImageURL,
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                onOpenAction(context);
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
                FeedBookmarkButton(
                  isActive: isLiked,
                  onTap: () async {
                    onCreateLike(context);
                  },
                ),
                const SizedBox(width: 8),
                FeedLikeButton(
                  count: likesCount,
                  isActive: isBookmarked,
                  onTap: () async {
                    onCreateBookmark(context);
                  },
                ),
              ]),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  onOpenComment(context);
                },
                child: Text('$commentsCount件のコメント'),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void onCreateLike(BuildContext context) {
    FirebaseAnalytics.instance.logEvent(
      name: 'create_work_like',
      parameters: {
        'item_id': workId,
      },
    );
    createWorkLike(workId: workId);
  }

  void onCreateBookmark(BuildContext context) {
    FirebaseAnalytics.instance.logEvent(
      name: 'create_work_bookmark',
      parameters: {
        'item_id': workId,
      },
    );
    createWorkLike(workId: workId);
  }

  void onOpenWork(BuildContext context) {
    FirebaseAnalytics.instance.logSelectContent(
      contentType: 'work',
      itemId: workId,
    );
    context.push('/works/$workId');
  }

  void onOpenComment(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CommentModalContainer(workId: workId);
      },
    );
  }

  void onOpenAction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return UserActionModalContainer(
          userName: userName,
          userIconImageURL: userIconImageURL,
        );
      },
    );
  }

  void onOpenImage(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Center(
          child: SingleChildScrollView(
              child: Image.network(
            workImageURL ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
          )),
        );
      },
    );
  }
}
