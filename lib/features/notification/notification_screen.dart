import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/notification/__generated__/notification_screen.data.gql.dart';
import 'package:aipictors/features/notification/__generated__/notification_screen.req.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_follow_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_liked_work_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_liked_works_summary_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_award_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_comment_list_tile.dart';
import 'package:aipictors/features/notification/widgets/notification_work_comment_reply_list_tile.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
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
      return const LoadingProgress();
    }

    final request = GNotificationScreenReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
                    is GNotificationScreenData_viewer_notifications__asLikedWorkNotificationNode) {
                  return NotificationLikedWorkListTile(
                    notification: notification,
                  );
                }
                if (notification
                    is GNotificationScreenData_viewer_notifications__asLikedWorksSummaryNotificationNode) {
                  return NotificationLikedWorksSummaryListTile(
                    notification: notification,
                  );
                }
                if (notification
                    is GNotificationScreenData_viewer_notifications__asWorkAwardNotificationNode) {
                  return NotificationWorkAwardListTile(
                    notification: notification,
                  );
                }
                if (notification
                    is GNotificationScreenData_viewer_notifications__asWorkCommentNotificationNode) {
                  return NotificationWorkCommentListTile(
                    notification: notification,
                  );
                }
                if (notification
                    is GNotificationScreenData_viewer_notifications__asWorkCommentReplyNotificationNode) {
                  return NotificationWorkCommentReplyListTile(
                    notification: notification,
                  );
                }
                if (notification
                    is GNotificationScreenData_viewer_notifications__asFollowNotificationNode) {
                  return NotificationFollowListTile(
                    notification: notification,
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
