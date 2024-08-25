import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/daily_theme/widgets/__generated__/daily_theme_list_tile.data.gql.dart';
import 'package:aipictors/utils/to_weekday.dart';
import 'package:aipictors/widgets/list_tile_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeListTile extends HookConsumerWidget {
  const DailyThemeListTile({
    super.key,
    required this.dailyTheme,
    required this.onTap,
  });

  final GDailyThemeListTile dailyTheme;

  final VoidCallback? onTap;

  @override
  Widget build(context, ref) {
    final weekDay = toWeekday(
      dailyTheme.year,
      dailyTheme.month,
      dailyTheme.day,
    );

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
        thumbnailImageURL: dailyTheme.firstWork?.largeThumbnailImageURL,
      ),
      onTap: onTap,
      title: Text(
        '_WORKS_COUNT_件'.i18n.replaceAllMapped(RegExp(r'_WORKS_COUNT_'),
            (match) => dailyTheme.worksCount.toString()),
        style: Theme.of(context).textTheme.labelSmall,
      ),
      leading: Column(
        children: [
          const Spacer(),
          Text(
            isCurrent
                ? '今日'.i18n
                : '_DAY_日'.i18n.replaceAllMapped(
                    RegExp(r'_DAY_'), (match) => dailyTheme.day.toString()),
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
        dailyTheme.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  bool get isCurrent {
    final now = DateTime.now();
    return dailyTheme.year == now.year &&
        dailyTheme.month == now.month &&
        dailyTheme.day == now.day;
  }
}
