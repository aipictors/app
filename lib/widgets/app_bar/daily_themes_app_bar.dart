import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemesAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const DailyThemesAppBar({
    Key? key,
    required this.hasPrev,
    required this.hasNext,
    required this.onPrev,
    required this.onNext,
    required this.month,
    required this.year,
  }) : super(key: key);

  final bool hasPrev;

  final bool hasNext;

  final VoidCallback? onPrev;

  final VoidCallback? onNext;

  final int year;

  final int month;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(context, ref) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilledButton.tonal(
            onPressed: hasPrev ? onPrev : null,
            child: Text(
              '前月'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '_YEAR_年 _MONTH_月'
                .i18n
                .replaceAllMapped(
                  RegExp(r'_YEAR_'),
                  (match) => year.toString(),
                )
                .replaceAllMapped(
                  RegExp(r'_MONTH_'),
                  (match) => month.toString(),
                ),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          FilledButton.tonal(
            onPressed: hasNext ? onNext : null,
            child: Text(
              '来月'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
