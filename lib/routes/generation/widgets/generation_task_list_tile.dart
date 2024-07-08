import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.data.gql.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/routes/generation/widgets/generation_protect_button.dart';
import 'package:aipictors/routes/generation/widgets/generation_rating_container.dart';
import 'package:aipictors/routes/generation/widgets/generation_setting_card.dart';
import 'package:aipictors/routes/generation/widgets/generation_task_options_container.dart';
import 'package:aipictors/routes/generation/widgets/prompts_container.dart';
import 'package:aipictors/utils/reuse_image_generation_task.dart';
import 'package:aipictors/utils/to_generation_image_url.dart';
import 'package:aipictors/utils/to_generation_size_type_text.dart';
import 'package:aipictors/widgets/image/feed_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationTaskListTile extends HookConsumerWidget {
  const GenerationTaskListTile({
    super.key,
    required this.task,
    required this.onTap,
    required this.onRating,
    required this.onProtect,
    required this.onDelete,
  });

  final GViewerImageGenerationTasksData_viewer_imageGenerationTasks task;

  final VoidCallback onTap;

  final Function(BuildContext context, String nanoId, int value) onRating;

  final Function(BuildContext context, String nanoId, bool value) onProtect;

  final Function(BuildContext context, String nanoId) onDelete;

  @override
  Widget build(context, ref) {
    final imageGeneration = ref.watch(imageGenerationProvider);

    final imageGenerationNotifier = ref.read(imageGenerationProvider.notifier);

    return ListTile(
      onTap: onTap,
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
            imageURL: toGenerationImageUrl(task.token!, task.imageFileName!),
            imageAspectRatio: 1,
            headers: const {
              'Referer': 'https://beta.aipictors.com/',
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GenerationTaskOptionsContainer(
              onReuseButtonPressed: () {
                reuseImageGenerationTask(task, imageGenerationNotifier);
                showSnackBar(context, '生成情報を復元しました'.i18n);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () {
                onDelete(context, task.nanoid!);
              },
            ),
          ],
        ),
        Row(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.outlineVariant)),
          ),
          GenerationRatingContainer(
            currentRating: task.rating ?? 0,
            onPressed: (int value) {
              onRating(context, task.nanoid!, value);
            },
          ),
          const Spacer(),
          GenerationProtectButton(
              isProtected: task.isProtected ?? false,
              onPressed: (newProtectionState) {
                onProtect(context, task.nanoid!, newProtectionState);
              }),
        ]),
        Text(
          'プロンプト'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        PromptsContainer(
            prompts: task.prompt,
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
            prompts: task.negativePrompt,
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
        Text('その他'.i18n, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          children: [
            GenerationSettingCard(
              name: 'モデル'.i18n,
              value: task.model.name.split('.')[0],
              onPressed: () {
                imageGenerationNotifier.updateModel(task.model.name);
                showSnackBar(context, 'モデルを設定しました'.i18n);
              },
            ),
            GenerationSettingCard(
              name: 'サイズ'.i18n,
              value: toGenerationSizeTypeText(task.sizeType),
              onPressed: () {
                imageGenerationNotifier.updateSizeType(task.sizeType);
                showSnackBar(context, 'サイズを設定しました'.i18n);
              },
            ),
            GenerationSettingCard(
              name: 'Seed'.i18n,
              value: task.seed.toString(),
              onPressed: () {
                imageGenerationNotifier.updateSeed(task.seed.toInt());
                showSnackBar(context, 'Seedを設定しました'.i18n);
              },
            ),
            GenerationSettingCard(
              name: 'VAE'.i18n,
              value: task.vae!,
              onPressed: () {
                if (task.vae != 'None') {
                  imageGenerationNotifier.updateVae(task.vae!.split('.')[0]);
                } else {
                  imageGenerationNotifier.updateVae(task.vae);
                }
                showSnackBar(context, 'VAEを設定しました'.i18n);
              },
            ),
          ],
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
}
