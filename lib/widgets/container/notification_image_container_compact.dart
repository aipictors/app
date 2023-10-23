import 'package:aipictors/default.i18n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationImageContainerCompact extends HookConsumerWidget {
  const NotificationImageContainerCompact({
    Key? key,
    required this.workTitle,
    required this.workImageURL,
  }) : super(key: key);

  final String? workTitle;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    if (workImageURL == null) {
      return Text(
        'この作品は削除されました。'.i18n,
        style: Theme.of(context).textTheme.labelMedium,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: workImageURL!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 80,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              workTitle!,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
