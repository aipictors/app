import 'package:aipictors/features/user/widgets/__generated__/user_folder_list_tile.data.gql.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserFolderListTile extends HookConsumerWidget {
  const UserFolderListTile({
    super.key,
    required this.folder,
    required this.onTap,
  });

  final GUserFolderListTile folder;

  final VoidCallback? onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        right: 8 * 2,
        left: 8 * 2,
        top: 0,
        bottom: 0,
      ),
      title: Text(
        folder.title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(overflow: TextOverflow.ellipsis),
      ),
      subtitle: const Text(''),
      onTap: onTap,
      trailing: ListTileImage(thumbnailImageURL: folder.thumbnailImageURL),
    );
  }
}
