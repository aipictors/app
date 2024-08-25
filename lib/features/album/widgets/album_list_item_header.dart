import 'package:aipictors/features/album/widgets/__generated__/album_list_item_header.data.gql.dart';
import 'package:aipictors/features/notification/widgets/notification_user_container.dart';
import 'package:aipictors/features/user/widgets/follow_button.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumListItemHeader extends HookConsumerWidget {
  const AlbumListItemHeader({
    super.key,
    required this.album,
    required this.onFollow,
  });

  final GAlbumListItemHeader album;

  final Future<dynamic> Function() onFollow;

  @override
  Widget build(context, ref) {
    final authUserId = ref.watch(authUserIdProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.push('/users/${album.user.id}');
                },
                child: NotificationUserContainer(
                  userName: album.user.name,
                  userIconImageURL: album.user.iconUrl,
                ),
              ),
            ),
            if (authUserId.value != album.user.id)
              FollowButton(
                isActive: album.user.isFollowee,
                onPressed: () {
                  return onFollow();
                },
              ),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            album.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(album.description),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
