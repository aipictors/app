import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/sticker/__generated__/user_stickers.req.gql.dart';
import 'package:aipictors/features/sticker/widgets/stickers_grid_view.dart';
import 'package:aipictors/features/sticker/widgets/stickers_header_container.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/stickers_screen_cross_axis_count_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 保存したスタンプ
class MyStickersScreen extends HookConsumerWidget {
  const MyStickersScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final config = ref.watch(configProvider);

    final crossAxisCount = ref.watch(stickersScreenCrossAxisCountProvider);

    final layout = Layout.fromWidthAndConfig(
      MediaQuery.of(context).size.width,
      config,
    );

    final searchText = useState('');

    if (client.value == null) {
      return const LoadingProgress();
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

          final filteredStickerList = searchText.value == ''
              ? stickerList
              : stickerList
                  .where((p0) => p0.title.contains(searchText.value))
                  .toBuiltList();

          return Column(children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: StickersHeaderContainer(
                currentSize: crossAxisCount,
                maxItems: layout.notCompact ? 5 : 2,
                onSubmit: (String text) async {
                  searchText.value = text;
                },
                onSizeChanged: (int size) {
                  final notifier =
                      ref.read(stickersScreenCrossAxisCountProvider.notifier);
                  notifier.update(size);
                },
              ),
            ),
            if (filteredStickerList.isEmpty) ...[
              const Spacer(),
              DataEmptyErrorContainer(message: 'あなたのスタンプは無いみたい。'.i18n),
              const Spacer(),
            ],
            const SizedBox(height: 16),
            if (filteredStickerList.isNotEmpty)
              Expanded(
                child: StickersGridView(
                  stickerList: filteredStickerList,
                  crossAxisCount: crossAxisCount,
                ),
              )
          ]);
        },
      ),
    );
  }
}
