import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart';
import 'package:aipictors/widgets/container/dismissible_background_container.dart';
import 'package:aipictors/widgets/list/muted_user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DismissibleMutedUserList extends HookConsumerWidget {
  const DismissibleMutedUserList({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<GPartialUserFields> userList;

  @override
  Widget build(context, ref) {
    final state = useState(userList);

    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        final user = state.value[index];
        return Dismissible(
          key: ValueKey(user.id),
          background: DismissibleBackgroundContainer(
            text: 'ミュートを解除する'.i18n,
          ),
          child: MutedUserListTile(
            userName: user.name,
            userLogin: user.login,
            userIconImageURL: user.iconImage?.downloadURL,
            onTap: null,
          ),
        );
      },
    );
  }
}
