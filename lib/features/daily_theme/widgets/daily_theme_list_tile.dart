import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeListTile extends HookConsumerWidget {
  const DailyThemeListTile({
    super.key,
    required this.isCurrent,
    required this.day,
    required this.weekDay,
    required this.title,
    required this.worksCount,
    required this.imageURL,
    required this.onTap,
  });

  final bool isCurrent;

  final int day;

  final String weekDay;

  final String title;

  final int worksCount;

  final String? imageURL;

  final VoidCallback? onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 0,
        bottom: 0,
      ),
      tileColor: isCurrent
          ? Theme.of(context).colorScheme.primaryContainer
          : Colors.transparent,
      trailing: ListTileImageContainer(
        thumbnailImageURL: imageURL,
      ),
      onTap: onTap,
      title: Text(
        '_WORKS_COUNT_件'.i18n.replaceAllMapped(
            RegExp(r'_WORKS_COUNT_'), (match) => worksCount.toString()),
        style: Theme.of(context).textTheme.labelSmall,
      ),
      leading: Column(
        children: [
          const Spacer(),
          Text(
            isCurrent
                ? '今日'.i18n
                : '_DAY_日'.i18n.replaceAllMapped(
                    RegExp(r'_DAY_'), (match) => day.toString()),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '($weekDay)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer()
        ],
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
