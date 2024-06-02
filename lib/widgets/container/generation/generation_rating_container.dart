import 'package:aipictors/widgets/container/generation/generation_rating_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationRatingContainer extends HookConsumerWidget {
  const GenerationRatingContainer(
      {super.key, required this.currentRating, required this.onPressed});

  final int currentRating;

  final Function(int rating) onPressed;

  @override
  Widget build(context, ref) {
    return Row(
        children: List<int>.generate(5, (i) => i + 1).map((number) {
      return GenerationRatingButton(
          isFilled: currentRating <= number - 1,
          onPressed: () {
            onPressed(number);
          });
    }).toList());
  }
}
