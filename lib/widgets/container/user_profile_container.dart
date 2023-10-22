import 'package:aipictors/utils/to_readable_number.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileContainer extends HookConsumerWidget {
  const UserProfileContainer({
    Key? key,
    required this.userId,
    required this.name,
    required this.login,
    required this.biography,
    required this.likesCount,
    required this.viewsCount,
    required this.followersCount,
    required this.awardsCount,
  }) : super(key: key);

  final String userId;

  final String name;

  final String login;

  final String? biography;

  final int likesCount;

  final int viewsCount;

  final int followersCount;

  final int awardsCount;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (biography != null) const SizedBox(height: 4),
          if (biography != null) Text(biography!),
          const SizedBox(height: 4),
          InkWell(
            onTap: () {
              context.push('/users/$userId/followers');
            },
            child: Text(
              '${toReadableNumber(followersCount)}人のユーザにフォローされています。',
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
                'いいね ${toReadableNumber(likesCount)}件',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
              const SizedBox(width: 12),
              Text(
                '閲覧 ${toReadableNumber(viewsCount)}回',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
              const SizedBox(width: 12),
              Text(
                '入賞回数 ${toReadableNumber(awardsCount)}回',
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
