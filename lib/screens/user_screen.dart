import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../delegates/tab_header_delegate.dart';
import '../providers/query_user_provider.dart';
import '../widgets/container/user_header_container.dart';
import '../widgets/container/user_profile_container.dart';
import '../widgets/container/user_works_container.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(context, ref) {
    final queryUser = ref.watch(queryUserProvider(userId));

    return queryUser.when(
      data: (data) {
        final user = data.data!.user!;
        return Scaffold(
          appBar: AppBar(
            title: Text(user.name),
          ),
          extendBody: true,
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserHeaderContainer(
                              iconImageURL: user.iconImage?.downloadURL,
                              headerImageURL: user.headerImage?.downloadURL,
                            ),
                            const SizedBox(height: 8),
                            UserProfileContainer(
                              name: user.name,
                              login: user.login,
                              biography: user.biography,
                              likesCount: user.receivedLikesCount,
                              viewsCount: user.receivedViewsCount,
                              followersCount: user.followersCount,
                              awardsCount: user.awardsCount,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SliverPersistentHeader(
                    pinned: true,
                    delegate: TabHeaderDelegate(
                      tabBar: TabBar(
                        tabs: [Tab(text: '作品'), Tab(text: 'シリーズ')],
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                physics: const ClampingScrollPhysics(),
                children: [
                  UserWorksContainer(userId: userId),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
          ),
        );
      },
      loading: () {
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
        );
      },
    );
  }
}
