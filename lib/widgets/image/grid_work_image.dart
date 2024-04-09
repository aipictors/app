import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridWorkImage extends HookConsumerWidget {
  const GridWorkImage({
    super.key,
    required this.imageURL,
    //TODO: requiredにする
    this.thumbnailImagePosition,
    this.imageAspectRatio,
  });

  final String? imageURL;

  final int? thumbnailImagePosition;

  final double? imageAspectRatio;

  @override
  Widget build(context, ref) {
    if (imageURL == null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).disabledColor,
      );
    }

    return LayoutBuilder(builder: (context, constraints) {
      double thumbnailOffset =
          constraints.maxHeight * ((thumbnailImagePosition ?? 0) / 100);
      return FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.antiAlias,
        child: Transform.translate(
          offset: ((imageAspectRatio ?? 0) <= 1.0)
              ? Offset(0, thumbnailOffset)
              : Offset(thumbnailOffset, 0),
          child: CachedNetworkImage(
            imageUrl: imageURL!,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    width: constraints.maxWidth * 2,
                    height: constraints.maxHeight * 2,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ));
            },
            errorWidget: (context, uri, error) {
              return FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    width: constraints.maxWidth * 2,
                    height: constraints.maxHeight * 2,
                    color: Theme.of(context).disabledColor,
                  ));
            },
          ),
        ),
      );
    });
  }
}
