import 'package:aipictors/features/user/widgets/__generated__/user_header_profile.data.gql.dart';
import 'package:aipictors/utils/to_readable_number.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfile extends HookConsumerWidget {
  const UserProfile({
    super.key,
    required this.user,
  });

  final GUserHeaderProfile user;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user.biography != null) const SizedBox(height: 4),
          if (user.biography != null) Text(user.biography!),
          const SizedBox(height: 4),
          InkWell(
            onTap: () {
              context.push('/users/${user.id}/followers');
            },
            child: Text(
              '${toReadableNumber(user.followersCount)}人のユーザにフォローされています。',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                'いいね ${toReadableNumber(user.receivedLikesCount)}件',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
              const SizedBox(width: 12),
              Text(
                '閲覧 ${toReadableNumber(user.receivedViewsCount)}回',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
              const SizedBox(width: 12),
              Text(
                '入賞回数 ${toReadableNumber(user.awardsCount)}回',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
