import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowButton extends HookConsumerWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return FilledButton.tonal(
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      child: const Text(
        'フォロー',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
