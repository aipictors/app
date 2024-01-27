import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_message_provider.g.dart';

@riverpod
Stream<RemoteMessage> backgroundMessage(BackgroundMessageRef ref) {
  return FirebaseMessaging.onMessageOpenedApp;
}
