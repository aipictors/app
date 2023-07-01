import 'package:aipictors/delegates/tab_header_delegate.dart';
import 'package:aipictors/providers/query_user_provider.dart';
import 'package:aipictors/widgets/app_bar/user_app_bar.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:aipictors/widgets/container/user_folders_container.dart';
import 'package:aipictors/widgets/container/user_header_container.dart';
import 'package:aipictors/widgets/container/user_profile_container.dart';
import 'package:aipictors/widgets/container/user_works_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(context, ref) {
    final queryUser = ref.watch(queryUserProvider(userId));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        body: queryUser.when(
          error: (error, stackTrace) {
            return const UnexpectedErrorContainer();
          },
          loading: () {
            return const LoadingContainer();
          },
          data: (data) {
            if (data == null) {
              return const DataNotFoundErrorContainer();
            }
            final user = data.user;
            if (user == null) {
              return const DataNotFoundErrorContainer();
            }
            return NestedScrollView(
              body: TabBarView(
                children: [
                  UserWorksContainer(userId: userId),
                  UserFoldersContainer(userId: userId),
                ],
              ),
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
            );
          },
        ),
      ),
    );
  }
}
