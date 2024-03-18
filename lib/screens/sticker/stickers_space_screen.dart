import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/graphql/__generated__/stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/stickers_screen_cross_axis_count_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/stickers_header_container.dart';
import 'package:aipictors/widgets/view/stickers_grid_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final crossAxisCount = ref.watch(stickersScreenCrossAxisCountProvider);
    final searchText = useState('');
    final layout =
        Layout.fromWidthAndConfig(MediaQuery.of(context).size.width, config);

    if (client.value == null) {
      return const LoadingContainer();
    }

    return OperationBuilder(
      client: client.value!,
      operationRequest: GStickersReq((builder) {
        builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.offset = 0
          ..vars.where.search = searchText.value;
      }),
      builder: (context, response) {
        final stickerList = response.data?.stickers;
        if (stickerList == null) {
          return const UnexpectedErrorContainer();
        }
        return Column(children: [
          const SizedBox(height: 8),
          StickersHeaderContainer(
            currentSize: crossAxisCount,
            maxItems: layout.notCompact ? 5 : 2,
            onSubmit: (text) async {
              FirebaseAnalytics.instance.logSearch(searchTerm: text);
              searchText.value = text;
            },
            onSizeChanged: (int size) {
              final notifier =
                  ref.read(stickersScreenCrossAxisCountProvider.notifier);
              notifier.update(size);
            },
          ),
          const SizedBox(height: 8),
          if (stickerList.isEmpty) ...[
            const Spacer(),
            DataEmptyErrorContainer(
              message: 'スタンプは無いみたい。'.i18n,
            ),
            const Spacer(),
          ],
          if (stickerList.isNotEmpty)
            Expanded(
              child: StickersGridView(
                stickerList: stickerList,
                crossAxisCount: crossAxisCount,
              ),
            ),
        ]);
      },
    );
  }
}
