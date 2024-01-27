import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_message_provider.g.dart';

@riverpod
Stream<RemoteMessage?> initialMessage(InitialMessageRef ref) {
  return FirebaseMessaging.instance.getInitialMessage().asStream();
}
