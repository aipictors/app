import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingProgress extends HookConsumerWidget {
  const LoadingProgress({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
