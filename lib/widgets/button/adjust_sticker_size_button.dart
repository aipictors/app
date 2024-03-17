import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdjustStickerSizeButton extends HookConsumerWidget {
  const AdjustStickerSizeButton({
    super.key,
    required this.currentSize,
    required this.onSizeChanged,
  });

  final int currentSize;

  final Future Function(int size) onSizeChanged;

  @override
  Widget build(context, ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Theme.of(context).hoverColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              onSizeChanged(currentSize - 1);
            },
            icon: const Icon(Icons.remove_rounded),
          ),
          IconButton(
            onPressed: () {
              onSizeChanged(currentSize + 1);
            },
            icon: const Icon(Icons.add_rounded),
          )
        ],
      ),
    );
  }
}
