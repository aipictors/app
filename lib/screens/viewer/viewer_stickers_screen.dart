import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/user_stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/view/stickers_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 保存したスタンプ
class ViewerStickersScreen extends HookConsumerWidget {
  const ViewerStickersScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final config = ref.watch(configProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    return Scaffold(
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GUserStickersReq((builder) {
          return builder
            ..vars.limit = config.graphqlQueryLimit
            ..vars.offset = 0;
        }),
        builder: (context, response) {
          final stickerList = response.data?.viewer?.userStickers;
          if (stickerList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (stickerList.isEmpty) {
            return DataEmptyErrorContainer(
              message: 'あなたのスタンプは無いみたい。'.i18n,
            );
          }
          return StickersGridView(stickerList: stickerList!);
        },
      ),
    );
  }
}
