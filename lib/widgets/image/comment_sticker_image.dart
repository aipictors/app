import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentStickerImage extends HookConsumerWidget {
  const CommentStickerImage({
    Key? key,
    required this.downloadURL,
    required this.size,
  }) : super(key: key);

  final String downloadURL;

  final double size;

  @override
  Widget build(context, ref) {
    return CachedNetworkImage(
      imageUrl: downloadURL,
      fit: BoxFit.cover,
      width: size,
      height: size,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Container(
          width: size,
          height: size,
          color: Theme.of(context).colorScheme.primaryContainer,
        );
      },
      errorWidget: (context, uri, error) {
        return Container(
          width: size,
          height: size,
          color: Theme.of(context).disabledColor,
        );
      },
    );
  }
}
