import 'package:aipictors/widgets/container/list_tile_image_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagListTile extends HookConsumerWidget {
  const TagListTile({
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
