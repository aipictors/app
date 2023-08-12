import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';

class FeedFolderButton extends HookConsumerWidget {
  const FeedFolderButton({
    Key? key,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final int? count = null;

  final bool isActive;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    final isActiveInMemory = useState(isActive);

    return LikeButton(
      isLiked: isActiveInMemory.value,
      likeCountPadding: const EdgeInsets.only(left: 4),
      likeBuilder: (isLiked) {
        return Icon(
          Icons.folder_rounded,
          size: 28,
          color: isActiveInMemory.value
              ? Theme.of(context).colorScheme.primary
              : null,
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
