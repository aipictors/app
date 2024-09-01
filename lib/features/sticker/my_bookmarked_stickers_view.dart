import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/sticker/__generated__/my_bookmarked_stickers.req.gql.dart';
import 'package:aipictors/features/sticker/widgets/stickers_grid_view.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/stickers_screen_cross_axis_count_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ブックマークしたスタンプ
class MyBookmarkedStickersView extends HookConsumerWidget {
  const MyBookmarkedStickersView(
    this.type, {
    super.key,
  });

  final GBookmarkedStickerType type;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final config = ref.watch(configProvider);

    final crossAxisCount = ref.watch(stickersScreenCrossAxisCountProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    return OperationBuilder(
      client: client.value!,
      operationRequest: GMyBookmarkedStickersReq((builder) {
        builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.offset = 0
          ..vars.type = type;
      }),
      builder: (context, response) {
        final stickerList = response.data?.viewer?.bookmarkedStickers;
        if (stickerList == null) {
          return const DataNotFoundErrorContainer();
        }
        return Column(children: [
          const SizedBox(height: 16),
          if (stickerList.isEmpty) ...[
            const Spacer(),
            DataEmptyErrorContainer(message: 'ブックマークしたスタンプは無いみたい。'.i18n),
            const Spacer(),
          ],
          const SizedBox(height: 16),
          if (stickerList.isNotEmpty)
            Expanded(
              child: StickersGridView(
                stickerList: stickerList,
                crossAxisCount: crossAxisCount,
              ),
            )
        ]);
      },
    );
  }
}
