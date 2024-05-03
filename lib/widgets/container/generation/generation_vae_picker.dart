import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/generation_model_version.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationVaePicker extends HookConsumerWidget {
  const GenerationVaePicker({
    super.key,
    required this.modelVersion,
    required this.currentVae,
    required this.onSelected,
  });

  final GenerationModelVersion modelVersion;

  final String currentVae;

  final Function(String sampler) onSelected;

  @override
  Widget build(context, ref) {
    const vaeList = [
      'kl-f8-anime2',
      'clearvae_v23',
      'vae-ft-mse-840000-ema-pruned',
      'None',
    ];
    const sdxlVaeList = [
      'sdxl_vae',
      'None',
    ];
    return Row(
      children: [
        Text(
          'VAE '.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButton(
            value: currentVae,
            isExpanded: true,
            items: [
              if (modelVersion == GenerationModelVersion.SD1 ||
                  modelVersion == GenerationModelVersion.SD2)
                for (String vae in vaeList)
                  DropdownMenuItem(value: vae, child: Text(vae)),
              if (modelVersion == GenerationModelVersion.SDXL)
                for (String vae in sdxlVaeList)
                  DropdownMenuItem(value: vae, child: Text(vae))
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
