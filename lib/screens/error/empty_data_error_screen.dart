import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// エラー（データが空）
class EmptyDataErrorScreen extends HookConsumerWidget {
  const EmptyDataErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const DataEmptyErrorContainer(),
    );
  }
}
