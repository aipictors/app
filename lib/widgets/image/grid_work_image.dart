import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridWorkImage extends HookConsumerWidget {
  const GridWorkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(context, ref) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
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
