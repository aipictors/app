import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_albums.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/list_tile/viewer_folder_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///  投稿したアルバムの一覧
class ViewerAlbumsScreen extends HookConsumerWidget {
  const ViewerAlbumsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('あなたのシリーズ'.i18n),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GViewerAlbumsReq((builder) {
          return builder
            ..vars.limit = 16
            ..vars.offset = 0;
        }),
        builder: (context, response) {
          final albumList = response.data?.viewer?.albums;
          if (albumList == null) {
            return const UnexpectedErrorContainer();
          }
          if (albumList.isEmpty) {
            return DataEmptyErrorContainer(
              message: 'あなたのシリーズは無いみたい。'.i18n,
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              final folder = albumList[index];
              return ViewerFolderListTile(
                title: folder.title,
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
