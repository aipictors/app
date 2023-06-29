import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../delegates/tab_header_delegate.dart';
import '../providers/query_user_provider.dart';
import '../widgets/app_bar/user_app_bar.dart';
import '../widgets/container/user_folders_container.dart';
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
          extendBody: true,
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  UserAppBar(
                    headerImageURL: user.headerImage?.downloadURL ?? '',
                    innerBoxIsScrolled: innerBoxIsScrolled,
                    userName: user.name,
                  ),
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
                children: [
                  UserWorksContainer(userId: userId),
                  UserFoldersContainer(userId: userId),
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
