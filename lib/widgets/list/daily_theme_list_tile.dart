import 'package:aipictors/widgets/container/list_tile_image_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeListTile extends HookConsumerWidget {
  const DailyThemeListTile({
    Key? key,
    required this.isCurrent,
    required this.day,
    required this.title,
    required this.worksCount,
    required this.imageURL,
    required this.onTap,
  }) : super(key: key);

  final bool isCurrent;

  final int day;

  final String title;

  final int worksCount;

  final String? imageURL;

  final VoidCallback? onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 16,
      // contentPadding: const EdgeInsets.only(
      //   right: 24,
      //   left: 16,
      //   top: 8,
      //   bottom: 8,
      // ),
      tileColor: isCurrent
          ? Theme.of(context).colorScheme.primaryContainer
          : Colors.transparent,
      trailing: ListTileImageContainer(
        thumbnailImageURL: imageURL,
      ),
      onTap: onTap,
      title: Text(
        '${worksCount.toString()}件',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      leading: Text(
        isCurrent ? '今日' : '${day.toString()}日',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      subtitle: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
