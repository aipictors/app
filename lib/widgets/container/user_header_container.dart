import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../avatar/user_profile_avatar.dart';
import '../button/follow_button.dart';
import 'user_header_image_container.dart';

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
    return Stack(
      children: [
        Column(
          children: [
            UserHeaderImageContainer(downloadURL: headerImageURL),
            const SizedBox(height: 54),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const SizedBox(width: 8),
                  if (iconImageURL != null)
                    UserProfileAvatar(downloadURL: iconImageURL!),
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
        ),
      ],
    );
  }
}
