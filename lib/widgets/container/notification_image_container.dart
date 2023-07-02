import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationImageContainer extends HookConsumerWidget {
  const NotificationImageContainer({
    Key? key,
    required this.workTitle,
    required this.workImageURL,
  }) : super(key: key);

  final String? workTitle;

  final String? workImageURL;

  @override
  Widget build(context, ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            workImageURL!,
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
