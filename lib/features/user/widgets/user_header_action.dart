import 'package:aipictors/features/user/functions/follow_user.dart';
import 'package:aipictors/features/user/widgets/__generated__/user_header_action.data.gql.dart';
import 'package:aipictors/features/user/widgets/follow_button.dart';
import 'package:aipictors/features/user/widgets/header_user_profile_avatar.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserHeaderAction extends HookConsumerWidget {
  const UserHeaderAction({
    super.key,
    required this.user,
  });

  final GUserHeaderAction user;

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
                    user.name,
                    softWrap: true,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@${user.login}',
                    style: TextStyle(color: Theme.of(context).dividerColor),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Transform.scale(
                scale: 1,
                child: HeaderUserProfileAvatar(imageURL: user.iconUrl),
              ),
            ],
          ),
          if (authUserId.value != null) ...[
            const SizedBox(height: 8),
            if (authUserId.value != user.id)
              SizedBox(
                width: double.infinity,
                child: FollowButton(
                  isActive: user.isFollowee,
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
      return builder..vars.input.userId = user.id;
    });
  }
}
