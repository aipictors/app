import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/generation_model_version.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: RemoteConfigにする
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
    final vae = useState(currentVae);

    final isLoading = useState(false);

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

    // モデルに合わせたVAEに補正する
    void correctVae() {
      // SD1とSD2のVAEは互換性があるが、SDXLは互換性がない
      if ((modelVersion == GenerationModelVersion.sd1 ||
              modelVersion == GenerationModelVersion.sd2) &&
          !vaeList.contains(vae.value)) {
        isLoading.value = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onSelected(vaeList[0]);
        });
      } else if (modelVersion == GenerationModelVersion.sdxl &&
          !sdxlVaeList.contains(vae.value)) {
        isLoading.value = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onSelected(sdxlVaeList[0]);
        });
      } else {
        isLoading.value = false;
      }
    }

    correctVae();

    useEffect(() {
      correctVae();
      vae.value = currentVae;
      return null;
    }, [modelVersion, currentVae]);

    if (isLoading.value) {
      return const LoadingProgress();
    }
    return Row(
      children: [
        Text(
          'VAE'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField(
            style: const TextStyle(fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant),
              ),
            ),
            value: (isLoading.value) ? 'None' : vae.value,
            isExpanded: true,
            items: [
              if (modelVersion == GenerationModelVersion.sd1 ||
                  modelVersion == GenerationModelVersion.sd2)
                for (String vae in vaeList)
                  DropdownMenuItem(value: vae, child: Text(vae)),
              if (modelVersion == GenerationModelVersion.sdxl)
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
