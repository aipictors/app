import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/generation_model_version.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.req.gql.dart';
import 'package:aipictors/mutations/create_image_generation_task.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/providers/viewer_provider.dart';
import 'package:aipictors/states/image_generation_state.dart';
import 'package:aipictors/utils/active_image_generation.dart';
import 'package:aipictors/utils/prompt_check.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/generation/generation_size_type_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker_modal.dart';
import 'package:aipictors/widgets/container/generation/generation_prompt_form.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/view/generated_images_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画像生成
class GenerationScreen extends HookConsumerWidget {
  const GenerationScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final imageGeneration = ref.watch(imageGenerationProvider);

    final imageGenerationNotifier = ref.read(imageGenerationProvider.notifier);

    final ValueNotifier<GImageModelsData_imageModels?> selectedModel =
        useState(null);
    if (client.value == null) {
      return const LoadingContainer();
    }

    return OperationBuilder(
      client: client.value!,
      operationRequest: GImageModelsReq(),
      builder: ((context, response) {
        final models = response.data?.imageModels;
        if (models == null) {
          return const UnexpectedErrorContainer();
        }

        if (models.any((p0) => p0.name == imageGeneration.model)) {
          // setState() or markNeedsBuild() called during buildを防ぐため
          WidgetsBinding.instance.addPostFrameCallback((_) {
            selectedModel.value =
                models.singleWhere(((p0) => p0.name == imageGeneration.model));
          });
        } else {
          // 選択中のモデルがない場合、生成時にエラーにならないように一番上のモデルを選択する
          imageGenerationNotifier.updateModel(models[0].name);
        }
        if (selectedModel.value == null) {
          return const LoadingContainer();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('画像生成'.i18n),
          ),
          body: ListView(
            children: [
              GenerationModelPicker(
                selectedModelName: imageGeneration.model,
                onSelected: (String modelName) {
                  imageGenerationNotifier.updateModel(modelName);
                },
                onShowMoreButtonPressed: () {
                  onOpenModelPickerModal(context, (String modelName) {
                    imageGenerationNotifier.updateModel(modelName);
                  });
                },
              ),
              const SizedBox(height: 32),
              GenerationPromptInputField(
                initialPrompt: imageGeneration.prompt,
                initialNegativePrompt: imageGeneration.negativePrompt,
                onPromptChanged: (prompt) {
                  imageGenerationNotifier.updatePrompt(prompt);
                },
                onNegativePromptChanged: (negativePrompt) {
                  imageGenerationNotifier.updateNegativePrompt(negativePrompt);
                },
              ),
              GenerationSizeTypePicker(
                modelVersion:
                    GenerationModelVersion.fromText(selectedModel.value!.type),
                currentSizeType: imageGeneration.sizeType,
                onSelected: (sizeType) {
                  imageGenerationNotifier.updateSizeType(sizeType);
                },
              ),
              const GeneratedImagesGridView(),
            ],
          ),
          bottomNavigationBar: FilledButton(
            child: Text('生成する'.i18n),
            onPressed: () {
              onCreateTask(context, ref, imageGeneration);
            },
          ),
        );
      }),
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
    final viewer = await ref.watch(viewerProvider.future);

    // プロンプトの内容を確認する
    final ngWords = await promptCheck(
        imageGeneration.prompt,
        imageGeneration.negativePrompt,
        imageGeneration.model,
        viewer!.viewer!.user.id);
    // NGワードがあったら生成させない
    if (ngWords['result'] != 'no_ng_words') {
      if (ngWords['hit_negative_words'].isNotEmpty) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
                content: Text(
              'ネガティブプロンプトにNGワードがあります: "_NG_WORDS_"'.i18n.replaceAllMapped(
                    RegExp(r'_NG_WORDS_'),
                    (match) => ngWords['hit_negative_words'],
                  ),
            )),
          );
      }
      if (ngWords['hit_words'].isNotEmpty) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
                content: Text(
              'プロンプトにNGワードがあります: "_NG_WORDS_"'.i18n.replaceAllMapped(
                    RegExp(r'_NG_WORDS_'),
                    (match) => ngWords['hit_words'],
                  ),
            )),
          );
      }
      return;
    }

    await activeImageGeneration(viewer.viewer!.user.nanoid!);
    createImageGenerationTask((builder) {
      return builder
        ..vars.input.count = imageGeneration.count
        ..vars.input.type = imageGeneration.type
        ..vars.input.model = imageGeneration.model
        ..vars.input.vae = imageGeneration.vae
        ..vars.input.prompt = imageGeneration.prompt
        ..vars.input.negativePrompt = imageGeneration.negativePrompt
        ..vars.input.seed = imageGeneration.seed.toDouble()
        ..vars.input.steps = imageGeneration.steps
        ..vars.input.scale = imageGeneration.scale
        ..vars.input.sampler = (imageGeneration.sampler != '')
            ? imageGeneration.sampler
            : 'DPM++ 2M Karras'
        ..vars.input.sizeType = imageGeneration.sizeType;
    });
    await activeImageGeneration(viewer.viewer!.user.nanoid!);
  }
}
