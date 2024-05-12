import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.data.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/container/generation/generation_liked_model_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: タブ切り替え時に一瞬高さが変わってしまう問題を修正する
class GenerationModelPickerTab extends HookConsumerWidget {
  const GenerationModelPickerTab({
    super.key,
    required this.models,
    required this.selectedModelName,
    required this.onSelected,
    required this.onShowMoreButtonPressed,
    required this.onShowMoreLikedModelsButtonPressed,
    this.prevSelectedModelName,
  });

  final BuiltList<GImageModelsData_imageModels> models;

  final String selectedModelName;

  final Function(String modelName, String prevSelectedModelName) onSelected;

  final VoidCallback onShowMoreButtonPressed;

  final VoidCallback onShowMoreLikedModelsButtonPressed;

  final String? prevSelectedModelName;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final index = useState(0);

    final controller = useTabController(initialLength: 2);

    if (client.value == null) {
      return const LoadingContainer();
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(children: [
          const SizedBox(height: 4),
          TabBar(
            dividerHeight: 0,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Theme.of(context).colorScheme.inversePrimary),
            labelColor: Theme.of(context).colorScheme.inverseSurface,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: controller,
            tabs: [Tab(text: 'すべてのモデル'.i18n), Tab(text: 'お気に入り'.i18n)],
            onTap: (value) {
              index.value = value;
              controller.animateTo(value);
            },
          ),
          const SizedBox(height: 4),

          // TabBarViewでは高さに上限がないためにエラーになってしまうので、IndexedStackを使用する
          // https://stackoverflow.com/questions/52023610/getting-horizontal-viewport-was-given-unbounded-height-with-tabbarview-in-flu
          IndexedStack(
            index: index.value,
            children: [
              Visibility(
                visible: index.value == 0,
                child: GenerationModelPicker(
                  selectedModelName: selectedModelName,
                  onSelected: (String modelName, prevSelectedModelName) =>
                      onSelected(modelName, prevSelectedModelName),
                  onShowMoreButtonPressed: () => onShowMoreButtonPressed(),
                  prevSelectedModelName: prevSelectedModelName,
                ),
              ),
              Visibility(
                visible: index.value == 1,
                child: GenerationLikedModelPicker(
                  models: models,
                  selectedModelName: selectedModelName,
                  onSelected: (String modelName, prevSelectedModelName) =>
                      onSelected(modelName, prevSelectedModelName),
                  onShowMoreButtonPressed: () =>
                      onShowMoreLikedModelsButtonPressed(),
                  prevSelectedModelName: prevSelectedModelName,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
