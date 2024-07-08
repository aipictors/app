import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/my/viewer_folder_list_tile.dart';
import 'package:aipictors/graphql/__generated__/viewer_folders.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///  投稿したフォルダの一覧
class ViewerFoldersScreen extends HookConsumerWidget {
  const ViewerFoldersScreen({
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
        title: Text('あなたのフォルダ'.i18n),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GViewerFoldersReq((builder) {
          builder
            ..vars.limit = config.graphqlQueryLimit
            ..vars.offset = 0;
        }),
        builder: (context, response) {
          final folderList = response.data?.viewer?.folders;
          if (folderList == null) {
            return const UnexpectedErrorContainer();
          }
          if (folderList.isEmpty) {
            return DataEmptyErrorContainer(
              message: 'あなたのフォルダは無いみたい。'.i18n,
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            itemCount: folderList.length,
            itemBuilder: (context, index) {
              final folder = folderList[index];
              return ViewerFolderListTile(
                title: folder.title,
                imageURL: folder.thumbnailImageURL,
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
      ),
    );
  }
}
