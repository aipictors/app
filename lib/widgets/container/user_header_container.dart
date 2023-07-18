import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/widgets/avatar/header_user_profile_avatar.dart';
import 'package:aipictors/widgets/button/follow_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserHeaderContainer extends HookConsumerWidget {
  const UserHeaderContainer({
    Key? key,
    required this.userId,
    required this.iconImageURL,
  }) : super(key: key);

  final String userId;

  final String? iconImageURL;

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
            Row(
              children: [
                FollowButton(onPressed: () {
                  return onFollowUser(context);
                }),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /// フォローする
  onFollowUser(BuildContext context) {
    return followUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }
}
