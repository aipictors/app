import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkBottomAppContainer extends HookConsumerWidget {
  const WorkBottomAppContainer({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton.filledTonal(
                icon: const Icon(Icons.favorite_rounded),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              IconButton.filledTonal(
                icon: const Icon(Icons.bookmark_rounded),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            child: const Text(
              "コメント",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
