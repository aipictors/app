import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowerUserListTile extends HookConsumerWidget {
  const FollowerUserListTile({
    super.key,
    required this.userName,
    required this.userLogin,
    required this.userIconImageURL,
    required this.onTap,
  });

  final String userName;

  final String userLogin;

  final String? userIconImageURL;

  final VoidCallback? onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 0,
      title: Text(
        userName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text('@$userLogin'),
      onTap: onTap,
      leading: UserProfileAvatar(imageURL: userIconImageURL),
    );
  }
}
