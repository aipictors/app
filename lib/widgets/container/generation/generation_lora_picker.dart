import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/image_lora_models.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/image_lora_models.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationLoraPicker extends HookConsumerWidget {
  const GenerationLoraPicker({
    super.key,
    required this.selectedLoraNameMap,
    required this.onValueChanged,
    required this.addLoraButtonPressed,
  });

  final Map<String, double> selectedLoraNameMap;

  final Function(String loraName, double value) onValueChanged;

  final VoidCallback addLoraButtonPressed;

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
                        WorkInfoListTile(
                            thumbnailImageURL:
                                selectedLora.thumbnailImageURL ?? '',
                            title: selectedLora.name,
                            body: Text(selectedLora.description ?? ''),
                            onTap: () {}),
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
