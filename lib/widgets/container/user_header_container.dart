import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../avatar/user_profile_avatar.dart';
import '../button/follow_button.dart';

class UserHeaderContainer extends HookConsumerWidget {
  const UserHeaderContainer({
    Key? key,
    required this.iconImageURL,
    required this.headerImageURL,
  }) : super(key: key);

  final String? iconImageURL;

  final String? headerImageURL;

  @override
  Widget build(context, ref) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                if (iconImageURL != null)
                  Transform.scale(
                    scale: 1,
                    child: UserProfileAvatar(downloadURL: iconImageURL!),
                  ),
              ],
            ),
            const Row(
              children: [
                FollowButton(),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
