import 'package:aipictors/graphql/__generated__/folders.req.gql.dart';
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

/// 探索・最新のフォルダ
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

    return OperationBuilder(
      client: client.value!,
      operationRequest: GFoldersReq((builder) {
        return builder
          ..vars.limit = 32
          ..vars.offset = 0;
      }),
      builder: (context, response) {
        final folderList = response.data?.folders;
        if (folderList == null) {
          return const DataNotFoundErrorContainer();
        }
        if (folderList.isEmpty) {
          return const DataEmptyErrorContainer();
        }
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          itemCount: folderList.length,
          itemBuilder: (context, index) {
            final folder = folderList[index];
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
