import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkTagsContainer extends HookConsumerWidget {
  const WorkTagsContainer({
    Key? key,
    required this.tagNames,
  }) : super(key: key);

  final List<String> tagNames;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        children: [
          for (final tagName in tagNames) Text("#$tagName"),
        ],
      ),
    );
  }
}
