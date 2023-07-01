import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_update_provider.g.dart';

@riverpod
Stream<RemoteConfigUpdate> configUpdate(ConfigUpdateRef ref) {
  ref.keepAlive();
  return FirebaseRemoteConfig.instance.onConfigUpdated;
}
