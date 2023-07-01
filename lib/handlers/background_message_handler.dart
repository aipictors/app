import 'package:aipictors/repositories/storage_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  final count = const StorageRepository().badgeCount + 1;
  FlutterAppBadger.updateBadgeCount(count);
}
