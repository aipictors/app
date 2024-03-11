import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/error/operation_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemesOperationBuilder<T, U> extends HookConsumerWidget {
  const DailyThemesOperationBuilder({
    super.key,
    required this.client,
    required this.cacheOnlyOperationRequest,
    required this.networkOnlyOperationRequest,
    required this.builder,
  });

  final Client client;

  final OperationRequest<T, U> cacheOnlyOperationRequest;
  final OperationRequest<T, U> networkOnlyOperationRequest;

  final Widget Function(
    BuildContext context,
    OperationResponse<T, U> response,
  ) builder;

  @override
  Widget build(context, ref) {
    final useCache = useState(true);
    if (useCache.value) {
      final dynamic result = client.cache.readQuery(cacheOnlyOperationRequest);

      if (result == null) {
        useCache.value = false;
      } else if (result.dailyThemes.length >= 2 &&
          result.dailyThemes.first.day == 1) {
        useCache.value = false;
      }
    }
    print(useCache.value);
    useCache.value = true;
    return Operation(
      client: client,
      operationRequest: useCache.value
          ? cacheOnlyOperationRequest
          : networkOnlyOperationRequest,
      builder: (context, response, error) {
        if (error != null) {
          return const UnexpectedErrorContainer();
        }

        if (response?.linkException?.originalException != null) {
          return const UnexpectedErrorContainer();
        }

        if (response == null || response.loading) {
          return const LoadingContainer();
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
