import 'package:aipictors/features/user/widgets/album_list_tile.dart';
import 'package:aipictors/graphql/__generated__/user_albums.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserAlbumsContainer extends HookConsumerWidget {
  const UserAlbumsContainer({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    return OperationBuilder(
      client: client.value!,
      operationRequest: GUserAlbumsReq((builder) {
        builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.user_id = userId
          ..vars.offset = 0;
      }),
      builder: (context, response) {
        final albumList = response.data?.user?.albums;
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
              userName: null,
              userIconImageURL: null,
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
    );
  }
}
