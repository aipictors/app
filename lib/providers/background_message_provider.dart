import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_message_provider.g.dart';

typedef State = Stream<RemoteMessage>;

@riverpod
State backgroundMessage(BackgroundMessageRef ref) {
  return FirebaseMessaging.onMessageOpenedApp;
}
