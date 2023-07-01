import 'package:aipictors/utils/to_readable_number.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${toReadableNumber(followersCount)}人のユーザにフォローされています。',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              'いいね $toReadableNumber(likesCount)件',
              style: TextStyle(color: Theme.of(context).dividerColor),
            ),
            const SizedBox(width: 12),
            Text(
              '閲覧 ${toReadableNumber(viewsCount)}回',
              style: TextStyle(color: Theme.of(context).dividerColor),
            ),
            const SizedBox(width: 12),
            Text(
              '入賞回数 $toReadableNumber{awardsCount}回',
              style: TextStyle(color: Theme.of(context).dividerColor),
            ),
          ],
        ),
      ],
    );
  }
}
