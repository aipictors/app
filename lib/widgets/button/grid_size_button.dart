import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridSizeButton extends HookConsumerWidget {
  const GridSizeButton({
    super.key,
    required this.currentSize,
    required this.onSizeChanged,
    this.maxItems,
  });

  final int? maxItems;

  final int currentSize;

  final Function(int size) onSizeChanged;

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
            style: FilledButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: (1 < currentSize)
                ? () {
                    onSizeChanged(currentSize - 1);
                  }
                : null,
            icon: const Icon(Icons.remove_rounded),
          ),
          SizedBox(
            width: 16,
            child: Center(
              child: Text(
                currentSize.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            style: FilledButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: ((maxItems != null && currentSize < maxItems!) ||
                    maxItems == null)
                ? () {
                    onSizeChanged(currentSize + 1);
                  }
                : null,
            icon: const Icon(Icons.add_rounded),
          )
        ],
      ),
    );
  }
}
