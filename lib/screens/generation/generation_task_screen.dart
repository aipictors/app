import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_task.req.gql.dart';
import 'package:aipictors/mutations/update_protected_image_generation_task.dart';
import 'package:aipictors/mutations/update_rating_image_generation_task.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/screens/error/data_not_found_error_screen.dart';
import 'package:aipictors/screens/error/deleted_work_error_container.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/utils/reuse_image_generation_task.dart';
import 'package:aipictors/utils/to_generation_image_url.dart';
import 'package:aipictors/utils/to_generation_size_type_text.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/container/generation/generation_protect_button.dart';
import 'package:aipictors/widgets/container/generation/generation_rating_container.dart';
import 'package:aipictors/widgets/container/generation/generation_setting_container.dart';
import 'package:aipictors/widgets/container/generation/prompts_container.dart';
import 'package:aipictors/widgets/image/interactive_work_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 生成画像の詳細
// TODO: デザインを見直す
class GenerationTaskScreen extends HookConsumerWidget {
  const GenerationTaskScreen({
    super.key,
    required this.taskNanoId,
  });

  final String taskNanoId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final imageGeneration = ref.watch(imageGenerationProvider);

    final imageGenerationNotifier = ref.read(imageGenerationProvider.notifier);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: GViewerImageGenerationTaskReq((builder) {
        builder.vars.id = taskNanoId;
      }),
      builder: (context, response) {
        final task = response.data?.imageGenerationTask;
        if (task == null) {
          return const DataNotFoundErrorScreen();
        }
        if (task.isDeleted) {
          return const DeletedWorkErrorScreen();
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text('生成履歴'.i18n),
          ),
          extendBody: true,
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8 * 1.5),
                    InteractiveWorkImage(
                      downloadURL: toGenerationImageUrl(
                          task.token!, task.imageFileName!),
                      headers: const {
                        'Referer': 'https://beta.aipictors.com/',
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(children: [
                      GenerationRatingContainer(
                        currentRating: task.rating!,
                        onPressed: (int rating) {
                          onRating(context, task.nanoid!,
                              (task.rating != rating) ? rating : 0);
                        },
                      ),
                      const Spacer(),
                      GenerationProtectButton(
                          isProtected: task.isProtected ?? false,
                          onPressed: (bool newProtectionState) {
                            onProtect(
                                context, task.nanoid!, newProtectionState);
                          })
                    ]),
                    const SizedBox(height: 8),
                    Text(
                      'プロンプト'.i18n,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    PromptsContainer(
                        prompts: task.prompt,
                        onPressed: (String prompt) {
                          imageGenerationNotifier.updatePrompt(
                              '${imageGeneration.prompt}, $prompt');
                          showSnackBar(
                              context,
                              'プロンプトに _PROMPT_ を追加しました'.i18n.replaceAllMapped(
                                    RegExp(r'_PROMPT_'),
                                    (match) => prompt,
                                  ));
                        }),
                    const SizedBox(height: 8),
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
                              'ネガティブプロンプトに _NEGATIVE_PROMPT_ を追加しました'
                                  .i18n
                                  .replaceAllMapped(
                                    RegExp(r'_NEGATIVE_PROMPT_'),
                                    (match) => negativePrompt,
                                  ));
                        }),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                      name: 'モデル'.i18n,
                      value: task.model.name.split('.')[0],
                      onPressed: () {
                        imageGenerationNotifier.updateModel(task.model.name);
                        showSnackBar(context, 'モデルを設定しました'.i18n);
                      },
                    ),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                      name: 'サイズ'.i18n,
                      value: toGenerationSizeTypeText(task.sizeType),
                      onPressed: () {
                        imageGenerationNotifier.updateSizeType(task.sizeType);
                        showSnackBar(context, 'サイズを設定しました'.i18n);
                      },
                    ),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                      name: 'Seed'.i18n,
                      value: task.seed.toInt().toString(),
                      onPressed: () {
                        imageGenerationNotifier.updateSeed(task.seed.toInt());
                        showSnackBar(context, 'Seedを設定しました'.i18n);
                      },
                    ),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                      name: 'Steps'.i18n,
                      value: task.steps.toString(),
                      onPressed: () {
                        imageGenerationNotifier.updateSteps(task.steps);
                        showSnackBar(context, 'Stepsを設定しました'.i18n);
                      },
                    ),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                      name: 'Scale'.i18n,
                      value: task.scale.toString(),
                      onPressed: () {
                        imageGenerationNotifier.updateScale(task.scale);
                        showSnackBar(context, 'Scaleを設定しました'.i18n);
                      },
                    ),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                      name: 'Sampler'.i18n,
                      value: task.sampler.toString(),
                      onPressed: () {
                        imageGenerationNotifier.updateSampler(task.sampler);
                        showSnackBar(context, 'Samplerを設定しました'.i18n);
                      },
                    ),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                      name: 'VAE'.i18n,
                      value: task.vae.toString(),
                      onPressed: () {
                        if (task.vae != 'None') {
                          imageGenerationNotifier
                              .updateVae(task.vae!.split('.')[0]);
                        } else {
                          imageGenerationNotifier.updateVae(task.vae!);
                        }
                        showSnackBar(context, 'VAEを設定しました'.i18n);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: FilledButton(
            child: Text('復元する'.i18n),
            onPressed: () {
              reuseImageGenerationTask(task, imageGenerationNotifier);
              showSnackBar(context, '生成情報を復元しました'.i18n);
            },
          ),
        );
      },
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
