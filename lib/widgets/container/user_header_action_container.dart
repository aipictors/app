import 'package:aipictors/widgets/avatar/header_user_profile_avatar.dart';
import 'package:aipictors/widgets/button/follow_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserHeaderActionContainer extends HookConsumerWidget {
  const UserHeaderActionContainer({
    Key? key,
    required this.iconImageURL,
    required this.userName,
  }) : super(key: key);

  final String? iconImageURL;

  final String userName;

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
                Transform.scale(
                  scale: 1,
                  child: HeaderUserProfileAvatar(imageURL: iconImageURL),
                ),
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FollowButton(),
                      SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
