import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'foreground_message_provider.g.dart';

typedef State = Stream<RemoteMessage>;

@riverpod
State foregroundMessage(ForegroundMessageRef ref) {
  return FirebaseMessaging.onMessage;
}
