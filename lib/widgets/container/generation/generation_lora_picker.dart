import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/image_lora_models.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/image_lora_models.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/generation/generation_lora_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationLoraPicker extends HookConsumerWidget {
  const GenerationLoraPicker({
    super.key,
    required this.selectedLoraNameMap,
    required this.onValueChanged,
    required this.addLoraButtonPressed,
    required this.onDeleted,
  });

  final Map<String, double> selectedLoraNameMap;

  final Function(String loraName, double value) onValueChanged;

  final VoidCallback addLoraButtonPressed;

  final Function(String loraName) onDeleted;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    Map<GImageLoraModelsData_imageLoraModels, double> selectedLoraMap = {};

    return Container(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Column(
          children: [
            OperationBuilder(
                client: client.value!,
                operationRequest: GImageLoraModelsReq(),
                builder: (context, response) {
                  final models = response.data!.imageLoraModels;

                  selectedLoraNameMap.forEach((key, value) {
                    final int selectedLoraIndex = models.indexWhere(
                      (p0) => p0.name == key,
                    );
                    if (selectedLoraIndex != -1) {
                      selectedLoraMap[models[selectedLoraIndex]] = value;
                    }
                  });

                  return Column(
                    children: [
                      for (final selectedLora in selectedLoraMap.keys)
                        Dismissible(
                          key: Key(selectedLora.id),
                          onDismissed: (direction) {
                            onDeleted(selectedLora.name);
                          },
                          child: GenerationLoraContainer(
                            lora: selectedLora,
                            value: selectedLoraMap[selectedLora] ?? 0,
                            onValueChanged: (double value) {
                              // 小数点第2桁で丸めるが、ユーザーが調整をやりやすくするために小数点第2桁は0または5にする
                              int baseValue = (value * 100).round().abs();

                              // 最後の桁が3以下なら0に、6以下なら5に、それ以外なら10にする
                              int onesPlace = int.parse(baseValue
                                  .toString()[baseValue.toString().length - 1]);
                              if (onesPlace <= 3) {
                                baseValue -= onesPlace;
                              } else if (onesPlace <= 6) {
                                baseValue += 5 - onesPlace;
                              } else {
                                baseValue += 10 - onesPlace;
                              }

                              onValueChanged(
                                  selectedLora.name,
                                  (0 < value)
                                      ? baseValue / 100
                                      : baseValue / -100);
                            },
                            onValueInputted: (double value) {
                              onValueChanged(selectedLora.name, value);
                            },
                          ),
                        ),
                      if (selectedLoraMap.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text(
                            '選択しているLoRAはないみたい。'.i18n,
                          ),
                        ),
                      OutlinedButton(
                        child: Text('LoRA(エフェクト)を追加'.i18n),
                        onPressed: () {
                          addLoraButtonPressed();
                        },
                      )
                    ],
                  );
                })
          ],
        ));
  }
}
