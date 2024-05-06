import 'package:aipictors/widgets/container/generation/generation_rating_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationProtectButton extends HookConsumerWidget {
  const GenerationProtectButton(
      {super.key, required this.isProtected, required this.onPressed});

  final bool isProtected;

  final Function(bool newProtectionState) onPressed;

  @override
  Widget build(context, ref) {
    return IconButton(
        onPressed: () {
          onPressed(!isProtected);
        },
        icon: (isProtected)
            ? Icon(Icons.lock_rounded,
                color: Theme.of(context).colorScheme.primary)
            : const Icon(Icons.lock_open_rounded));
  }
}
