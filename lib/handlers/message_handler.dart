import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/widgets/dialog/notification_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

typedef Listener = void Function(
  AsyncValue<RemoteMessage?>? _,
  AsyncValue<RemoteMessage?> state,
);

Listener messageListener(BuildContext context, WidgetRef ref) {
  return (_, state) async {
    try {
      final count = const ConfigRepository().badgeCount;

      await AppBadgePlus.updateBadge(count);

      final remoteMessage = state.value;

      if (remoteMessage == null) return;

      if (remoteMessage.data.isEmpty) {
        showDialog(
          context: context,
          builder: (_) {
            return NotificationDialog(
              title: remoteMessage.notification?.title,
              description: remoteMessage.notification?.body,
              onClose: () {
                context.pop();
              },
            );
          },
        );
      }
    } catch (error, stackTrace) {
      // Sentry.captureException(error, stackTrace: stackTrace);
      rethrow;
    }
  };
}
