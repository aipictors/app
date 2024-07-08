import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerCategoriesContainer extends HookConsumerWidget {
  const StickerCategoriesContainer({
    super.key,
    required this.categories,
  });

  final List<String> categories;

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
                for (final category in categories)
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
