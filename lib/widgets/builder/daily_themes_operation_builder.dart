import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/error/operation_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ページ切り替え時に前ページのデータがキャッシュで表示されるのを防ぐための暫定的な対応
class DailyThemesOperationBuilder<T, U> extends HookConsumerWidget {
  const DailyThemesOperationBuilder({
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
    final useCache = useState(true);

    // キャッシュの有無を確認する
    final dynamic result = client.cache.readQuery(operationRequest);
    if (result == null) {
      useCache.value = false;
    } else {
      useCache.value = true;
    }
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
          return const LoadingContainer();
        }

        // キャッシュがないはずなのにDataSourceがキャッシュなら、異なる月のデータを表示している
        if (useCache.value == false &&
            response.dataSource == DataSource.Cache) {
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
