import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_generation_image_url.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/generation/generating_image_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 探索・人気の作品
class GeneratedImagesGridView extends HookConsumerWidget {
  const GeneratedImagesGridView({
    super.key,
    required this.onTap,
  });

  final Function(String id) onTap;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    final config = ref.watch(configProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GViewerImageGenerationTasksReq((builder) {
      builder
        ..vars.offset = 0
        ..vars.limit = config.graphqlQueryLimit;
    });

    return Column(
      children: [
        FilledButton(
            onPressed: () {
              final req = request.rebuild((builder) {
                builder
                  ..vars.limit = config.graphqlQueryLimit
                  ..vars.offset = 0;
              });
              client.value?.requestController.add(req);
            },
            child: const Text('更新')),
        OperationBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final taskList = response.data?.viewer?.imageGenerationTasks;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: taskList!.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return InkWell(
                  onTap: () {
                    onTap(task.nanoid!);
                  },
                  child: (task.status == GImageGenerationStatus.DONE)
                      ? GridWorkImage(
                          imageURL: toGenerationImageUrl(task.thumbnailToken!,
                              task.thumbnailImageFileName!),
                          httpHeaders: const {
                            'Referer': 'https://beta.aipictors.com/',
                          },
                          imageAspectRatio: 1,
                          thumbnailImagePosition: null,
                        )
                      : const GeneratingImageContainer(),
                );
              },
            );
          },
        )
      ],
    );
  }
}
