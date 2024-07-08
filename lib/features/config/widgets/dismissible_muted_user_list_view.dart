import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/config/widgets/muted_user_list_tile.dart';
import 'package:aipictors/features/user/functions/mute_user.dart';
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart';
import 'package:aipictors/widgets/dismissible_background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DismissibleMutedUserListView extends HookConsumerWidget {
  const DismissibleMutedUserListView({
    super.key,
    required this.userList,
  });

  final List<GPartialUserFields> userList;

  @override
  Widget build(context, ref) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        final user = userList[index];
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: ValueKey(user.id),
          background: DismissibleBackgroundContainer(
            text: 'ミュートを解除する'.i18n,
          ),
          child: MutedUserListTile(
            userName: user.name,
            userLogin: user.login,
            userIconImageURL: user.iconUrl,
            onTap: () {
              context.push('/users/${user.id}');
            },
          ),
          onDismissed: (direction) {
            onDismissed(user.id);
          },
        );
      },
    );
  }

  /// ミュートを解除する
  onDismissed(String userId) {
    return muteUser((builder) {
      return builder..vars.input.userId = userId;
    });
  }
}
