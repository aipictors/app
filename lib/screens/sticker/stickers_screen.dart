import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/stickers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/sticker_grid_item_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スタンプの一覧
class StickersScreen extends HookConsumerWidget {
  const StickersScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('スタンプ'.i18n),
      ),
      body: OperationBuilder(
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
              message: 'あなたのスタンプは無いみたい。'.i18n,
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.725,
            ),
            itemCount: stickerList.length,
            itemBuilder: (context, index) {
              final sticker = stickerList[index];
              return StickerGridItemContainer(
                title: sticker.title,
                imageUrl: sticker.image!.downloadURL,
                downloadsCount: sticker.downloadsCount,
                usesCount: sticker.usesCount,
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'sticker',
                    itemId: sticker.id,
                  );
                  context.push('/stickers/${sticker.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
