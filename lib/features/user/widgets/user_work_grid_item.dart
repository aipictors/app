import 'package:aipictors/features/user/widgets/__generated__/user_work_grid_item.data.gql.dart';
import 'package:aipictors/widgets/image/post_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserWorkGridItem extends HookConsumerWidget {
  const UserWorkGridItem({
    super.key,
    required this.work,
  });

  final GUserWorkGridItem work;

  @override
  Widget build(context, ref) {
    return InkWell(
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: work.id,
        );
        context.push('/works/${work.id}');
      },
      child: PostImage(
        imageURL: work.imageURL,
        imageAspectRatio: work.imageAspectRatio,
        thumbnailImagePosition: work.thumbnailImagePosition,
      ),
    );
  }
}
