import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

typedef Listener = void Function(
  AsyncValue<User?>? _,
  AsyncValue<User?> state,
);

Listener authStateListener(BuildContext context, WidgetRef ref) {
  return (_, state) async {
    final notifier = ref.read(homeTabIndexProvider.notifier);

    // ログイン状態が変わった際にホームに戻す
    notifier.update(0);

    // ログイン状態を更新する
    FirebaseAnalytics.instance.setUserProperty(
      name: 'is_logged_in',
      value: state.value != null ? 'true' : 'false',
    );

    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) return;

    final idTokenResult = await currentUser.getIdTokenResult();

    final String? userId = idTokenResult.claims?['userId'];

    if (userId == null) return;

    // ユーザIDを記録する
    FirebaseAnalytics.instance.setUserId(id: state.value?.uid);

    // ユーザIDを記録する
    // Sentry.configureScope((scope) {
    //   final sentryUser = SentryUser(
    //     id: userId,
    //     email: state.value?.email,
    //     name: state.value?.displayName,
    //   );
    //   scope.setUser(sentryUser);
    // });
  };
}
