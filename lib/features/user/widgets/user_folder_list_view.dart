import 'package:aipictors/features/user/__generated__/user_folders.req.gql.dart';
import 'package:aipictors/features/user/widgets/user_folder_list_tile.dart';
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

class UserFolderListView extends HookConsumerWidget {
  const UserFolderListView({
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
      operationRequest: GUserFoldersReq((builder) {
        builder
          ..vars.limit = config.graphqlQueryLimit
          ..vars.user_id = userId
          ..vars.offset = 0;
      }),
      builder: (context, response) {
        final folderList = response.data?.user?.folders;
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
            return UserFolderListTile(
              folder: folder,
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
