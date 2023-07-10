import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedImageContainer extends HookConsumerWidget {
  const FeedImageContainer({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String? imageURL;

  final double height = 240;

  @override
  Widget build(context, ref) {
    if (imageURL == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          height: height,
          color: Theme.of(context).disabledColor,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: imageURL!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: height,
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
      ),
    );
  }
}
