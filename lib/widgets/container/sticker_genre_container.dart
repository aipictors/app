import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerGenreContainer extends HookConsumerWidget {
  const StickerGenreContainer({
    super.key,
    required this.genre,
  });

  final List<String> genre;

  @override
  Widget build(context, ref) {
    return Wrap(
      spacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const SizedBox(width: 16),
        Text('ジャンル'.i18n),
        const SizedBox(width: 4),
        for (final category in genre)
          FilledButton.tonal(
            style: FilledButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(category),
            onPressed: () {},
          ),
        const SizedBox(width: 16),
      ],
    );
  }
}
