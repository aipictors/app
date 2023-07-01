import 'package:aipictors/providers/config_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var isDuplicated = false;

typedef Listener = void Function(
  AsyncValue<RemoteConfigUpdate>? _,
  AsyncValue<RemoteConfigUpdate> state,
);

/// RemoteConfigの変更を監視する
Listener buildRemoteConfigListener(BuildContext context, WidgetRef ref) {
  return (_, state) async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    final notifier = ref.read(configProvider.notifier);
    // 設定を変更する
    notifier.rebuild();
  };
}
