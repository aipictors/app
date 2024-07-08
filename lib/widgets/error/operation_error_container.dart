import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OperationErrorContainer extends HookConsumerWidget {
  const OperationErrorContainer({
    super.key,
    required this.errorList,
  });

  final List<GraphQLError> errorList;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final error in errorList) Text(error.message),
        ],
      ),
    );
  }
}
