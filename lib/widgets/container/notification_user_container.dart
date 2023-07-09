import 'package:aipictors/widgets/avatar/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationUserContainer extends HookConsumerWidget {
  const NotificationUserContainer({
    Key? key,
    required this.userName,
    required this.userIconImageURL,
  }) : super(key: key);

  final String userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        UserProfileAvatar(imageURL: userIconImageURL),
        const SizedBox(width: 12),
        Text(
          userName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
