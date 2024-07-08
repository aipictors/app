import 'package:aipictors/mutations/follow_user.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/routes/user/widgets/follow_button.dart';
import 'package:aipictors/routes/user/widgets/header_user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserHeaderActionContainer extends HookConsumerWidget {
  const UserHeaderActionContainer({
    super.key,
    required this.iconImageURL,
    required this.userId,
    required this.userName,
    required this.userLogin,
    required this.isFollowee,
  });

  final String? iconImageURL;

  final String userId;

  final String userName;

  final String userLogin;

  final bool isFollowee;

  @override
  Widget build(context, ref) {
    final authUserId = ref.watch(authUserIdProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    softWrap: true,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@$userLogin',
                    style: TextStyle(color: Theme.of(context).dividerColor),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Transform.scale(
                scale: 1,
                child: HeaderUserProfileAvatar(imageURL: iconImageURL),
              ),
            ],
          ),
          if (authUserId.value != null) ...[
            const SizedBox(height: 8),
            if (authUserId.value != userId)
              SizedBox(
                width: double.infinity,
                child: FollowButton(
                  isActive: isFollowee,
                  onPressed: () {
                    return onFollowUser(context);
                  },
                ),
              ),
            const SizedBox(height: 8),
          ]
        ],
      ),
    );
  }

  /// フォローする
  onFollowUser(BuildContext context) {
    return followUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }
}
