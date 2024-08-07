import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/error/operation_error_container.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OperationBuilder<T, U> extends HookConsumerWidget {
  const OperationBuilder({
    super.key,
    required this.client,
    required this.operationRequest,
    required this.builder,
  });

  final Client client;

  final OperationRequest<T, U> operationRequest;

  final Widget Function(
    BuildContext context,
    OperationResponse<T, U> response,
  ) builder;

  @override
  Widget build(context, ref) {
    return Operation(
      client: client,
      operationRequest: operationRequest,
      builder: (context, response, error) {
        if (error != null) {
          return const UnexpectedErrorContainer();
        }

        if (response?.linkException?.originalException != null) {
          return const UnexpectedErrorContainer();
        }

        if (response == null || response.loading) {
          return const LoadingProgress();
        }

        if (response.graphqlErrors != null) {
          return OperationErrorContainer(errorList: response.graphqlErrors!);
        }

        final data = response.data;

        if (data == null) {
          return const DataNotFoundErrorContainer();
        }

        return builder(context, response);
      },
    );
  }
}
