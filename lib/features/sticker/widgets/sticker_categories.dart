import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/sticker/widgets/__generated__/sticker_categories.data.gql.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerCategories extends HookConsumerWidget {
  const StickerCategories({
    super.key,
    required this.sticker,
  });

  final GStickerCategories sticker;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text('カテゴリ'.i18n),
        const SizedBox(width: 4),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                for (final category in sticker.categories.toList())
                  FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(category),
                    onPressed: () {},
                  ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
