import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/generation/generation_screen.dart';
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

/// Push を受け取ったとき。[opened] は通知を押してアプリを開いたとき（false はアプリを開いている最中に届いたとき）
Listener messageListener(BuildContext context, WidgetRef ref, {bool opened = true}) {
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
        return;
      }

      final type = remoteMessage.data['type']?.toString();
      final url = remoteMessage.data['url']?.toString() ?? '';

      // 使っている最中に届いたものは、画面を切り替えずに下に出すだけ（押すと開く）
      if (!opened) {
        final title = remoteMessage.notification?.title;
        if (title == null || !context.mounted) return;
        final messenger = ScaffoldMessenger.maybeOf(context);
        messenger?.hideCurrentSnackBar();
        messenger?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Row(children: [
              Icon(type == 'generation' ? Icons.auto_awesome_rounded : Icons.notifications_rounded, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Expanded(child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis)),
            ]),
            action: SnackBarAction(label: tr('見る', 'View'), onPressed: () => _open(context, ref, type, url)),
            duration: const Duration(seconds: 5),
          ),
        );
        return;
      }

      if (context.mounted) _open(context, ref, type, url);
    } catch (error, stackTrace) {
      // Sentry.captureException(error, stackTrace: stackTrace);
      rethrow;
    }
  };
}

/// 通知の行き先（生成 → 生成の履歴、ランキング → 作品、リクエスト → 依頼、ほかは通知タブ）
void _open(BuildContext context, WidgetRef ref, String? type, String url) {
  final tabs = ref.read(homeTabIndexProvider.notifier);
  switch (type) {
    case 'generation':
      Ds.tap();
      GenerationScreen.openHistory.value++;
      tabs.update(2);
    case 'ranking' || 'request' when url.startsWith('/works/') || url.startsWith('/requests/'):
      context.push(url);
    default:
      // 中身のある Push を開いたら通知タブへ
      tabs.update(3);
  }
}
