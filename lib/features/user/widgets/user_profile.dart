import 'package:aipictors/features/user/widgets/__generated__/user_profile.data.gql.dart';
import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfile extends HookConsumerWidget {
  const UserProfile({
    super.key,
    required this.user,
  });

  final GUserProfile? user;

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
