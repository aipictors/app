import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/widgets/button/follow_button.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumHeader extends HookConsumerWidget {
  const AlbumHeader({
    super.key,
    required this.albumId,
    required this.albumTitle,
    required this.albumDescription,
    required this.userId,
    required this.userName,
    required this.userIconImageURL,
    required this.isFollowee,
    required this.onFollow,
  });

  final String albumId;

  final String albumTitle;

  final String albumDescription;

  final String userId;

  final String userName;

  final String userIconImageURL;

  final bool isFollowee;

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
                  context.push('/users/$userId');
                },
                child: NotificationUserContainer(
                  userName: userName,
                  userIconImageURL: userIconImageURL,
                ),
              ),
            ),
            if (authUserId.value != userId)
              FollowButton(
                isActive: isFollowee,
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
            albumTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(albumDescription),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
