import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/features/generation/__generated__/viewer_image_generation_results.req.gql.dart';
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

    final request = GViewerImageGenerationResultsReq((builder) {
      builder
        ..vars.offset = 0
        ..vars.limit = config.graphqlQueryLimit;
    });

    return Column(
      children: [
        OperationBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final resultList = response.data?.viewer?.imageGenerationResults;
            if (resultList == null) {
              return const LoadingProgress();
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                final result = resultList[index];
                // 生成中なら進捗状況を表示する
                if (resultList[index].status ==
                        GImageGenerationStatus.IN_PROGRESS ||
                    resultList[index].status ==
                        GImageGenerationStatus.PENDING ||
                    resultList[index].status ==
                        GImageGenerationStatus.RESERVED) {
                  return const GeneratingImageContainer();
                }
                if (resultList[index].nanoid == null ||
                    resultList[index].thumbnailUrl == null) {
                  return const DeletedImageGenerationTaskErrorContainer();
                }
                return InkWell(
                  onTap: () {
                    onTap(result.nanoid!);
                  },
                  child: PostImage(
                    imageURL: result.thumbnailUrl,
                    httpHeaders: const {
                      'Referer': 'https://beta.aipictors.com/',
                    },
                    imageAspectRatio: 1,
                    thumbnailImagePosition: null,
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
