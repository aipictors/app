import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeColorContainer extends HookConsumerWidget {
  const ThemeColorContainer({super.key});

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Row(
      children: [
        IconButton.filledTonal(
          icon: const Icon(Icons.water_drop_rounded),
          style: IconButton.styleFrom(
            backgroundColor: Colors.blue.withOpacity(
              config.themeColor == Colors.blue ? 0.8 : 0.2,
            ),
          ),
          onPressed: () {
            final notifier = ref.read(configProvider.notifier);
            notifier.updateColorScheme('blue');
          },
        ),
        IconButton.filledTonal(
          icon: const Icon(Icons.eco_rounded),
          style: IconButton.styleFrom(
            backgroundColor: Colors.green.withOpacity(
              config.themeColor == Colors.green ? 0.8 : 0.2,
            ),
          ),
          onPressed: () {
            final notifier = ref.read(configProvider.notifier);
            notifier.updateColorScheme('green');
          },
        ),
        IconButton.filledTonal(
          icon: const Icon(Icons.local_fire_department_rounded),
          style: IconButton.styleFrom(
            backgroundColor: Colors.red.withOpacity(
              config.themeColor == Colors.red ? 0.8 : 0.2,
            ),
          ),
          onPressed: () {
            final notifier = ref.read(configProvider.notifier);
            notifier.updateColorScheme('red');
          },
        ),
        IconButton.filledTonal(
          icon: const Icon(Icons.bolt_rounded),
          style: IconButton.styleFrom(
            backgroundColor: Colors.yellow.withOpacity(
              config.themeColor == Colors.yellow ? 0.8 : 0.2,
            ),
          ),
          onPressed: () {
            final notifier = ref.read(configProvider.notifier);
            notifier.updateColorScheme('yellow');
          },
        ),
        IconButton.filledTonal(
          icon: const Icon(Icons.bedtime_rounded),
          style: IconButton.styleFrom(
            backgroundColor: Colors.purple.withOpacity(
              config.themeColor == Colors.purple ? 0.8 : 0.2,
            ),
          ),
          onPressed: () {
            final notifier = ref.read(configProvider.notifier);
            notifier.updateColorScheme('purple');
          },
        )
      ],
    );
  }
}
