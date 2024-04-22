import 'package:aipictors/widgets/app_bar/search_app_bar.dart';
import 'package:aipictors/widgets/button/adjust_sticker_size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickersHeaderContainer extends HookConsumerWidget {
  const StickersHeaderContainer({
    super.key,
    required this.currentSize,
    required this.maxItems,
    required this.onSubmit,
    required this.onSizeChanged,
  });

  final int currentSize;

  final int maxItems;

  final void Function(String text) onSubmit;

  final void Function(int size) onSizeChanged;

  @override
  Widget build(context, ref) {
    final isFilled = useState(false);

    final searchText = useState('');

    final searchContainer = SearchContainer(
      isFilled: isFilled.value,
      initialText: '',
      decoration: const BoxDecoration(),
      onSubmit: (controller) {
        final text = controller.text;
        searchText.value = text;
        onSubmit(text);
      },
      onFill: (value) {
        isFilled.value = value;
      },
    );

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).hoverColor,
            ),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: searchContainer,
                ),
                if (isFilled.value)
                  IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () {
                      isFilled.value = false;
                      searchText.value = '';
                      searchContainer.clear();
                      onSubmit('');
                    },
                  )
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
        AdjustStickerSizeButton(
          currentSize: currentSize,
          maxItems: maxItems,
          onSizeChanged: (int size) async {
            onSizeChanged(size);
          },
        ),
      ],
    );
  }
}
