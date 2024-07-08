import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/generation_model_version.dart';
import 'package:aipictors/features/generation/queries/__generated__/image_models.data.gql.dart';
import 'package:aipictors/features/generation/queries/__generated__/image_models.req.gql.dart';
import 'package:aipictors/features/generation/utils/image_generation_task_creator.dart';
import 'package:aipictors/features/generation/utils/to_generation_lora_name_map.dart';
import 'package:aipictors/features/generation/widgets/form/generation_prompt_form.dart';
import 'package:aipictors/features/generation/widgets/form/generation_scale_input.dart';
import 'package:aipictors/features/generation/widgets/form/generation_seed_input.dart';
import 'package:aipictors/features/generation/widgets/form/generation_steps_input.dart';
import 'package:aipictors/features/generation/widgets/generated_images_grid_view.dart';
import 'package:aipictors/features/generation/widgets/generation_button.dart';
import 'package:aipictors/features/generation/widgets/generation_liked_model_picker_modal.dart';
import 'package:aipictors/features/generation/widgets/generation_lora_picker.dart';
import 'package:aipictors/features/generation/widgets/generation_lora_picker_modal.dart';
import 'package:aipictors/features/generation/widgets/generation_model_picker_modal.dart';
import 'package:aipictors/features/generation/widgets/generation_model_picker_tab.dart';
import 'package:aipictors/features/generation/widgets/generation_sampler_picker.dart';
import 'package:aipictors/features/generation/widgets/generation_size_type_picker.dart';
import 'package:aipictors/features/generation/widgets/generation_vae_picker.dart';
import 'package:aipictors/graphql/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/providers/viewer_image_generation_status_provider.dart';
import 'package:aipictors/states/image_generation_state.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画像生成
class GenerationView extends HookConsumerWidget {
  const GenerationView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final imageGeneration = ref.watch(imageGenerationProvider);

    final imageGenerationNotifier = ref.read(imageGenerationProvider.notifier);

    final viewerImageGenerationStatus =
        useState<GViewerImageGenerationStatusData?>(null);

    ref.read(viewerImageGenerationStatusProvider.future).then((value) {
      viewerImageGenerationStatus.value = value;
    });

    final selectedModel = useState<GImageModelsData_imageModels?>(null);

    final prevSelectedModelName = useState<String?>(null);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GImageModelsReq();

