import 'package:aipictors/widgets/image/post_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './__generated__/work_award_grid_item.data.gql.dart';

class WorkAwardGridItem extends HookConsumerWidget {
  const WorkAwardGridItem({
    super.key,
    required this.workAward,
  });

  final GWorkAwardGridItem workAward;

  @override
  Widget build(context, ref) {
    final work = workAward.work;

    if (work == null) {
      return const SizedBox();
    }

    return PostImage(
      imageURL: work.imageURL,
      imageAspectRatio: work.imageAspectRatio,
      thumbnailImagePosition: work.thumbnailImagePosition,
    );
  }
}
