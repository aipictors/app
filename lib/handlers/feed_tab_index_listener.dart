import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef Listener = void Function(
  int? _,
  int state,
);

// 廃止予定
Listener feedTabIndexListener(BuildContext context, WidgetRef ref) {
  return (_, state) async {};
}
