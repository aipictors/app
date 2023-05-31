import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootShell extends HookConsumerWidget {
  const RootShell({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(context, ref) {
    return child;
  }
}
