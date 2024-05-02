import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/utils/to_model_category_text.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationModelPicker extends HookConsumerWidget {
  const GenerationModelPicker({
    super.key,
    required this.selectedModelName,
    required this.onSelected,
    required this.onShowMoreButtonPressed,
  });

  final String selectedModelName;

  final Function(String modelName) onSelected;

  final VoidCallback onShowMoreButtonPressed;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    GImageModelsData_imageModels? selectedModel;

    return Container(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Column(
          children: [
            OperationBuilder(
                client: client.value!,
                operationRequest: GImageModelsReq(),
                builder: (context, response) {
                  final models = response.data!.imageModels;

                  selectedModel =
                      models.singleWhere((p0) => p0.name == selectedModelName);
                  // 選択中のモデル以外にも、2つのモデルを表示する
                  final topModels = models
                      .where((p0) => p0.name != selectedModelName)
                      .toList()
                      .sublist(0, 2);

                  return Column(
                    children: [
                      if (selectedModel != null)
                        Container(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            child: WorkInfoListTile(
                              thumbnailImageURL:
                                  selectedModel!.thumbnailImageURL ?? '',
                              title: selectedModel!.displayName,
                              body: Row(children: [
                                Text(toModelCategoryText(
                                    selectedModel!.category)),
                                const SizedBox(width: 16),
                                Text(selectedModel!.type),
                              ]),
                              onTap: () {
                                onSelected(selectedModel!.name);
                              },
                            )),
                      for (final model in topModels)
                        WorkInfoListTile(
                          thumbnailImageURL: model.thumbnailImageURL ?? '',
                          title: model.displayName,
                          body: Row(children: [
                            Text(toModelCategoryText(model.category)),
                            const SizedBox(width: 16),
                            Text(model.type),
                          ]),
                          onTap: () {
                            print(model.prompts);
                            onSelected(model.name);
                          },
                        ),
                      OutlinedButton(
                        child: Text('もっとみる'.i18n),
                        onPressed: () {
                          onShowMoreButtonPressed();
                        },
                      )
                    ],
                  );
                })
          ],
        ));
  }
}
