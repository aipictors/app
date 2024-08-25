import 'package:aipictors/widgets/image/grid_work_image.dart';
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
    return GridWorkImage(
      imageURL: workAward.work.imageURL,
      imageAspectRatio: workAward.work.imageAspectRatio,
      thumbnailImagePosition: workAward.work.thumbnailImagePosition,
    );
  }
}
