import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_muted_users.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/list_view/dismissible_muted_user_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定・ミュートしたユーザ
class ConfigMutedUsersScreen extends HookConsumerWidget {
  const ConfigMutedUsersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GViewerMutedUsersReq((builder) {
      return builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('ミュートしたユーザ'.i18n),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final userList = response.data?.viewer?.mutedUsers;
          if (userList == null) {
            return const UnexpectedErrorContainer();
          }
          if (userList.isEmpty) {
            return DataEmptyErrorContainer(
              message: 'ミュートしたユーザは居ないみたい。'.i18n,
            );
          }
          return DismissibleMutedUserListView(
            userList: userList.toList(),
          );
        },
      ),
    );
  }
}
