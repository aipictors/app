import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListTileImageContainer extends HookConsumerWidget {
  const ListTileImageContainer({
    super.key,
    required this.thumbnailImageURL,
  });

  final String? thumbnailImageURL;

  @override
  Widget build(context, ref) {
    if (thumbnailImageURL == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 96,
          height: 96,
          color: Theme.of(context).disabledColor,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        width: 96,
        height: 96,
        imageUrl: thumbnailImageURL!,
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
      ),
    );
  }
}
