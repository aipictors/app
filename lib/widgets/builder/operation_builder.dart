import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/empty_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/operation_error_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OperationBuilder<T, U> extends HookConsumerWidget {
  const OperationBuilder({
    Key? key,
    required this.client,
    required this.operationRequest,
    required this.isEmpty,
    required this.builder,
  }) : super(key: key);

  final Client client;

  final OperationRequest<T, U> operationRequest;

  final bool? Function(T? data)? isEmpty;

  final bool? Function(T? data)? notFound;

  final Widget Function(T data) builder;

  @override
  Widget build(context, ref) {
    return Operation(
      client: client,
      operationRequest: operationRequest,
      builder: (context, response, error) {
        if (error != null) {
          return const UnexpectedErrorContainer();
        }

        if (response == null || response.loading) {
          return const LoadingContainer();
        }

        if (response.graphqlErrors != null) {
          return OperationErrorContainer(errors: response.graphqlErrors!);
        }

        final data = response.data;

        if (data == null) {
          return const DataNotFoundErrorContainer();
        }

        if (notFound != null) {
          final bool = notFound!(data);
          if (bool == null) {
            return const DataNotFoundErrorContainer();
          }
          if (bool) {
            return const DataNotFoundErrorContainer();
          }
        }

        if (isEmpty != null) {
          final bool = isEmpty!(data);
          if (bool == null) {
            return const DataNotFoundErrorContainer();
          }
          if (bool) {
            return const EmptyErrorContainer();
          }
        }

        return builder(data);
      },
    );
  }
}
