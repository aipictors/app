import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/sticker/widgets/stickers_grid_view.dart';
import 'package:aipictors/features/viewer/queries/__generated__/viewer_bookmarked_stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/stickers_screen_cross_axis_count_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ブックマークしたスタンプ
class ViewerBookmarkedStickersScreen extends HookConsumerWidget {
  const ViewerBookmarkedStickersScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final config = ref.watch(configProvider);

    final crossAxisCount = ref.watch(stickersScreenCrossAxisCountProvider);

    final layout =
        Layout.fromWidthAndConfig(MediaQuery.of(context).size.width, config);

    final searchText = useState('');

    if (client.value == null) {
      return const LoadingProgress();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ブックマークしたスタンプ'.i18n),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GViewerBookmarkedStickersReq((builder) {
          builder
            ..vars.limit = config.graphqlQueryLimit
            ..vars.offset = 0;
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
      ),
    );
  }
}
