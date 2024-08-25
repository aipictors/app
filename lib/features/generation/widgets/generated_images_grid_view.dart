import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/generation/queries/__generated__/viewer_image_generation_tasks.req.gql.dart';
import 'package:aipictors/features/generation/utils/to_generation_image_url.dart';
import 'package:aipictors/features/generation/widgets/generating_image_container.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/deleted_image_generation_task_error_container.dart';
import 'package:aipictors/widgets/image/post_image.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 生成画像
class GeneratedImagesGridView extends HookConsumerWidget {
  const GeneratedImagesGridView({
    super.key,
    required this.onTap,
    required this.onUpdate,
  });

  final Function(String id) onTap;

  final VoidCallback onUpdate;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    final config = ref.watch(configProvider);

    if (client.value == null) {
      return const LoadingProgress();
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
              onUpdate();
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
                // 生成中なら進捗状況を表示する
                if (taskList[index].status ==
                        GImageGenerationStatus.IN_PROGRESS ||
                    taskList[index].status == GImageGenerationStatus.PENDING ||
                    taskList[index].status == GImageGenerationStatus.RESERVED) {
                  return const GeneratingImageContainer();
                }
                if (taskList[index].nanoid == null ||
                    taskList[index].token == null ||
                    taskList[index].imageFileName == null) {
                  return const DeletedImageGenerationTaskErrorContainer();
                }
                final layout =
                    Layout.fromWidth(MediaQuery.of(context).size.width);
                return InkWell(
                    onTap: () {
                      onTap(task.nanoid!);
                    },
                    child: PostImage(
                      // スマホならサムネサイズを、タブレットなら通常サイズを表示する
                      imageURL: (layout == Layout.compact)
                          ? toGenerationImageUrl(task.thumbnailToken!,
                              task.thumbnailImageFileName!)
                          : toGenerationImageUrl(
                              task.token!, task.imageFileName!),
                      httpHeaders: const {
                        'Referer': 'https://beta.aipictors.com/',
                      },
                      imageAspectRatio: 1,
                      thumbnailImagePosition: null,
                    ));
              },
            );
          },
        )
      ],
    );
  }
}
