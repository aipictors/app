import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/generation/queries/__generated__/image_lora_models.data.gql.dart';
import 'package:aipictors/features/generation/queries/__generated__/image_lora_models.req.gql.dart';
import 'package:aipictors/features/generation/widgets/generation_lora_filter_container.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationLoraPickerModal extends HookConsumerWidget {
  const GenerationLoraPickerModal({
    super.key,
    required this.onSelected,
  });

  final Function(String loraName) onSelected;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final modelName = useState('');

    final ValueNotifier<String?> modelGenre = useState('');

    if (client.value == null) {
      return SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: const LoadingProgress()));
    }

    return SafeArea(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: OperationBuilder(
              client: client.value!,
              operationRequest: GImageLoraModelsReq(),
              builder: (context, response) {
                final models = response.data!.imageLoraModels;
                BuiltList<GImageLoraModelsData_imageLoraModels> filteredModels =
                    models
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(modelName.value.toLowerCase()))
                        .where((element) => (element.genre ?? '')
                            .contains((modelGenre.value ?? '')))
                        .toBuiltList();
                final genreList =
                    models.map((model) => (model.genre ?? '')).toSet().toList();
                return Column(
                  children: [
                    GenerationLoraFilterContainer(
                      genreList: genreList,
                      onGenreSelected: (genre) {
                        modelGenre.value = genre;
                      },
                      onSearchTextSubmit: (text) {
                        modelName.value = text;
                      },
                    ),
                    if (filteredModels.isEmpty)
                      Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text('条件に合うLoRAはないみたい。'.i18n)),
                    Expanded(
                        child: ListView.builder(
                            itemCount: filteredModels.length,
                            itemBuilder: (context, index) {
                              return WorkInfoListTile(
                                thumbnailImageURL:
                                    filteredModels[index].thumbnailImageURL ??
                                        '',
                                title: filteredModels[index].name,
                                body: Text(
                                    filteredModels[index].description ?? ''),
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
