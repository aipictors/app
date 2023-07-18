import 'package:aipictors/delegates/tab_header_delegate.dart';
import 'package:aipictors/graphql/__generated__/user.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/modal/user_action_modal_container.dart';
import 'package:aipictors/widgets/container/user_folders_container.dart';
import 'package:aipictors/widgets/container/user_header_action_container.dart';
import 'package:aipictors/widgets/container/user_profile_container.dart';
import 'package:aipictors/widgets/container/user_works_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ユーザの詳細
class UserScreen extends HookConsumerWidget {
  const UserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

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
        return builder..vars.userId = userId;
      }),
      builder: (context, response) {
        final user = response.data?.user;
        if (user == null) {
          return const DataNotFoundErrorContainer();
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
                    onOpenActionModal(context);
                  },
                ),
              ],
            ),
            extendBody: true,
            body: NestedScrollView(
              body: TabBarView(
                children: [
                  UserWorksContainer(userId: userId),
                  UserFoldersContainer(userId: userId),
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
                            iconImageURL: user.iconImage?.downloadURL,
                            userId: user.id,
                            userLogin: user.login,
                            userName: user.name,
                          ),
                          const SizedBox(height: 16),
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
                    ]),
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
            ),
          ),
        );
      },
    );
  }

  onOpenActionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return UserActionModalContainer(
          userId: userId,
        );
      },
    );
  }
}
