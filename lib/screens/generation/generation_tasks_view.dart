import 'package:aipictors/graphql/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/viewer_image_generation_status_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/states/image_generation_state.dart';
import 'package:aipictors/utils/image_generation_task_creator.dart';
import 'package:aipictors/utils/to_generation_image_url.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/deleted_work_error_container.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker_modal.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/generation_task_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画像生成の履歴一覧
class GenerationTasksView extends HookConsumerWidget {
  const GenerationTasksView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final config = ref.watch(configProvider);

    final ValueNotifier<GViewerImageGenerationStatusData?>
        viewerImageGenerationStatus = useState(null);
    ref
        .watch(viewerImageGenerationStatusProvider.future)
        .then((value) => viewerImageGenerationStatus.value = value);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GViewerImageGenerationTasksReq((builder) {
      builder
        ..vars.offset = 0
        ..vars.limit = config.graphqlQueryLimit;
    });
    return OperationBuilder(
      client: client.value!,
      operationRequest: request,
      builder: (context, response) {
        final taskList = response.data?.viewer?.imageGenerationTasks;
        if (taskList == null) {
          return const LoadingScreen();
        }
        return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Column(
                children: [Divider(height: 4), SizedBox(height: 4)],
              );
            },
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              if (taskList[index].nanoid == null ||
                  taskList[index].token == null ||
                  taskList[index].imageFileName == null) {
                //TODO: 生成履歴用の削除済みエラーコンテナを作成する
                return DeletedWorkErrorContainer();
              }
              return GenerationTaskListTile(
                taskNanoId: taskList[index].nanoid!,
                imageUrl: toGenerationImageUrl(
                    taskList[index].token!, taskList[index].imageFileName!),
                model: taskList[index].model,
                prompt: taskList[index].prompt,
                negativePrompt: taskList[index].negativePrompt,
                seed: taskList[index].seed.toInt(),
                steps: taskList[index].steps,
                scale: taskList[index].scale,
                sampler: taskList[index].sampler,
                sizeType: taskList[index].sizeType,
                vae: taskList[index].vae!,
                rating: taskList[index].rating ?? 0,
                isProtected: taskList[index].isProtected ?? false,
              );
            });
      },
    );
  }

  /// モデルピッカーを開く
  onOpenModelPickerModal(
      BuildContext context, Function(String modelName) onSelected) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return GenerationModelPickerModal(
              onSelected: (String modelName) => onSelected(modelName));
        });
  }

  /// 生成する
  onCreateTask(BuildContext context, WidgetRef ref,
      ImageGenerationState imageGeneration) async {
    await imageGenerationTaskCreator(context, ref, imageGeneration);
  }
}
