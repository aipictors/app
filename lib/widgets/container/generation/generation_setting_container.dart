import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationSettingContainer extends HookConsumerWidget {
  const GenerationSettingContainer({
    super.key,
    required this.name,
    required this.value,
    this.onPressed,
  });

  final String name;

  final String value;

  final Function()? onPressed;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.normal),
                foregroundColor: Theme.of(context).colorScheme.inverseSurface,
              ),
              child: Text(value),
            ),
          ),
        ),
      ],
    );
  }
}
