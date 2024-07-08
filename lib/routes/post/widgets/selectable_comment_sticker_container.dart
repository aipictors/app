import 'package:aipictors/routes/post/widgets/comment_sticker_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectableCommentStickerContainer extends HookConsumerWidget {
  const SelectableCommentStickerContainer({
    super.key,
    required this.downloadURL,
    required this.onTap,
    required this.isSelected,
  });

  final String downloadURL;

  final Function() onTap;

  final bool isSelected;

  @override
  Widget build(context, ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: isSelected ? 4 : 1,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor,
          ),
        ),
        child: CommentStickerImage(
          size: 52,
          downloadURL: downloadURL,
        ),
      ),
    );
  }
}
