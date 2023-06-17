import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkTextContainer extends HookConsumerWidget {
  const WorkTextContainer({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;

  final String? description;

  @override
  Widget build(context, ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (description != null) const SizedBox(height: 4),
        if (description != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }
}
