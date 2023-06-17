import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerImage extends HookConsumerWidget {
  const StickerImage({
    Key? key,
    required this.src,
  }) : super(key: key);

  final String src;

  @override
  Widget build(context, ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        src,
        fit: BoxFit.cover,
        width: 80,
      ),
    );
  }
}
