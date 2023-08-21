import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef Listener = void Function(
  AsyncValue<User?>? _,
  AsyncValue<User?> state,
);

Listener authStateListener(BuildContext context, WidgetRef ref) {
  return (_, state) async {
    // ログイン状態を更新する
    FirebaseAnalytics.instance.setUserProperty(
      name: 'is_logged_in',
      value: state.value != null ? 'true' : 'false',
    );

    // ユーザIDを記録する
    await FirebaseAnalytics.instance.setUserId(id: state.value?.uid);
  };
}
