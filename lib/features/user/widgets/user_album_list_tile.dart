import 'package:aipictors/features/user/widgets/__generated__/user_album_list_tile.data.gql.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserAlbumListTile extends HookConsumerWidget {
  const UserAlbumListTile({
    super.key,
    required this.album,
    required this.onTap,
  });

  final GUserAlbumListTile album;

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
        album.title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(overflow: TextOverflow.ellipsis),
      ),
      subtitle: const Text(''),
      onTap: onTap,
      trailing: ListTileImage(thumbnailImageURL: album.thumbnailImageURL),
    );
  }
}
