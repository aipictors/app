import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/album/widgets/__generated__/album_work_list_tile.data.gql.dart';
import 'package:aipictors/features/feed/widgets/feed_comment_modal.dart';
import 'package:aipictors/features/feed/widgets/feed_like_button.dart';
import 'package:aipictors/features/feed/widgets/share_work_button.dart';
import 'package:aipictors/features/post/functions/create_work_like.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/utils/to_readable_date_time.dart';
import 'package:aipictors/widgets/image/feed_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumWorkListTile extends HookConsumerWidget {
  const AlbumWorkListTile({
    super.key,
    required this.work,
  });

  final GAlbumWorkListTile work;

  @override
  Widget build(context, ref) {
    final authUserId = ref.watch(authUserIdProvider);

    return ListTile(
      onTap: () {
        context.push('/works/$work.id');
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
          const SizedBox(height: 16),
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
                if (authUserId.value != work.user?.id)
                  FeedLikeButton(
                    count: work.likesCount,
                    isActive: work.isLiked,
                    onTap: () async {
                      onCreateLike(context);
                    },
                  ),
                if (authUserId.value == work.user?.id)
                  const Icon(
                    Icons.favorite_rounded,
                    size: 28,
                  ),
                if (authUserId.value == work.user?.id) const SizedBox(width: 8),
                if (authUserId.value == work.user?.id)
                  Text(
                    work.likesCount.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                const SizedBox(width: 8),
                ShareWorkButton(
                  workId: work.id,
                  workTitle: work.title,
                  userName: work.user?.name ?? 'Unknown User',
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
        return FeedCommentModal(workId: work.id);
      },
    );
  }
}
