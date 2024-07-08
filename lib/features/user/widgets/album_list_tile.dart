import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumListTile extends HookConsumerWidget {
  const AlbumListTile({
    super.key,
    required this.title,
    required this.userName,
    required this.userIconImageURL,
    required this.imageURL,
    required this.onTap,
  });

  final String title;

  final String? userName;

  final String? userIconImageURL;

  final String? imageURL;

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
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(overflow: TextOverflow.ellipsis),
      ),
      subtitle: userName != null ? Text(userName!) : const Text(''),
      onTap: onTap,
      trailing: ListTileImageContainer(thumbnailImageURL: imageURL),
    );
  }
}
