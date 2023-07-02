import 'package:aipictors/providers/query_viewer_notifications_provider.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/empty_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
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
        onRefresh: () async {},
        child: query.when(
          error: (error, stackTrace) {
            print(error);
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
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(notification.message),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
