import 'package:aipictors/features/viewer/widgets/__generated__/my_folder_list_tile.data.gql.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFolderListTile extends HookConsumerWidget {
  const MyFolderListTile({
    super.key,
    required this.folder,
  });

  final GMyFolderListTile folder;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 8,
        bottom: 8,
      ),
      title: Text(
        folder.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: ListTileImage(thumbnailImageURL: folder.thumbnailImageURL),
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'folder',
          itemId: folder.id,
        );
        context.push('/folders/${folder.id}');
      },
    );
  }
}
