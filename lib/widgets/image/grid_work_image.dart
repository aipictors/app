import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridWorkImage extends HookConsumerWidget {
  const GridWorkImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String? imageURL;

  @override
  Widget build(context, ref) {
    if (imageURL == null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).disabledColor,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageURL!,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.primaryContainer,
        );
      },
      errorWidget: (context, uri, error) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).disabledColor,
        );
      },
    );
  }
}
