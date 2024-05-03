import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationSeedInput extends HookConsumerWidget {
  const GenerationSeedInput({
    super.key,
    required this.currentSeed,
    required this.onChanged,
  });

  final int currentSeed;

  final Function(int seed) onChanged;

  @override
  Widget build(context, ref) {
    final seedController =
        useTextEditingController(text: currentSeed.toString());

    return Row(
      children: [
        Text(
          'Seed '.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: seedController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              onChanged(int.parse(value));
            },
            decoration: InputDecoration(hintText: 'Seed値'.i18n),
          ),
        ),
        IconButton(
            onPressed: () {
              seedController.text = '-1';
              onChanged(-1);
            },
            icon: const Icon(Icons.casino_rounded))
      ],
    );
  }
}
