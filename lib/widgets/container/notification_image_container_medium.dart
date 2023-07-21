import 'package:aipictors/default.i18n.dart';
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
      return Text(
        'この作品は削除されました。'.i18n,
        style: Theme.of(context).textTheme.labelMedium,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            workImageURL!,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          workTitle!,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
