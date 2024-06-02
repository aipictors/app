import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_favorited_models.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/utils/to_model_category_text.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationLikedModelPicker extends HookConsumerWidget {
  const GenerationLikedModelPicker({
    super.key,
    required this.models,
    required this.selectedModelName,
    required this.onSelected,
    required this.onShowMoreButtonPressed,
    this.prevSelectedModelName,
  });

  final BuiltList<GImageModelsData_imageModels> models;

  final String selectedModelName;

  final String? prevSelectedModelName;

  final Function(String modelName, String prevSelectedModel) onSelected;

  final VoidCallback onShowMoreButtonPressed;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    GImageModelsData_imageModels? selectedModel;

    GImageModelsData_imageModels? prevSelectedModel;

    return Column(
      children: [
        OperationBuilder(
            client: client.value!,
            operationRequest: GViewerFavoritedImageGenerationModelsReq(),
            builder: (context, response) {
              final likedModels =
                  response.data!.viewer?.favoritedImageGenerationModels;
              if (likedModels == null) {
                return const LoadingScreen();
              }

              final int selectedModelIndex = models.indexWhere(
                (p0) => p0.name == selectedModelName,
              );
              if (selectedModelIndex != -1) {
                selectedModel = models[selectedModelIndex];
              }

              final int prevSelectedModelIndex = models.indexWhere(
                (p0) => p0.name == prevSelectedModelName,
              );
              if (prevSelectedModelIndex != -1) {
                prevSelectedModel = models[prevSelectedModelIndex];
              }

              // 選択中のモデルを含む合計3つのモデルを表示する
              List<GImageModelsData_imageModels> topModels = likedModels
                  .sublist(0, 3)
                  .map((model) =>
                      models.firstWhere((item) => item.name == model.name))
                  .toList();

              // 選択中のモデルがtopModelsにあり、以前選択されたモデルが指定されているがtopModelsにない場合、最下部に表示する
              if (prevSelectedModel != null &&
                  topModels
                      .any((element) => element.name == selectedModelName) &&
                  topModels.any(
                          (element) => element.name == prevSelectedModelName) ==
                      false) {
                topModels[2] = prevSelectedModel!;
                // 選択中のモデルがあり、topModelsに含まれていない場合は選択中のモデルを最下部に表示する
              } else if (selectedModel != null &&
                  topModels.any(
                          (element) => element.name == selectedModelName) ==
                      false) {
                topModels[2] = selectedModel!;
              }

              return Column(
                children: [
                  for (final model in topModels)
                    Container(
                      color: (model.name == selectedModelName)
                          ? Theme.of(context).colorScheme.inversePrimary
                          : null,
                      child: WorkInfoListTile(
                        thumbnailImageURL: model.thumbnailImageURL ?? '',
                        title: model.displayName,
                        body: Row(children: [
                          Text(toModelCategoryText(model.category)),
                          const SizedBox(width: 16),
                          Text(model.type),
                        ]),
                        onTap: () {
                          onSelected(model.name, topModels[2].name);
                        },
                      ),
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
    );
  }
}
