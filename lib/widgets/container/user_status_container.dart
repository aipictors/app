import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserStatusContainer extends HookConsumerWidget {
  const UserStatusContainer({
    Key? key,
    required this.likesCount,
    required this.viewsCount,
    required this.followersCount,
    required this.awardsCount,
  }) : super(key: key);

  final int likesCount;

  final int viewsCount;

  final int followersCount;

  final int awardsCount;

  @override
  Widget build(context, ref) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "いいね $likesCount",
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(width: 8),
            Text(
              "閲覧回数 $viewsCount",
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              "フォロワー $followersCount",
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(width: 8),
            Text(
              "入賞 $awardsCount",
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
