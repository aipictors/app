import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmptyErrorContainer extends HookConsumerWidget {
  const EmptyErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return const Center(
      child: Text(
        'まだデータが空です。',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
