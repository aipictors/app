import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/utils/to_readable_date.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/link.dart';

class PromotionListTile extends HookConsumerWidget {
  const PromotionListTile({
    Key? key,
    required this.title,
    required this.description,
    required this.pageURL,
    required this.imageURL,
    required this.startDateTime,
    required this.endDateTime,
  }) : super(key: key);

  final String title;

  final String description;

  final String? pageURL;

  final String? imageURL;

  final int startDateTime;

  final int endDateTime;

  @override
  Widget build(context, ref) {
    return ListTile(
      title: Text(toReadableDate(startDateTime)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(description),
          if (imageURL != null) const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AspectRatio(
              aspectRatio: 1200 / 630,
              child: CachedNetworkImage(
                width: double.infinity,
                imageUrl: imageURL!,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                  );
                },
                errorWidget: (context, uri, error) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                  );
                },
              ),
            ),
          ),
          if (pageURL != null) const SizedBox(height: 8),
          if (pageURL != null)
            SizedBox(
              width: double.infinity,
              child: Link(
                uri: Uri.parse(pageURL!),
                target: LinkTarget.blank,
                builder: (context, openLink) {
                  return FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: openLink,
                    child: Text('ページを開く'.i18n),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
