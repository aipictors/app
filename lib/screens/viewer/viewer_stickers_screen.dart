import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/graphql/__generated__/user_stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/stickers_screen_cross_axis_count_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/button/adjust_sticker_size_button.dart';
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

    final crossAxisCount = ref.watch(stickersScreenCrossAxisCountProvider);

    final layout =
        Layout.fromWidthAndConfig(MediaQuery.of(context).size.width, config);

    if (client.value == null) {
      return const LoadingContainer();
    }

    return Scaffold(
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GUserStickersReq((builder) {
          builder
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
          return Column(children: [
            // TODO: マイスタンプの検索機能を実装する
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdjustStickerSizeButton(
                  currentSize: crossAxisCount,
                  maxItems: layout.notCompact ? 5 : 2,
                  onSizeChanged: (int size) async {
                    final notifier =
                        ref.read(stickersScreenCrossAxisCountProvider.notifier);
                    notifier.update(size);
                  },
                ),
              ],
            ),
            Expanded(
              child: StickersGridView(
                stickerList: stickerList,
                crossAxisCount: crossAxisCount,
              ),
            )
          ]);
        },
      ),
    );
  }
}
