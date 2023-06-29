import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_status_container.dart';

class UserProfileContainer extends HookConsumerWidget {
  const UserProfileContainer({
    Key? key,
    required this.name,
    required this.login,
    required this.biography,
    required this.likesCount,
    required this.viewsCount,
    required this.followersCount,
    required this.awardsCount,
  }) : super(key: key);

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
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '@$login',
            style: TextStyle(color: Theme.of(context).dividerColor),
          ),
          if (biography != null) const SizedBox(height: 8),
          if (biography != null) Text(biography!),
          const SizedBox(height: 4),
          UserStatusContainer(
            likesCount: likesCount,
            viewsCount: viewsCount,
            followersCount: followersCount,
            awardsCount: awardsCount,
          ),
        ],
      ),
    );
  }
}
