import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/delegates/tab_header_delegate.dart';
import 'package:aipictors/features/home/widgets/data_not_found_error_screen.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/user/widgets/user_action_modal_container.dart';
import 'package:aipictors/features/user/widgets/user_albums_container.dart';
import 'package:aipictors/features/user/widgets/user_header_action_container.dart';
import 'package:aipictors/features/user/widgets/user_profile_container.dart';
import 'package:aipictors/features/user/widgets/user_works_container.dart';
import 'package:aipictors/graphql/__generated__/user.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ユーザの詳細
class UserScreen extends HookConsumerWidget {
  const UserScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: GUserReq((builder) {
        builder.vars.userId = userId;
      }),
      builder: (context, response) {
        final user = response.data?.user;
        if (user == null) {
          return const DataNotFoundErrorScreen();
        }
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('@${user.login}'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_horiz_rounded),
                  onPressed: () {
                    onOpenActionModal(
                      context,
                      userName: user.name,
                      userIconImageURL: user.iconUrl,
                      isMutedUser: user.isMuted == true,
                    );
                  },
                ),
              ],
            ),
            extendBody: true,
            body: NestedScrollView(
              body: TabBarView(
                children: [
                  UserWorksContainer(userId: userId),
                  UserAlbumsContainer(userId: userId),
                ],
              ),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserHeaderActionContainer(
                            iconImageURL: user.iconUrl,
                            userId: user.id,
                            userLogin: user.login,
                            userName: user.name,
                            isFollowee: user.isFollowee == true,
                          ),
                          UserProfileContainer(
                            userId: user.id,
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
                    ]),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: TabHeaderDelegate(
                      tabBar: TabBar(
                        tabs: [Tab(text: '作品'.i18n), Tab(text: 'シリーズ'.i18n)],
                      ),
                    ),
                  )
                ];
              },
            ),
          ),
        );
      },
    );
  }

  onOpenActionModal(
    BuildContext context, {
    required String userName,
    required String? userIconImageURL,
    required bool isMutedUser,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return UserActionModalContainer(
          userId: userId,
          userName: userName,
          userIconImageURL: userIconImageURL,
          isMutedUser: isMutedUser,
        );
      },
    );
  }
}
