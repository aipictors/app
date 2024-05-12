import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationSamplerPicker extends HookConsumerWidget {
  const GenerationSamplerPicker({
    super.key,
    required this.currentSampler,
    required this.onSelected,
  });

  final String currentSampler;

  final Function(String sampler) onSelected;

  @override
  Widget build(context, ref) {
    const samplers = [
      'Euler a',
      'Euler',
      'Heun',
      'DPM2',
      'DPM2 a',
      'DPM++ 2S a',
      'LMS Karras',
      'DPM2 a Karras',
      'DPM++ 2S a Karras',
      'DPM++ SDE Karras',
      'DPM++ 2M Karras',
      'DPM++ 2M SDE Karras',
      'DDIM',
    ];
    return Row(
      children: [
        Text(
          'Sampler'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButton(
            value: currentSampler,
            style: const TextStyle(fontWeight: FontWeight.normal),
            isExpanded: true,
            items: [
              for (String sampler in samplers)
                DropdownMenuItem(value: sampler, child: Text(sampler))
            ],
            onChanged: (value) {
              if (value == null) return;
              onSelected(value);
            },
          ),
        ),
      ],
    );
  }
}
