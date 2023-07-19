import 'package:aipictors/widgets/container/list_tile_image_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewerFolderListTile extends HookConsumerWidget {
  const ViewerFolderListTile({
    Key? key,
    required this.title,
    required this.imageURL,
    required this.onTap,
  }) : super(key: key);

  final String title;

  final String? imageURL;

  final VoidCallback? onTap;

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
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: onTap,
      trailing: ListTileImageContainer(thumbnailImageURL: imageURL),
    );
  }
}
