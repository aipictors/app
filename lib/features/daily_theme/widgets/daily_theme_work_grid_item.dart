import 'package:aipictors/features/daily_theme/widgets/__generated__/daily_theme_work_grid_item.data.gql.dart';
import 'package:aipictors/widgets/image/post_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeWorkGridItem extends HookConsumerWidget {
  const DailyThemeWorkGridItem({
    super.key,
    required this.work,
  });

  final GDailyThemeWorkGridItem work;

  @override
  Widget build(context, ref) {
    return GestureDetector(
      child: PostImage(
        imageURL: work.imageURL,
        imageAspectRatio: work.imageAspectRatio,
        thumbnailImagePosition: work.thumbnailImagePosition,
      ),
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: work.id,
        );
        context.push('/works/${work.id}');
      },
    );
  }
}
