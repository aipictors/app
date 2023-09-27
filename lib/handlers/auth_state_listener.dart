import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

typedef Listener = void Function(
  AsyncValue<User?>? _,
  AsyncValue<User?> state,
);

Listener authStateListener(BuildContext context, WidgetRef ref) {
  return (_, state) {
    final notifier = ref.read(homeTabIndexProvider.notifier);

    // ログイン状態が変わった際にホームに戻す
    notifier.update(0);

    // ログイン状態を更新する
    FirebaseAnalytics.instance.setUserProperty(
      name: 'is_logged_in',
      value: state.value != null ? 'true' : 'false',
    );

    // ユーザIDを記録する
    state.value?.getIdTokenResult().then((value) {
      final String? userId = value.claims?['userId'];
      if (userId == null) return;
      FirebaseAnalytics.instance.setUserId(id: state.value?.uid);
      Sentry.configureScope((scope) {
        scope.setUser(
          SentryUser(
            id: userId,
            email: state.value?.email,
            name: state.value?.displayName,
          ),
        );
      });
    });
  };
}
