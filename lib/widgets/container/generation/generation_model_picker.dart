import 'package:aipictors/graphql/generation/__generated__/image_models.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/repositories/image_generation_repository.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationModelPicker extends HookConsumerWidget {
  const GenerationModelPicker({
    super.key,
    required this.onSelected,
  });

  final Function(String modelName) onSelected;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    const generationRepository = ImageGenerationRepository();
    if (client.value == null) {
      return const LoadingContainer();
    }
    return Container(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Column(
          children: [
            OperationBuilder(
                client: client.value!,
                operationRequest: GImageModelsReq(),
                builder: (context, response) {
                  final models = response.data!.imageModels.sublist(0, 3);
                  return Column(
                    children: [
                      for (final model in models)
                        WorkInfoListTile(
                          thumbnailImageURL: model.thumbnailImageURL ?? '',
                          title: model.displayName,
                          body: Text(model.category.name),
                          onTap: () {
                            print(model.name);
                            generationRepository.updateModel(model.name);
                          },
                        )
                    ],
                  );
                })
          ],
        ));
  }
}
