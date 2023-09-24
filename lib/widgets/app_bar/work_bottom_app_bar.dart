import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/create_work_like.dart';
import 'package:aipictors/utils/show_unavailable_snack_bar.dart';
import 'package:aipictors/widgets/container/work_shortcut_action_stickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    // final isFoldedInMemory = useState(isFolded);

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 64,
                child: FilledButton.tonalIcon(
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: isLikedInMemory.value
                        ? Theme.of(context).colorScheme.error
                        : null,
                  ),
                  label: Text('いいね'.i18n),
                  onPressed: () {
                    onCreateWorkLike();
                    isLikedInMemory.value = !isLikedInMemory.value;
                  },
                ),
              ),

              // const SizedBox(width: 16),
              // LikeButton(
              //   isLiked: isFoldedInMemory.value,
              //   likeBuilder: (bool isFolded) {
              //     if (isFoldedInMemory.value) {
              //       return Icon(Icons.folder_rounded,
              //           size: 28, color: Theme.of(context).colorScheme.primary);
              //     }

              //     return const Icon(
              //       Icons.folder_outlined,
              //       size: 28,
              //     );
              //   },
              //   onTap: (isFolded) async {
              //     onAddToFolder(context);
              //     isFoldedInMemory.value = !isFoldedInMemory.value;
              //     return !isFolded;
              //   },
              // ),
            ],
          ),
          WorkShortcutActionStickers(
            onChange: (stickerId) {},
          ),
          // FilledButton.tonal(
          //   child: Text(
          //     'コメント'.i18n,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onPressed: () {
          //     showUnavailableSnackBar(context);
          //   },
          // ),
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
