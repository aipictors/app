import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var isDuplicated = false;

typedef Listener = void Function(
  AsyncValue<User?>? _,
  AsyncValue<User?> state,
);

Listener buildAuthStateListener(BuildContext context, WidgetRef ref) {
  return (_, state) async {
    if (state.value == null) {
      await FirebaseAnalytics.instance.setUserId(id: null);
      return;
    }

    await FirebaseAnalytics.instance.setUserId(id: state.value!.uid);
  };
}
