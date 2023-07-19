import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerImage extends HookConsumerWidget {
  const StickerImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String? imageURL;

  @override
  Widget build(context, ref) {
    if (imageURL == null) {
      return Container();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        imageURL!,
        fit: BoxFit.cover,
        width: 80,
      ),
    );
  }
}
