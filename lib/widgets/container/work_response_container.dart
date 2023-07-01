import 'package:aipictors/graphql/fragments/__generated__/comment_fields_fragment.data.gql.dart';
import 'package:aipictors/widgets/image/sticker_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WorkResponseContainer extends HookConsumerWidget {
  const WorkResponseContainer({
    Key? key,
    required this.comment,
    required this.isResponse,
  }) : super(key: key);

  final GCommentFields comment;

  final bool isResponse;

  @override
  Widget build(context, ref) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isResponse)
                  Icon(
                    Icons.subdirectory_arrow_right_rounded,
                    color: Theme.of(context).disabledColor,
                  ),
                if (isResponse) const SizedBox(width: 8),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    comment.user.iconImage!.downloadURL,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        comment.user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd('ja')
                            .format(
                              DateTime.fromMillisecondsSinceEpoch(
                                comment.createdAt * 1000,
                              ),
                            )
                            .toString(),
                        style: TextStyle(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                    ],
                  ),
                  if (comment.text.isNotEmpty) Text(comment.text),
                  if (comment.sticker != null) const SizedBox(height: 4),
                  if (comment.sticker != null)
                    StickerImage(
                      src: comment.sticker!.image.downloadURL,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
