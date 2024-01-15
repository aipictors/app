import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aipictors/widgets/container/list_tile_image_container.dart';

/// 作品・シリーズ・コレクション等に利用できる、汎用ウィジェット
class WorkInfoListTile extends HookConsumerWidget {
  const WorkInfoListTile({
    super.key,
    required this.thumbnailImageURL,
    required this.title,
    required this.body,
    required this.onTap,
  });

  final String thumbnailImageURL;

  final String title;

  final Widget body;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      leading: ListTileImageContainer(thumbnailImageURL: thumbnailImageURL),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: body,
      onTap: onTap,
    );
  }
}
