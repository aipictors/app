import 'package:aipictors/graphql/generation/__generated__/image_models.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/utils/to_model_category_text.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:flutter/material.dart';
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
                return Column(
                  children: [
                    // TODO: モデル絞り込み機能を実装する
                    const Text('絞り込み機能つけたい'),
                    Expanded(
                        child: ListView.builder(
                            itemCount: models.length,
                            itemBuilder: (context, index) {
                              return WorkInfoListTile(
                                thumbnailImageURL:
                                    models[index].thumbnailImageURL ?? '',
                                title: models[index].displayName,
                                body: Text(toModelCategoryText(
                                    models[index].category)),
                                onTap: () {
                                  onSelected(models[index].name);
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
