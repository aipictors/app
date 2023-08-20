import 'package:aipictors/mutations/create_work_like.dart';
import 'package:aipictors/utils/show_unavailable_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';

class WorkBottomAppContainer extends HookConsumerWidget {
  const WorkBottomAppContainer({
    Key? key,
    required this.workId,
    required this.isLiked,
  }) : super(key: key);

  final String workId;

  final bool isLiked;

  @override
  Widget build(context, ref) {
    final isLikedInMemory = useState(isLiked);

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              LikeButton(
                isLiked: isLikedInMemory.value,
                likeBuilder: (isLiked) {
                  return Icon(
                    Icons.favorite_rounded,
                    size: 28,
                    color: isLikedInMemory.value
                        ? Theme.of(context).colorScheme.error
                        : null,
                  );
                },
                onTap: (isLiked) async {
                  onCreateWorkLike();
                  isLikedInMemory.value = !isLikedInMemory.value;
                  return !isLiked;
                },
              ),
              const SizedBox(width: 16),
              LikeButton(
                isLiked: isLiked,
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.bookmark_rounded,
                    size: 28,
                    color:
                        isLiked ? Theme.of(context).colorScheme.primary : null,
                  );
                },
                onTap: (isLiked) async {
                  return !isLiked;
                },
              ),
            ],
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            child: const Text(
              'コメント',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              showUnavailableSnackBar(context);
            },
          ),
        ],
      ),
    );
  }

  onCreateWorkLike() {
    createWorkLike((builder) {
      return builder..vars.input.workId = workId;
    });
  }
}
