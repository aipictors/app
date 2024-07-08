import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationLikedWorksSummaryListTileCompact extends HookConsumerWidget {
  const NotificationLikedWorksSummaryListTileCompact({
    super.key,
    required this.createdAt,
    required this.message,
  });

  final int createdAt;

  final String message;

  @override
  Widget build(context, ref) {
    return ListTile(
      leading: Icon(
        Icons.favorite_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
