import 'package:aipictors/graphql/__generated__/user_followees.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserFolloweesScreen extends HookConsumerWidget {
  const UserFolloweesScreen({
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('フォロー'),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GUserFolloweesReq((builder) {
          return builder
            ..vars.limit = 16
            ..vars.offset = 0
            ..vars.user_id = userId;
        }),
        builder: (context, response) {
          final followees = response.data?.user?.followees;
          if (followees == null) {
            return const DataNotFoundErrorContainer();
          }
          if (followees.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return GridView.builder(
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: followees.length,
            itemBuilder: (context, index) {
              final user = followees[index];
              return Text(user.name);
            },
          );
        },
      ),
    );
  }
}
