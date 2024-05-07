import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.data.gql.dart';
import 'package:aipictors/mutations/update_protected_image_generation_task.dart';
import 'package:aipictors/mutations/update_rating_image_generation_task.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/utils/to_generation_size_type_text.dart';
import 'package:aipictors/widgets/container/generation/generation_protect_button.dart';
import 'package:aipictors/widgets/container/generation/generation_rating_container.dart';
import 'package:aipictors/widgets/container/generation/generation_setting_container.dart';
import 'package:aipictors/widgets/container/generation/prompts_container.dart';
import 'package:aipictors/widgets/image/feed_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationTaskListTile extends HookConsumerWidget {
  const GenerationTaskListTile({
    super.key,
    required this.taskNanoId,
    required this.imageUrl,
    required this.model,
    required this.prompt,
    required this.negativePrompt,
    required this.seed,
    required this.steps,
    required this.scale,
    required this.sampler,
    required this.sizeType,
    required this.vae,
    required this.rating,
    required this.isProtected,
  });

  final String taskNanoId;

  final String imageUrl;

  final GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model model;

  final String prompt;

  final String negativePrompt;

  final int seed;

  final int steps;

  final int scale;

  final String sampler;

  final GImageGenerationSizeType sizeType;

  final String vae;

  final int rating;

  final bool isProtected;

  @override
  Widget build(context, ref) {
    final imageGeneration = ref.watch(imageGenerationProvider);

    final imageGenerationNotifier = ref.read(imageGenerationProvider.notifier);

    return ListTile(
      onTap: () {
        context.push('/generation/tasks/$taskNanoId');
      },
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 0,
        bottom: 0,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedImage(
            imageURL: imageUrl,
            imageAspectRatio: 1,
            headers: const {
              'Referer': 'https://beta.aipictors.com/',
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          GenerationRatingContainer(
            currentRating: rating,
            onPressed: (int value) {
              onRating(context, taskNanoId, value);
            },
          ),
          const Spacer(),
          GenerationProtectButton(
              isProtected: isProtected,
              onPressed: (newProtectionState) {
                onProtect(context, taskNanoId, newProtectionState);
              })
        ]),
        Text(
          'プロンプト'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        PromptsContainer(
            prompts: prompt,
            onPressed: (String prompt) {
              imageGenerationNotifier
                  .updatePrompt('${imageGeneration.prompt}, $prompt');
              showSnackBar(
                  context,
                  'プロンプトに _PROMPT_ を追加しました'.i18n.replaceAllMapped(
                        RegExp(r'_PROMPT_'),
                        (match) => prompt,
                      ));
            }),
        const SizedBox(height: 4),
        Text(
          'ネガティブプロンプト'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        PromptsContainer(
            prompts: negativePrompt,
            onPressed: (String negativePrompt) {
              imageGenerationNotifier.updateNegativePrompt(
                  '${imageGeneration.negativePrompt}, $negativePrompt');
              showSnackBar(
                  context,
                  'ネガティブプロンプトに _NEGATIVE_PROMPT_ を追加しました'.i18n.replaceAllMapped(
                        RegExp(r'_NEGATIVE_PROMPT_'),
                        (match) => negativePrompt,
                      ));
            }),
        const SizedBox(height: 4),
        GenerationSettingContainer(
          name: 'モデル'.i18n,
          value: model.name.split('.')[0],
          onPressed: () {
            imageGenerationNotifier.updateModel(model.name);
            showSnackBar(context, 'モデルを設定しました'.i18n);
          },
        ),
        const SizedBox(height: 4),
        GenerationSettingContainer(
          name: 'サイズ'.i18n,
          value: toGenerationSizeTypeText(sizeType),
          onPressed: () {
            imageGenerationNotifier.updateSizeType(sizeType);
            showSnackBar(context, 'サイズを設定しました'.i18n);
          },
        ),
        const SizedBox(height: 4),
        GenerationSettingContainer(
          name: 'Seed'.i18n,
          value: seed.toString(),
          onPressed: () {
            imageGenerationNotifier.updateSeed(seed);
            showSnackBar(context, 'Seedを設定しました'.i18n);
          },
        ),
      ]),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }

  onRating(BuildContext context, String nanoId, int rating) {
    updateRatingImageGenerationTask((builder) {
      return builder
        ..vars.input.nanoid = nanoId
        ..vars.input.rating = rating;
    });
  }

  onProtect(BuildContext context, String nanoId, bool isProtected) {
    updateProtectedImageGenerationTask((builder) {
      return builder
        ..vars.input.nanoid = nanoId
        ..vars.input.isProtected = isProtected;
    });
  }
}
