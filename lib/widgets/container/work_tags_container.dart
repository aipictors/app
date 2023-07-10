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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 4,
        children: [
          const SizedBox(width: 16),
          for (final tagName in tagNames)
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(tagName),
              onPressed: () {},
            ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
