import 'package:aipictors/widgets/dialog/interactive_image_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedImage extends HookConsumerWidget {
  const FeedImage({
    super.key,
    required this.imageURL,
    required this.imageAspectRatio,
    this.headers,
  });

  final String? imageURL;

  final double imageAspectRatio;

  final double height = 240;

  final Map<String, String>? headers;

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

    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 2,
          child: AspectRatio(
            aspectRatio: imageAspectRatio,
            child: CachedNetworkImage(
              imageUrl: imageURL!,
              fit: BoxFit.cover,
              width: double.infinity,
              httpHeaders: headers,
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
          ),
        ),
      ),
      onTap: () {
        showGeneralDialog(
          barrierColor: Colors.black87,
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return InteractiveImageDialog(imageURL!);
          },
        );
      },
    );
  }
}
