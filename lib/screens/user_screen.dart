import 'package:aipictors/widgets/container/user_works_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_user_provider.dart';
import '../widgets/container/user_header_image_container.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(context, ref) {
    final queryUser = ref.watch(queryUserProvider(userId));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBody: true,
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: queryUser.when(
            data: (data) {
              if (data.data!.user == null) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).disabledColor,
                );
              }
              final user = data.data!.user!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          UserHeaderImageContainer(
                            downloadURL: user.headerImage!.downloadURL,
                          ),
                          const SizedBox(height: 54),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 44,
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                      user.iconImage!.downloadURL,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FilledButton.tonal(
                                  child: const Text(
                                    "フォロー",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("@${user.login}"),
                        if (user.biography != null) const SizedBox(height: 8),
                        if (user.biography != null) Text(user.biography!),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "いいね 0",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "閲覧回数 0",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  "フォロワー 0",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "入賞 0",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 0),
                  UserWorksContainer(userId: userId),
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
    );
  }
}
