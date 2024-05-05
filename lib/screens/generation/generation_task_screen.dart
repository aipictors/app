import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_task.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/screens/error/data_not_found_error_screen.dart';
import 'package:aipictors/screens/error/deleted_work_error_container.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/utils/to_generation_image_url.dart';
import 'package:aipictors/utils/to_generation_size_type_text.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/container/generation/generation_setting_container.dart';
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
                    Text(
                      'プロンプト'.i18n,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      readOnly: true,
                      initialValue: task.prompt,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ネガティブプロンプト'.i18n,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      readOnly: true,
                      initialValue: task.negativePrompt,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                        name: 'モデル'.i18n, value: task.model.name),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                        name: 'サイズ'.i18n,
                        value: toGenerationSizeTypeText(task.sizeType)),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                        name: 'Seed'.i18n, value: task.seed.toInt().toString()),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                        name: 'Steps'.i18n, value: task.steps.toString()),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                        name: 'Scale'.i18n, value: task.scale.toString()),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                        name: 'Sampler'.i18n, value: task.sampler.toString()),
                    const SizedBox(height: 8),
                    GenerationSettingContainer(
                        name: 'VAE'.i18n, value: task.vae.toString()),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: FilledButton(
            child: Text('復元する'.i18n),
            onPressed: () {
              imageGenerationNotifier.updateModel(task.model.name);
              imageGenerationNotifier.updatePrompt(task.prompt);
              imageGenerationNotifier.updateNegativePrompt(task.negativePrompt);
              imageGenerationNotifier.updateSeed(task.seed.toInt());
              imageGenerationNotifier.updateSteps(task.steps);
              imageGenerationNotifier.updateScale(task.scale);
              imageGenerationNotifier.updateSampler(task.sampler);
              imageGenerationNotifier.updateSizeType(task.sizeType);
              if (task.vae != 'None') {
                imageGenerationNotifier.updateVae(task.vae!.split('.')[0]);
              } else {
                imageGenerationNotifier.updateVae(task.vae!);
              }
            },
          ),
        );
      },
    );
  }
}
