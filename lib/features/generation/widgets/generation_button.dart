import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/generation/widgets/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationButton extends HookConsumerWidget {
  const GenerationButton({
    super.key,
    required this.viewerImageGenerationStatus,
    required this.onPressed,
  });

  final GViewerImageGenerationStatusData viewerImageGenerationStatus;

  final Future Function() onPressed;

  @override
  Widget build(context, ref) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(
        '生成する( _IN_PROGRESS_TASKS_ / _AVAILABLE_TASKS_ )'
            .i18n
            .replaceAllMapped(
              RegExp(r'_IN_PROGRESS_TASKS_'),
              (match) =>
                  viewerImageGenerationStatus
                      .viewer?.inProgressImageGenerationTasksCount
                      .toString() ??
                  '0',
            )
            .replaceAllMapped(
          RegExp(r'_AVAILABLE_TASKS_'),
          (match) {
            // 最大生成可能枚数 - 現在生成中の枚数 - 本日生成済みの枚数 = 残りの生成可能枚数
            if (viewerImageGenerationStatus
                        .viewer?.availableImageGenerationMaxTasksCount ==
                    null ||
                viewerImageGenerationStatus
                        .viewer?.inProgressImageGenerationTasksCost ==
                    null ||
                viewerImageGenerationStatus
                        .viewer?.remainingImageGenerationTasksCount ==
                    null) {
              return '0';
            }
            return (viewerImageGenerationStatus
                        .viewer!.availableImageGenerationMaxTasksCount -
                    viewerImageGenerationStatus
                        .viewer!.inProgressImageGenerationTasksCost -
                    viewerImageGenerationStatus
                        .viewer!.remainingImageGenerationTasksCount)
                .toString();
          },
        ),
      ),
    );
  }
}
