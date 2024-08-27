import 'package:aipictors/features/user/widgets/__generated__/follower_list_tile.data.gql.dart';
import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowerUserListTile extends HookConsumerWidget {
  const FollowerUserListTile({
    super.key,
    required this.user,
    required this.onTap,
  });

  final GFollowerListTile user;

  final VoidCallback? onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 0,
      title: Text(
        user.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text('@${user.login}'),
      onTap: onTap,
      leading: UserProfileAvatar(imageURL: user.iconUrl),
    );
  }
}
