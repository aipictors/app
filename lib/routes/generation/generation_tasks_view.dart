import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/graphql/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.req.gql.dart';
import 'package:aipictors/mutations/delete_image_generation_task.dart';
import 'package:aipictors/mutations/update_protected_image_generation_task.dart';
import 'package:aipictors/mutations/update_rating_image_generation_task.dart';
import 'package:aipictors/providers/audio_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/viewer_image_generation_status_provider.dart';
import 'package:aipictors/routes/generation/widgets/delete_image_generation_task.dart';
import 'package:aipictors/routes/generation/widgets/generating_image_container.dart';
import 'package:aipictors/routes/generation/widgets/generation_model_picker_modal.dart';
import 'package:aipictors/routes/generation/widgets/generation_task_list_tile.dart';
import 'package:aipictors/routes/home/widgets/loading_screen.dart';
import 'package:aipictors/states/image_generation_state.dart';
import 'package:aipictors/utils/image_generation_task_creator.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/deleted_image_generation_task_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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

    final audio = ref.watch(audioProvider);

    final ValueNotifier<GViewerImageGenerationStatusData?>
        viewerImageGenerationStatus = useState(null);
    ref
        .watch(viewerImageGenerationStatusProvider.future)
        .then((value) => viewerImageGenerationStatus.value = value);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GViewerImageGenerationTasksReq((builder) {
      builder
        ..vars.offset = 0
        ..vars.limit = config.graphqlQueryLimit;
    });
    return RefreshIndicator(
      onRefresh: () async {
        audio.play(AssetSource('snd_sine/progress_loop.wav'));
        final req = request.rebuild((builder) {});
        client.value?.requestController.add(req);
        await Future.delayed(const Duration(seconds: 2));
        audio.play(AssetSource('snd_sine/transition_up.wav'));
      },
      child: OperationBuilder(
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
                // 生成中なら進捗状況を表示する
                if (taskList[index].status ==
                        GImageGenerationStatus.IN_PROGRESS ||
                    taskList[index].status == GImageGenerationStatus.PENDING ||
                    taskList[index].status == GImageGenerationStatus.RESERVED) {
                  return const GeneratingImageContainer();
                }
                if (taskList[index].nanoid == null ||
                    taskList[index].token == null ||
                    taskList[index].imageFileName == null) {
                  return const DeletedImageGenerationTaskErrorContainer();
                }
                return GenerationTaskListTile(
                  task: taskList[index],
                  onTap: () async {
                    await context
                        .push('/generation/tasks/${taskList[index].nanoid}');
                    client.value?.requestController.add(request);
                  },
                  onRating: onRating,
                  onProtect: onProtect,
                  onDelete: (BuildContext context, String nanoId) {
                    onDelete(context, nanoId, request, client.value!);
                  },
                );
              });
        },
      ),
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

  void onRating(BuildContext context, String nanoId, int rating) {
    updateRatingImageGenerationTask((builder) {
      return builder
        ..vars.input.nanoid = nanoId
        ..vars.input.rating = rating;
    });
  }

  void onProtect(BuildContext context, String nanoId, bool isProtected) {
    updateProtectedImageGenerationTask((builder) {
      return builder
        ..vars.input.nanoid = nanoId
        ..vars.input.isProtected = isProtected;
    });
  }

  void onDelete(BuildContext context, String nanoId,
      GViewerImageGenerationTasksReq request, Client client) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return DeleteImageGenerationTaskDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () async {
            context.pop();
            await deleteImageGenerationTask((builder) {
              return builder..vars.input.nanoid = nanoId;
            });
            client.requestController.add(request);
          },
        );
      },
    );
  }
}
