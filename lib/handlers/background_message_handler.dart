import 'package:aipictors/repositories/config_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_badge_plus/app_badge_plus.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  final count = const ConfigRepository().badgeCount + 1;
  await AppBadgePlus.updateBadge(count);
}
