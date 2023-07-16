import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/graphql/__generated__/viewer_notifications.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list/notification_comment_list_tile.dart';
import 'package:aipictors/widgets/list/notification_follow_list_tile.dart';
import 'package:aipictors/widgets/list/notification_like_list_tile.dart';
import 'package:aipictors/widgets/list/notification_reply_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 通知
class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GViewerNotificationsReq((builder) {
      return builder
        ..vars.offset = 0
        ..vars.limit = 64;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final req = request.rebuild((builder) {
            return builder
              ..vars.offset = 0
              ..vars.limit = 64;
          });
          return client.value?.requestController.add(req);
        },
        child: OperationBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final notifications = response.data?.viewer?.notifications;
            if (notifications == null) {
              return const DataNotFoundErrorContainer();
            }
            if (notifications.isEmpty) {
              return const DataEmptyErrorContainer();
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
