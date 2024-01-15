import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MutedTagListTile extends HookConsumerWidget {
  const MutedTagListTile({
    super.key,
    required this.tagName,
    required this.onTap,
  });

  final String tagName;

  final VoidCallback? onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 0,
      title: Text(
        '#$tagName',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: onTap,
    );
  }
}
