import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';

class FeedLikeButton extends HookConsumerWidget {
  const FeedLikeButton({
    Key? key,
    required this.count,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final int count;

  final bool isActive;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    final isActiveInMemory = useState(isActive);

    return LikeButton(
      isLiked: isActiveInMemory.value,
      likeCount: count + (isActiveInMemory.value ? 1 : 0),
      likeCountPadding: const EdgeInsets.only(left: 4),
      likeBuilder: (isLiked) {
        if (isActiveInMemory.value) {
          return Icon(Icons.favorite_rounded,
              size: 28, color: Theme.of(context).colorScheme.error);
        }
        return const Icon(
          Icons.favorite_outline_rounded,
          size: 28,
        );
      },
      onTap: (isLiked) async {
        onTap();
        isActiveInMemory.value = !isActiveInMemory.value;
        return !isLiked;
      },
    );
  }
}
