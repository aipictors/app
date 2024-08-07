import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// エラー（データが空）
class EmptyDataErrorScreen extends HookConsumerWidget {
  const EmptyDataErrorScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const DataEmptyErrorContainer(),
    );
  }
}
