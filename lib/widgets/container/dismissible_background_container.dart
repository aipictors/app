import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DismissibleBackgroundContainer extends HookConsumerWidget {
  const DismissibleBackgroundContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(context, ref) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.only(right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
