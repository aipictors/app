import 'package:aipictors/widgets/avatar/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationUserContainer extends HookConsumerWidget {
  const NotificationUserContainer({
    super.key,
    required this.userName,
    required this.userIconImageURL,
  });

  final String? userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        UserProfileAvatar(imageURL: userIconImageURL),
        const SizedBox(width: 12),
        Flexible(
            child: Text(
          userName ?? '-',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        )),
      ],
    );
  }
}
