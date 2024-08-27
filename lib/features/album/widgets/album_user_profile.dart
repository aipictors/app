import 'package:aipictors/features/album/widgets/__generated__/album_user_profile.data.gql.dart';
import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumUserProfile extends HookConsumerWidget {
  const AlbumUserProfile({
    super.key,
    required this.user,
  });

  final GAlbumUserProfile? user;

  @override
  Widget build(context, ref) {
    if (user == null) {
      return const SizedBox();
    }

    return Row(
      children: [
        UserProfileAvatar(imageURL: user!.iconUrl),
        const SizedBox(width: 12),
        Flexible(
            child: Text(
          user!.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        )),
      ],
    );
  }
}
