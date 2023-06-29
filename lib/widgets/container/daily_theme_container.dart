import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyThemeContainer extends HookConsumerWidget {
  const DailyThemeContainer({
    Key? key,
    required this.isCurrent,
    required this.day,
    required this.title,
    required this.worksCount,
    required this.thumbnailImageURL,
  }) : super(key: key);

  final bool isCurrent;

  final int day;

  final String title;

  final int worksCount;

  final String? thumbnailImageURL;

  @override
  Widget build(context, ref) {
    return Container(
      color: isCurrent
          ? Theme.of(context).secondaryHeaderColor
          : Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isCurrent ? "今日" : '${day.toString()}日',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              // const SizedBox(height: 2),
              Text('${worksCount.toString()}件の作品'),
            ],
          ),
          if (thumbnailImageURL == null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 96,
                height: 96,
                color: Theme.of(context).disabledColor,
              ),
            ),
          if (thumbnailImageURL != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                width: 96,
                height: 96,
                imageUrl: thumbnailImageURL!,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Theme.of(context).primaryColorLight,
                  );
                },
                errorWidget: (context, uri, error) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Theme.of(context).disabledColor,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
