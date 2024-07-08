import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationSettingCard extends HookConsumerWidget {
  const GenerationSettingCard({
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
    return SizedBox(
      height: 80,
      child: InkWell(
        onTap: onPressed,
        child: Card.outlined(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
