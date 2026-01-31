import 'package:aipictors/features/home/widgets/data_not_found_error_screen.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/home/widgets/operation_error_screen.dart';
import 'package:aipictors/features/home/widgets/unexpected_error_screen.dart';
import 'package:aipictors/utils/to_exception_message.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OperationScreenBuilder<T, U> extends HookConsumerWidget {
  const OperationScreenBuilder({
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
      return UnexpectedErrorScreen(
        key: const ValueKey('unexpected_error_screen'),
      );
        }

    if (response?.linkException?.originalException != null) {
      if (response?.data != null) {
        return builder(context, response!);
      }
      return Scaffold(
        appBar: AppBar(title: const Text('')),
        body: UnexpectedErrorContainer(
          message: toExceptionMessage(response!.linkException!.originalException),
        ),
      );
    }

        // Ferry can emit `loading: true` while keeping previously fetched data.
        // Prefer rendering data to avoid flashing the whole screen back to a
        // loading page.
        if (response == null || (response.loading && response.data == null)) {
          return const LoadingScreen();
        }

        final data = response.data;

		if (response.graphqlErrors != null && data == null) {
			return OperationErrorScreen(errors: response.graphqlErrors!);
		}

        if (data == null) {
          return const DataNotFoundErrorScreen();
        }

        return builder(context, response);
      },
    );
  }
}
