import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileAvatar extends HookConsumerWidget {
  const UserProfileAvatar({
    super.key,
    required this.imageURL,
    this.radius,
  });

  final String? imageURL;

  final double? radius;

  @override
  Widget build(context, ref) {
    if (imageURL == null) {
      return CircleAvatar(
        radius: radius ?? 14,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const CircleAvatar(radius: 40),
      );
    }

    return CircleAvatar(
      radius: radius ?? 14,
      backgroundImage: CachedNetworkImageProvider(imageURL!),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
