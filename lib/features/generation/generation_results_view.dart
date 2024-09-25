import 'dart:developer';

import 'package:aipictors/features/generation/__generated__/viewer_image_generation_results.req.gql.dart';
import 'package:aipictors/features/generation/functions/delete_image_generation_task.dart';
import 'package:aipictors/features/generation/functions/update_protected_image_generation_task.dart';
import 'package:aipictors/features/generation/functions/update_rating_image_generation_task.dart';
import 'package:aipictors/features/generation/utils/image_generation_task_creator.dart';
import 'package:aipictors/features/generation/widgets/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/features/generation/widgets/delete_image_generation_task.dart';
import 'package:aipictors/features/generation/widgets/generation_model_picker_modal.dart';
import 'package:aipictors/features/generation/widgets/generation_result_list_tile.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/providers/audio_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/viewer_image_generation_status_provider.dart';
import 'package:aipictors/states/image_generation_state.dart';
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
class GenerationResultsView extends HookConsumerWidget {
  const GenerationResultsView({
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

    final request = GViewerImageGenerationResultsReq((builder) {
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
          final resultList = response.data?.viewer?.imageGenerationResults;
          if (resultList == null) {
            return const LoadingScreen();
          }
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Column(
                children: [Divider(height: 4), SizedBox(height: 4)],
              );
            },
            itemCount: resultList.length,
            itemBuilder: (context, index) {
              if (resultList[index].nanoid == null) {
                return const DeletedImageGenerationTaskErrorContainer();
              }
              return GenerationResultListTile(
                result: resultList[index],
                onTap: () async {
                  await context.push(
                    '/generation/results/${resultList[index].nanoid}',
                  );
                  client.value?.requestController.add(request);
                },
                onRating: onRating,
                onProtect: onProtect,
                onDelete: (BuildContext context, String nanoId) {
                  onDelete(context, nanoId, request, client.value!);
                },
              );
            },
          );
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
      GViewerImageGenerationResultsReq request, Client client) {
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
