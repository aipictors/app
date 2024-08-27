import 'package:aipictors/features/post/widgets/__generated__/post_grid_item.data.gql.dart';
import 'package:aipictors/widgets/image/post_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostGridItem extends HookConsumerWidget {
  const PostGridItem({
    super.key,
    required this.post,
  });

  final GPostGridItem post;

  @override
  Widget build(context, ref) {
    return InkWell(
      onTap: () {
        FirebaseAnalytics.instance.logSelectContent(
          contentType: 'work',
          itemId: post.id,
        );
        context.push('/works/${post.id}');
      },
      child: PostImage(
        imageURL: post.imageURL,
        imageAspectRatio: post.imageAspectRatio,
        thumbnailImagePosition: post.thumbnailImagePosition,
      ),
    );
  }
}
