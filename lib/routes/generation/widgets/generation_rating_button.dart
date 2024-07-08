import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationRatingButton extends HookConsumerWidget {
  const GenerationRatingButton(
      {super.key, required this.isFilled, required this.onPressed});

  final bool isFilled;

  final Function() onPressed;

  @override
  Widget build(context, ref) {
    return Row(children: [
      IconButton(
        onPressed: () {
          onPressed();
        },
        icon: (isFilled)
            ? const Icon(Icons.star_outline_rounded)
            : Icon(
                Icons.star_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
      ),
    ]);
  }
}
