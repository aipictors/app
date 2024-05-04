import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/generation_model_version.dart';
import 'package:aipictors/graphql/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.data.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/image_models.req.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/image_generation_provider.dart';
import 'package:aipictors/providers/viewer_image_generation_status_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/states/image_generation_state.dart';
import 'package:aipictors/utils/image_generation_task_creator.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/generation/generation_sampler_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_size_type_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker_modal.dart';
import 'package:aipictors/widgets/form/generation/generation_prompt_form.dart';
import 'package:aipictors/widgets/container/generation/generation_vae_picker.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/form/generation/generation_scale_input.dart';
import 'package:aipictors/widgets/form/generation/generation_seed_input.dart';
import 'package:aipictors/widgets/form/generation/generation_steps_input.dart';
import 'package:aipictors/widgets/view/generated_images_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画像生成の履歴一覧
class GenerationTasksView extends HookConsumerWidget {
  const GenerationTasksView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final imageGeneration = ref.watch(imageGenerationProvider);

    final imageGenerationNotifier = ref.read(imageGenerationProvider.notifier);

    final config = ref.watch(configProvider);

    final ValueNotifier<GViewerImageGenerationStatusData?>
        viewerImageGenerationStatus = useState(null);
    ref
        .watch(viewerImageGenerationStatusProvider.future)
        .then((value) => viewerImageGenerationStatus.value = value);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GViewerImageGenerationTasksReq((builder) {
      builder
        ..vars.offset = 0
        ..vars.limit = config.graphqlQueryLimit;
    });
    return OperationBuilder(
      client: client.value!,
      operationRequest: request,
      builder: (context, response) {
        final taskList = response.data?.viewer?.imageGenerationTasks;
        if (taskList == null) {
          return const LoadingScreen();
        }
        return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return Text('開発中');
            });
      },
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
}
