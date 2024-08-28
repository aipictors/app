import 'package:aipictors/features/information/widgets/__generated__/announcement_list_tile.data.gql.dart';
import 'package:aipictors/utils/to_readable_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';

/// 運営からのお知らせ
class AnnouncementListTile extends HookConsumerWidget {
  const AnnouncementListTile({
    super.key,
    required this.announcement,
  });

  final GAnnouncementListTile announcement;

  @override
  Widget build(context, ref) {
    return ListTile(
      title: Text(toReadableDate(announcement.publishedAt)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            announcement.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Html(
            data: announcement.body.replaceAll(r'<p><br></p>', ''),
            style: {
              'body': Style(
                margin: Margins.all(0),
                lineHeight: const LineHeight(1.5),
              ),
            },
            onLinkTap: (url, attributes, element) async {
              if (url == null) return;
              // final isAvailable = await canLaunchUrl(Uri.parse(url));
              // if (!isAvailable) return;
              // launchUrl(
              //   Uri.parse(url),
              //   mode: LaunchMode.externalApplication,
              // );
            },
          ),
        ],
      ),
    );
  }
}
