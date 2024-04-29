import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/create_image_generation_task.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/providers/viewer_provider.dart';
import 'package:aipictors/states/image_generation_state.dart';
import 'package:aipictors/utils/active_image_generation.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_prompt_form.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/view/generated_images_grid_view.dart';
import 'package:flutter/material.dart';
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

    if (client.value == null) {
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
                print(modelName);
                imageGenerationNotifier.updateModel(modelName);
              }),
          const SizedBox(height: 32),
          GenerationPromptInputField(
            onPromptChanged: (prompt) {
              imageGenerationNotifier.updatePrompt(prompt);
            },
            onNegativePromptChanged: (negativePrompt) {
              imageGenerationNotifier.updateNegativePrompt(negativePrompt);
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
  }

  /// 生成する
  onCreateTask(BuildContext context, WidgetRef ref,
      ImageGenerationState imageGeneration) async {
    final viewer = await ref.watch(viewerProvider.future);
    await activeImageGeneration(viewer!.viewer!.user.nanoid!);
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
