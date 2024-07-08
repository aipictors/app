import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// エラー（不明）
class UnexpectedErrorScreen extends HookConsumerWidget {
  const UnexpectedErrorScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const UnexpectedErrorContainer(),
    );
  }
}
