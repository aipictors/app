import 'package:aipictors/default.i18n.dart';
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
    required this.isFolded,
  }) : super(key: key);

  final String workId;

  final bool isLiked;

  final bool isFolded;

  @override
  Widget build(context, ref) {
    final isLikedInMemory = useState(isLiked);
    final isFoldedInMemory = useState(isFolded);

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
                isLiked: isFoldedInMemory.value,
                likeBuilder: (bool isFolded) {
                  return Icon(
                    Icons.folder,
                    size: 28,
                    color: isFoldedInMemory.value
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  );
                },
                onTap: (isFolded) async {
                  onAddToFolder(context);
                  isFoldedInMemory.value = !isFoldedInMemory.value;
                  return !isFolded;
                },
              ),
            ],
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            child: Text(
              'コメント'.i18n,
              style: const TextStyle(
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

  /// 作品をブックマークする
  void onAddToFolder(BuildContext context) {
    showUnavailableSnackBar(context);
  }
}
