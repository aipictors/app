import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationImageContainerMedium extends HookConsumerWidget {
  const NotificationImageContainerMedium({
    Key? key,
    required this.workTitle,
    required this.workImageURL,
  }) : super(key: key);

  final String? workTitle;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    if (workImageURL == null) {
      return Container();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: workImageURL!,
        fit: BoxFit.cover,
        width: 80,
      ),
    );
  }
}
