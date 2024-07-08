import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagListTile extends HookConsumerWidget {
  const TagListTile({
    super.key,
    required this.title,
    required this.imageURL,
    required this.onTap,
  });

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
        top: 0,
        bottom: 0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Container(),
      onTap: onTap,
      trailing: ListTileImageContainer(
        thumbnailImageURL: imageURL,
      ),
    );
  }
}
