import 'package:aipictors/graphql/__generated__/albums.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/list_tile/folder_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索・最新のアルバム
class ExplorerAlbumsView extends HookConsumerWidget {
  const ExplorerAlbumsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GAlbumsReq((builder) {
      return builder
        ..vars.limit = 32
        ..vars.offset = 0;
    });

    return RefreshIndicator(
      onRefresh: () async {
        final req = request.rebuild((builder) {
          return builder;
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
              final folder = albumList[index];
              return FolderListTile(
                title: folder.title,
                userName: folder.user.name,
                userIconImageURL: folder.user.iconImage?.downloadURL,
                imageURL: folder.thumbnailImage?.downloadURL,
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'album',
                    itemId: folder.id,
                  );
                  context.push('/albums/${folder.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
