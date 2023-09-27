import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_message_provider.g.dart';

typedef State = Stream<RemoteMessage?>;

@riverpod
State initialMessage(InitialMessageRef ref) {
  return FirebaseMessaging.instance.getInitialMessage().asStream();
}
