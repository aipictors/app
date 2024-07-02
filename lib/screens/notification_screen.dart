import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_notifications.data.gql.dart';
import 'package:aipictors/graphql/__generated__/viewer_notifications.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_follow_list_tile.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_liked_work_list_tile.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_liked_works_summary_list_tile.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_work_award_list_tile.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_work_comment_list_tile.dart';
import 'package:aipictors/widgets/list_tile/notification/notification_work_comment_reply_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 通知
class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GViewerNotificationsReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('通知'.i18n),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final req = request.rebuild((builder) {
            builder
              ..vars.limit = config.graphqlQueryLimit
              ..vars.offset = 0;
          });
          client.value?.requestController.add(req);
          await Future.delayed(const Duration(seconds: 2));
        },
        child: OperationBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final notificationList = response.data?.viewer?.notifications;
            if (notificationList == null) {
              return const DataNotFoundErrorContainer();
            }
            if (notificationList.isEmpty) {
              return const DataEmptyErrorContainer();
            }
            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 8),
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                final notification = notificationList[index];
                if (notification
                    is GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode) {
                  final user = notification.user;
                  final work = notification.work;
                  return NotificationLikedWorkListTile(
                    createdAt: notification.createdAt,
                    userId: user?.id,
                    userName: user?.name,
                    userIconImageURL: user?.iconUrl,
                    workId: notification.work?.id,
                    workTitle: work?.title,
                    workImageURL: work?.largeThumbnailImageURL,
                  );
                }
                if (notification
                    is GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode) {
                  return NotificationLikedWorksSummaryListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                  );
                }
                if (notification
                    is GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode) {
                  final work = notification.work;
                  return NotificationWorkAwardListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                    workId: notification.work?.id,
                    workTitle: work?.title,
                    workImageURL: work?.largeThumbnailImageURL,
                  );
                }
                if (notification
                    is GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode) {
                  final user = notification.user;
                  final work = notification.work;
                  final sticker = notification.sticker;
                  return NotificationWorkCommentListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                    userId: user?.id,
                    userName: user?.name,
                    userIconImageURL: user?.iconUrl,
                    workId: notification.work?.id,
                    workTitle: work?.title,
                    workImageURL: work?.largeThumbnailImageURL,
                    stickerImageURL: sticker?.imageUrl,
                  );
                }
                if (notification
                    is GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode) {
                  final user = notification.user;
                  final work = notification.work;
                  final sticker = notification.sticker;
                  return NotificationWorkCommentReplyListTile(
                    createdAt: notification.createdAt,
                    message: notification.message,
                    userId: user?.id,
                    userName: user?.name,
                    userIconImageURL: user?.iconUrl,
                    workId: notification.work?.id,
                    workTitle: work?.title,
                    workImageURL: work?.largeThumbnailImageURL,
                    stickerImageURL: sticker?.imageUrl,
                  );
                }
                if (notification
                    is GViewerNotificationsData_viewer_notifications__asFollowNotificationNode) {
                  final user = notification.user;
                  return NotificationFollowListTile(
                    createdAt: notification.createdAt,
                    userId: user?.id,
                    userName: user?.name,
                    userIconImageURL: user?.iconUrl,
                  );
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
