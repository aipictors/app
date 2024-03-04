import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/view/stickers_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スタンプ広場
class StickersSpaceScreen extends HookConsumerWidget {
  const StickersSpaceScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    final config = ref.watch(configProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return OperationBuilder(
      client: client.value!,
      operationRequest: GStickersReq((builder) {
        return builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.offset = 0;
      }),
      builder: (context, response) {
        final stickerList = response.data?.stickers;
        if (stickerList == null) {
          return const UnexpectedErrorContainer();
        }
        if (stickerList.isEmpty) {
          return DataEmptyErrorContainer(
            message: 'スタンプは無いみたい。'.i18n,
          );
        }
        return StickersGridView(
          stickerList: stickerList,
        );
      },
    );
  }
}
