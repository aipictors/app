import 'package:aipictors/graphql/__generated__/albums.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/list_tile/album_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索・最新のアルバム
class ExplorerAlbumsView extends HookConsumerWidget {
  const ExplorerAlbumsView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GAlbumsReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });

    return RefreshIndicator(
      onRefresh: () async {
        final req = request.rebuild((builder) {
          builder;
        });
        client.value?.requestController.add(req);
        await Future.delayed(const Duration(seconds: 2));
      },
      child: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final albumList = response.data?.albums;
          if (albumList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (albumList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              final album = albumList[index];
              return AlbumListTile(
                title: album.title,
                userName: album.user.name,
                userIconImageURL: album.user.iconUrl,
                imageURL: album.thumbnailImageURL,
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'album',
                    itemId: album.id,
                  );
                  context.push('/albums/${album.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
