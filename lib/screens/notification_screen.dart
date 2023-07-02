import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/providers/query_viewer_notifications_provider.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/empty_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:aipictors/widgets/list/notification_comment_list_tile.dart';
import 'package:aipictors/widgets/list/notification_follow_list_tile.dart';
import 'package:aipictors/widgets/list/notification_like_list_tile.dart';
import 'package:aipictors/widgets/list/notification_reply_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final query = ref.watch(queryViewerNotificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return await ref.refresh(queryViewerNotificationsProvider.future);
        },
        child: query.when(
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
            final viewer = data.viewer;
            if (viewer == null) {
              return const DataNotFoundErrorContainer();
            }
            final notifications = viewer.notifications;
            if (notifications.isEmpty) {
              return const EmptyErrorContainer();
            }
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                if (notification.type == GNotificationType.LIKE) {
                  final user = notification.relatedUser;
                  final work = notification.work;
                  return NotificationLikeListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                    userId: notification.relatedUserId,
                    userName: user?.name,
                    userIconImageURL: user?.iconImage?.downloadURL,
                    workId: notification.workId,
                    workTitle: work?.title,
                    workImageURL: work?.thumbnailImage?.downloadURL,
                  );
                }
                if (notification.type == GNotificationType.COMMENT) {
                  final user = notification.relatedUser;
                  final work = notification.work;
                  final sticker = notification.sticker;
                  return NotificationCommentListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                    userId: notification.relatedUserId,
                    userName: user?.name,
                    userIconImageURL: user?.iconImage?.downloadURL,
                    workId: notification.workId,
                    workTitle: work?.title,
                    workImageURL: work?.thumbnailImage?.downloadURL,
                    stickerImageURL: sticker?.image.downloadURL,
                  );
                }
                if (notification.type == GNotificationType.COMMENT_REPLY) {
                  final user = notification.relatedUser;
                  final work = notification.work;
                  final sticker = notification.sticker;
                  return NotificationReplyListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                    userId: notification.relatedUserId,
                    userName: user?.name,
                    userIconImageURL: user?.iconImage?.downloadURL,
                    workId: notification.workId,
                    workTitle: work?.title,
                    workImageURL: work?.thumbnailImage?.downloadURL,
                    stickerImageURL: sticker?.image.downloadURL,
                  );
                }
                if (notification.type == GNotificationType.FOLLOW) {
                  final user = notification.relatedUser;
                  return NotificationFollowListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                    userId: notification.relatedUserId,
                    userName: user?.name,
                    userIconImageURL: user?.iconImage?.downloadURL,
                  );
                }
                return null;
              },
            );
          },
        ),
      ),
    );
  }
}
