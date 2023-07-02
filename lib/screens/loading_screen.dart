import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingScreen extends HookConsumerWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
