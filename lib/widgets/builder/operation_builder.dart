import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/error/operation_error_container.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:aipictors/utils/to_exception_message.dart';
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
      if (response?.data != null) {
        return builder(context, response!);
      }
      return UnexpectedErrorContainer(message: toExceptionMessage(error));
        }

        if (response?.linkException?.originalException != null) {
      if (response?.data != null) {
        return builder(context, response!);
      }
      return UnexpectedErrorContainer(
        message: toExceptionMessage(response!.linkException!.originalException),
      );
        }

        // Ferry can emit `loading: true` even when cached/previous data is
        // available (e.g. cache-and-network). Prefer showing existing data to
        // avoid the UI snapping back to a spinner.
        if (response == null || (response.loading && response.data == null)) {
          return const LoadingProgress();
        }

        final data = response.data;

		// GraphQL can return partial data with errors. Prefer showing data when available.
		if (response.graphqlErrors != null && data == null) {
			return OperationErrorContainer(errorList: response.graphqlErrors!);
		}

        if (data == null) {
          return const DataNotFoundErrorContainer();
        }

        return builder(context, response);
      },
    );
  }
}
