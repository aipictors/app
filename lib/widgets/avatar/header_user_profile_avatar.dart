import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HeaderUserProfileAvatar extends HookConsumerWidget {
  const HeaderUserProfileAvatar({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String? imageURL;

  @override
  Widget build(context, ref) {
    const double size = 30;

    if (imageURL == null) {
      return CircleAvatar(
        radius: size,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const CircleAvatar(radius: size - 2),
      );
    }

    return CircleAvatar(
      radius: size,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: CircleAvatar(
        radius: size,
        backgroundImage: CachedNetworkImageProvider(imageURL!),
      ),
    );
  }
}
