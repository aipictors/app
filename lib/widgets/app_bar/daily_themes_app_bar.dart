import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
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
            child: const Text(
              '前月',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(children: [
            SizedBox(
              width: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    year.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Text(
              '年',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    month.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Text(
              '月',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ]),
          FilledButton.tonal(
            onPressed: hasNext ? onNext : null,
            child: const Text(
              '来月',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
