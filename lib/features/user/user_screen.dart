import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/delegates/tab_header_delegate.dart';
import 'package:aipictors/features/home/widgets/data_not_found_error_screen.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/user/__generated__/user.req.gql.dart';
import 'package:aipictors/features/user/widgets/user_action_modal.dart';
import 'package:aipictors/features/user/widgets/user_album_list_view.dart';
import 'package:aipictors/features/user/widgets/user_header_action.dart';
import 'package:aipictors/features/user/widgets/user_header_profile.dart';
import 'package:aipictors/features/user/widgets/user_work_grid_view.dart';
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
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return UserActionModal(user: user);
                      },
                    );
                  },
                ),
              ],
            ),
            extendBody: true,
            body: NestedScrollView(
              body: TabBarView(
                children: [
                  UserWorkGridView(userId: userId),
                  UserAlbumListView(userId: userId),
                ],
              ),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserHeaderAction(user: user),
                          UserProfile(user: user),
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
}
