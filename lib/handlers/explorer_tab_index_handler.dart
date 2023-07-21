import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var isDuplicated = false;

typedef Listener = void Function(
  int? _,
  int state,
);

Listener explorerTabIndexListener(BuildContext context, WidgetRef ref) {
  return (_, state) async {};
}
