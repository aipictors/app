import 'package:aipictors/features/information/widgets/__generated__/promotion_list_tile.data.gql.dart';
import 'package:aipictors/utils/to_readable_date.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:url_launcher/link.dart';

class PromotionListTile extends HookConsumerWidget {
  const PromotionListTile({
    super.key,
    required this.promotion,
  });

  final GPromotionListTile promotion;

  @override
  Widget build(context, ref) {
    return ListTile(
      title: Text(toReadableDate(promotion.startDateTime)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            promotion.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(promotion.description),
          if (promotion.imageURL != null) const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AspectRatio(
              aspectRatio: 1200 / 630,
              child: CachedNetworkImage(
                width: double.infinity,
                imageUrl: promotion.imageURL!,
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
          // if (pageURL != null) const SizedBox(height: 8),
          // if (pageURL != null)
          //   SizedBox(
          //     width: double.infinity,
          //     child: Link(
          //       uri: Uri.parse(pageURL!).replace(queryParameters: {
          //         'prefers-color-scheme': config.isDarkMode ? 'dark' : 'light',
          //       }),
          //       target: LinkTarget.blank,
          //       builder: (context, openLink) {
          //         return FilledButton.tonal(
          //           style: FilledButton.styleFrom(
          //             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //           ),
          //           onPressed: openLink,
          //           child: Text('ページを開く'.i18n),
          //         );
          //       },
          //     ),
          //   ),
        ],
      ),
    );
  }
}
