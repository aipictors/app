import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// エラー（通信エラー）
class OperationErrorScreen extends HookConsumerWidget {
  const OperationErrorScreen({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<GraphQLError> errors;

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final error in errors) Text(error.message),
        ],
      ),
    );
  }
}
