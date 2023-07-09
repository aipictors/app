import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileAvatar extends HookConsumerWidget {
  const UserProfileAvatar({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String? imageURL;

  @override
  Widget build(context, ref) {
    if (imageURL == null) {
      return CircleAvatar(
        radius: 14,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const CircleAvatar(radius: 40),
      );
    }

    return CircleAvatar(
      radius: 14,
      backgroundImage: NetworkImage(imageURL!),
    );
  }
}
