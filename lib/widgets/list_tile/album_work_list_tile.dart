import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/create_work_like.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_readable_date_time.dart';
import 'package:aipictors/utils/to_share_work_text.dart';
import 'package:aipictors/widgets/button/feed_like_button.dart';
import 'package:aipictors/widgets/container/modal/comment_modal_container.dart';
import 'package:aipictors/widgets/image/feed_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class AlbumWorkListTile extends HookConsumerWidget {
  const AlbumWorkListTile({
    Key? key,
    required this.workId,
    required this.workTitle,
    required this.workImageURL,
    required this.workCreatedAt,
    required this.workImageAspectRatio,
    required this.userId,
    required this.userName,
    required this.isLiked,
    required this.likesCount,
    required this.commentsCount,
  }) : super(key: key);

  final String workId;

  final String workTitle;

  final int workCreatedAt;

  final double workImageAspectRatio;

  final String? workImageURL;

  final int likesCount;

  final int commentsCount;

  final String userId;

  final String userName;

  final bool isLiked;

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
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                if (authUserId.value != userId)
                  FeedLikeButton(
                    count: likesCount,
                    isActive: isLiked,
                    onTap: () async {
                      onCreateLike(context);
                    },
                  ),
                if (authUserId.value == userId)
                  const Icon(
                    Icons.favorite_rounded,
                    size: 28,
                  ),
                if (authUserId.value == userId) const SizedBox(width: 8),
                if (authUserId.value == userId)
                  Text(
                    likesCount.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                const SizedBox(width: 8),
                IconButton(
                  style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
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
                    (match) {
                      return commentsCount.toString();
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
}
