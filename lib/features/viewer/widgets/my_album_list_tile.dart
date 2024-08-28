import 'package:aipictors/features/viewer/widgets/__generated__/my_album_list_tile.data.gql.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyAlbumListTile extends HookConsumerWidget {
  const MyAlbumListTile({
    super.key,
    required this.album,
  });

  final GMyAlbumListTile album;

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
        album.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: ListTileImage(thumbnailImageURL: album.thumbnailImageURL),
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'album',
          itemId: album.id,
        );
        context.push('/albums/${album.id}');
      },
    );
  }
}
