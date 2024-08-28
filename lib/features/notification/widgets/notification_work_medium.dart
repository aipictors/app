import 'package:aipictors/features/notification/widgets/__generated__/notification_work.data.gql.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWorkMedium extends HookConsumerWidget {
  const NotificationWorkMedium({
    super.key,
    required this.work,
  });

  final GNotificationWork? work;

  @override
  Widget build(context, ref) {
    if (work == null) {
      return Container();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: work!.largeThumbnailImageURL,
        fit: BoxFit.cover,
        width: 80,
      ),
    );
  }
}