    return OperationBuilder(
      client: client.value!,
      operationRequest: request,
      builder: ((context, response) {
        final models = response.data?.imageModels;
        if (models == null) {
          client.value?.requestController.add(request.rebuild((builder) {}));
          return const UnexpectedErrorContainer();
        }

        // setState() or markNeedsBuild() called during buildを防ぐため
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final int selectedModelIndex =
              models.indexWhere(((p0) => p0.name == imageGeneration.model));
          if (selectedModelIndex != -1) {
            selectedModel.value = models[selectedModelIndex];
          } else {
            // 選択中のモデルがない場合、生成時にエラーにならないように一番上のモデルを選択する
            imageGenerationNotifier.updateModel(models[0].name);
          }
        });
        if (selectedModel.value == null) {
          return const LoadingProgress();
        }

        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                GenerationModelPickerTab(
                  models: models,
                  selectedModelName: imageGeneration.model,
                  onSelected: (String modelName, String prevSelectedModel) {
                    imageGenerationNotifier.updateModel(modelName);
                    prevSelectedModelName.value = prevSelectedModel;
                  },
                  onShowMoreButtonPressed: () {
                    onOpenModelPickerModal(context, (String modelName) {
                      imageGenerationNotifier.updateModel(modelName);
                    });
                  },
                  onShowMoreLikedModelsButtonPressed: () {
                    onOpenLikedModelPickerModal(
                      context,
                      models,
                      (String modelName) {
                        imageGenerationNotifier.updateModel(modelName);
                      },
                    );
                  },
                  prevSelectedModelName: prevSelectedModelName.value,
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const SizedBox(width: 8),
                  Text(
                    'LoRA(エフェクト)'.i18n,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GenerationLoraPicker(
                    selectedLoraNameMap:
                        toGenerationLoraNameMap(imageGeneration.prompt),
                    onValueChanged: (loraName, value) {
                      String loraText = '';
                      imageGeneration.prompt.split(' ').forEach((element) {
                        if (!element.contains('<lora:$loraName:')) return;
                        loraText = element;
                      });
                      imageGenerationNotifier.updatePrompt(
                        imageGeneration.prompt.replaceAllMapped(
                          RegExp(loraText),
                          (match) => '<lora:$loraName:$value>',
                        ),
                      );
                    },
                    onDeleted: (loraName) {
                      String loraText = '';
                      imageGeneration.prompt.split(',').forEach((element) {
                        if (!element.contains('<lora:$loraName:')) return;
                        loraText = ',$element';
                      });
                      imageGenerationNotifier.updatePrompt(
                        imageGeneration.prompt.replaceAllMapped(
                          RegExp(loraText),
                          (match) => '',
                        ),
                      );
                    },
                    addLoraButtonPressed: () {
                      onOpenLoraPickerModal(context, (loraName) {
                        imageGenerationNotifier.updatePrompt(
                          '${imageGeneration.prompt}, <lora:$loraName:1>',
                        );
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                GenerationPromptInputField(
                  initialPrompt: imageGeneration.prompt,
                  initialNegativePrompt: imageGeneration.negativePrompt,
                  onPromptChanged: (prompt) {
                    imageGenerationNotifier.updatePrompt(prompt);
                  },
                  onNegativePromptChanged: (negativePrompt) {
                    imageGenerationNotifier.updateNegativePrompt(
                      negativePrompt,
                    );
                  },
                ),
                GenerationSizeTypePicker(
                  modelVersion: GenerationModelVersion.fromText(
                      selectedModel.value!.type),
                  currentSizeType: imageGeneration.sizeType,
                  onSelected: (sizeType) {
                    imageGenerationNotifier.updateSizeType(sizeType);
                  },
                ),
                const SizedBox(height: 8),
                GenerationSeedInput(
                  currentSeed: imageGeneration.seed,
                  onChanged: (value) {
                    imageGenerationNotifier.updateSeed(value);
                  },
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: GenerationScaleInput(
                    currentScale: imageGeneration.scale,
                    onChanged: (value) {
                      imageGenerationNotifier.updateScale(value);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: GenerationStepsInput(
                    currentSteps: imageGeneration.steps,
                    onChanged: (value) {
                      imageGenerationNotifier.updateSteps(value);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: GenerationSamplerPicker(
                    currentSampler: imageGeneration.sampler,
                    onSelected: (value) {
                      imageGenerationNotifier.updateSampler(value);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: GenerationVaePicker(
                    modelVersion: GenerationModelVersion.fromText(
                      selectedModel.value!.type,
                    ),
                    currentVae: imageGeneration.vae,
                    onSelected: (value) {
                      imageGenerationNotifier.updateVae(value);
                    },
                  ),
                ),
                GeneratedImagesGridView(onTap: (String nanoId) {
                  context.push('/generation/tasks/$nanoId');
                }, onUpdate: () {
                  ref
                      .read(viewerImageGenerationStatusProvider.future)
                      .then((value) {
                    return viewerImageGenerationStatus.value = value;
                  });
                }),
              ],
            ),
          ),
          bottomNavigationBar: (viewerImageGenerationStatus.value != null)
              ? GenerationButton(
                  viewerImageGenerationStatus:
                      viewerImageGenerationStatus.value!,
                  onPressed: () async {
                    await onCreateTask(context, ref, imageGeneration);
                    ref.read(viewerImageGenerationStatusProvider.future).then(
                        (value) => viewerImageGenerationStatus.value = value);
                  },
                )
              : const FilledButton(
                  onPressed: null,
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(),
                  ),
                ),
        );
      }),
    );
  }

  /// モデルピッカーを開く
  onOpenModelPickerModal(
    BuildContext context,
    Function(String modelName) onSelected,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return GenerationModelPickerModal(
            onSelected: (String modelName) => onSelected(modelName));
      },
    );
  }

  /// お気に入りモデルピッカーを開く
  onOpenLikedModelPickerModal(
    BuildContext context,
    final BuiltList<GImageModelsData_imageModels> models,
    Function(String modelName) onSelected,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return GenerationLikedModelPickerModal(
          models: models,
          onSelected: (String modelName) => onSelected(modelName),
        );
      },
    );
  }

  /// LoRAピッカーを開く
  onOpenLoraPickerModal(
    BuildContext context,
    Function(String modelName) onSelected,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return GenerationLoraPickerModal(
          onSelected: (String modelName) => onSelected(modelName),
        );
      },
    );
  }

  /// 生成する
  onCreateTask(
    BuildContext context,
    WidgetRef ref,
    ImageGenerationState imageGeneration,
  ) async {
    await imageGenerationTaskCreator(context, ref, imageGeneration);
  }
}
