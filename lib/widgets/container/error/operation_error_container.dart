import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OperationErrorContainer extends HookConsumerWidget {
  const OperationErrorContainer({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<GraphQLError> errors;

  @override
  Widget build(context, ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (final error in errors) Text(error.message),
      ],
    );
  }
}
