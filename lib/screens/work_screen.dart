import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/query_work_comments_provider.dart';
import '../providers/query_work_provider.dart';

class WorkScreen extends HookConsumerWidget {
  const WorkScreen({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(context, ref) {
    final queryWork = ref.watch(queryWorkProvider(workId));

    final queryWorkComments = ref.watch(
      queryWorkCommentsProvider(
        QueryWorkCommentsProps(workId: workId),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "作品",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: queryWork.when(
            data: (data) {
              if (data.data!.work == null) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).disabledColor,
                );
              }
              final work = data.data!.work!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                data.data!.work!.user.iconImage!.downloadURL,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.data!.work!.user.name,
                                  style: const TextStyle(
                                    height: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 1),
                                    Text(
                                      data.data!.work!.user.login,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).dividerColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        FilledButton.tonal(
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "フォロー",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Image.network(
                    data.data!.work!.image!.downloadURL,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.favorite_rounded),
                            const SizedBox(width: 8),
                            Text(
                              work.likesCount.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Row(
                          children: [
                            const Icon(Icons.visibility_rounded),
                            const SizedBox(width: 8),
                            Text(
                              work.viewsCount.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      data.data!.work!.title!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (work.description != null) const SizedBox(height: 4),
                  if (work.description != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        work.description!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 8,
                      children: [
                        for (final tagName in work.tagNames) Text("#$tagName"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  queryWorkComments.when(
                    data: (data) {
                      final comments = data.data!.work!.comments;
                      print(comments);
                      return Column(
                        children: [
                          for (final comment in comments)
                            Container(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      comment.user.iconImage!.downloadURL,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          comment.user.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        if (comment.text.isNotEmpty)
                                          Text(comment.text),
                                        if (comment.sticker != null)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              comment
                                                  .sticker!.image.downloadURL,
                                              fit: BoxFit.cover,
                                              width: 80,
                                            ),
                                          ),
                                        SizedBox(height: 4),
                                        Text(
                                          DateFormat.yMMMMEEEEd('ja')
                                              .format(
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                  comment.createdAt * 1000,
                                                ),
                                              )
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return const Text("エラー");
                    },
                    loading: () {
                      return Container();
                      // const CircularProgressIndicator();
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              );
            },
            error: (error, stackTrace) {
              return const Text("エラー");
            },
            loading: () {
              return Container();
              // const CircularProgressIndicator();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton.filledTonal(
                  icon: const Icon(Icons.favorite_rounded),
                  onPressed: () {},
                ),
                SizedBox(width: 8),
                IconButton.filledTonal(
                  icon: const Icon(Icons.bookmark_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(width: 8),
            FilledButton.tonal(
              child: Text(
                "コメント",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
