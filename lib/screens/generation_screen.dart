import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/create_image_generation_task.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/viewer_provider.dart';
import 'package:aipictors/repositories/image_generation_repository.dart';
import 'package:aipictors/utils/active_image_generation.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_prompt_form.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
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

    const generationRepository = ImageGenerationRepository();

    if (client.value == null) {
      return const LoadingContainer();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('画像生成'.i18n),
      ),
      body: ListView(
        children: [
          GenerationModelPicker(onSelected: (String modelName) {
            print(modelName);
          }),
          const SizedBox(height: 32),
          const GenerationPromptInputField(),
        ],
      ),
      bottomNavigationBar: FilledButton(
        child: Text('生成する'.i18n),
        onPressed: () {
          onCreateTask(context, ref, generationRepository);
        },
      ),
    );
  }

  /// 生成する
  onCreateTask(BuildContext context, WidgetRef ref,
      ImageGenerationRepository generationRepository) async {
    final viewer = await ref.watch(viewerProvider.future);
    await activeImageGeneration(viewer!.viewer!.user.nanoid!);
    createImageGenerationTask((builder) {
      return builder
        ..vars.input.count = generationRepository.count
        ..vars.input.type = generationRepository.type
        ..vars.input.model = generationRepository.model
        ..vars.input.vae = generationRepository.vae
        ..vars.input.prompt = generationRepository.prompt
        ..vars.input.negativePrompt = generationRepository.negativePrompt
        ..vars.input.seed = generationRepository.seed.toDouble()
        ..vars.input.steps = generationRepository.steps
        ..vars.input.scale = generationRepository.scale
        ..vars.input.sampler = (generationRepository.sampler != '')
            ? generationRepository.sampler
            : 'DPM++ 2M Karras'
        ..vars.input.sizeType = generationRepository.sizeType;
    });
    await activeImageGeneration(viewer.viewer!.user.nanoid!);
  }
}
