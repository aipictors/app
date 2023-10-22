import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileAvatar extends HookConsumerWidget {
  const UserProfileAvatar({
    Key? key,
    required this.imageURL,
    this.radius,
  }) : super(key: key);

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
      backgroundImage: NetworkImage(imageURL!),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
