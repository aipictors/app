import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationFollowListTile extends HookConsumerWidget {
  const NotificationFollowListTile({
    Key? key,
    required this.createdAt,
    required this.message,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
  }) : super(key: key);

  final int createdAt;

  final String message;

  final String? userId;

  final String? userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    return ListTile(
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'user',
          itemId: userId!,
        );
        context.push('/users/$userId');
      },
      leading: Icon(
        Icons.handshake_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NotificationUserContainer(
            userName: userName!,
            userIconImageURL: userIconImageURL,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
