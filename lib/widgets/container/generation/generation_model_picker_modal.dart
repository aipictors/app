import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/utils/to_model_category_text.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/generation/generation_model_filter_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationModelPickerModal extends HookConsumerWidget {
  const GenerationModelPickerModal({
    super.key,
    required this.onSelected,
  });

  final Function(String modelName) onSelected;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final ValueNotifier<GImageModelCategory?> modelCategory = useState(null);

    final ValueNotifier<String?> modelType = useState(null);

    final modelName = useState('');

    if (client.value == null) {
      return SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: const LoadingContainer()));
    }

    return SafeArea(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: OperationBuilder(
              client: client.value!,
              operationRequest: GImageModelsReq(),
              builder: (context, response) {
                final models = response.data!.imageModels;
                BuiltList<GImageModelsData_imageModels> filteredModels = models
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(modelName.value.toLowerCase()))
                    .toBuiltList();

                if (modelCategory.value != null) {
                  filteredModels = filteredModels
                      .where(
                          (element) => element.category == modelCategory.value)
                      .toBuiltList();
                }
                if (modelType.value != null) {
                  filteredModels = filteredModels
                      .where((element) => element.type == modelType.value)
                      .toBuiltList();
                }

                return Column(
                  children: [
                    GenerationModelFilterContainer(
                      onCategorySelected: (category) {
                        modelCategory.value = category;
                      },
                      onTypeSelected: (type) {
                        modelType.value = type;
                      },
                      onSearchTextSubmit: (text) {
                        modelName.value = text;
                      },
                    ),
                    if (filteredModels.isEmpty)
                      Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text('条件に合うモデルはないみたい。'.i18n)),
                    Expanded(
                        child: ListView.builder(
                            itemCount: filteredModels.length,
                            itemBuilder: (context, index) {
                              return WorkInfoListTile(
                                thumbnailImageURL:
                                    filteredModels[index].thumbnailImageURL ??
                                        '',
                                title: filteredModels[index].displayName,
                                body: Row(children: [
                                  Text(toModelCategoryText(
                                      filteredModels[index].category)),
                                  const SizedBox(width: 16),
                                  Text(filteredModels[index].type),
                                ]),
                                onTap: () {
                                  onSelected(filteredModels[index].name);
                                  context.pop();
                                },
                              );
                            }))
                  ],
                );
              })),
    );
  }
}
