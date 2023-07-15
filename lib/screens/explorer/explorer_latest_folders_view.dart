import 'package:aipictors/graphql/__generated__/folders.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/error/empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list/folder_list_tile.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplorerFoldersView extends HookConsumerWidget {
  const ExplorerFoldersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Operation(
      client: client.value!,
      operationRequest: GFoldersReq((builder) {
        return builder
          ..vars.limit = 32
          ..vars.offset = 0;
      }),
      builder: (context, response, error) {
        if (error != null) {
          return const UnexpectedErrorContainer();
        }
        if (response == null || response.loading) {
          return const LoadingContainer();
        }
        if (response.graphqlErrors != null) {
          return const UnexpectedErrorContainer();
        }
        final folders = response.data?.folders;
        if (folders == null) {
          return const DataNotFoundErrorContainer();
        }
        if (folders.isEmpty) {
          return const EmptyErrorContainer();
        }
        return ListView.builder(
          key: const PageStorageKey('explorer_latest_folders'),
          // physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          itemCount: folders.length,
          itemBuilder: (context, index) {
            final folder = folders[index];
            return FolderListTile(
              title: folder.title,
              userName: folder.user.name,
              userIconImageURL: folder.user.iconImage?.downloadURL,
              imageURL: folder.thumbnailImage?.downloadURL,
              onTap: () {
                FirebaseAnalytics.instance.logSelectContent(
                  contentType: 'folder',
                  itemId: folder.id,
                );
                context.push('/folders/${folder.id}');
              },
            );
          },
        );
      },
    );
  }
}
