import 'package:aipictors/graphql/__generated__/user_followers.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/empty_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserFollowersScreen extends HookConsumerWidget {
  const UserFollowersScreen({
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
        title: const Text('フォロワー'),
      ),
      body: Operation(
        client: client.value!,
        operationRequest: GUserFollowersReq((builder) {
          return builder
            ..vars.limit = 16
            ..vars.offset = 0
            ..vars.user_id = userId;
        }),
        builder: (context, response, error) {
          if (error != null) {
            return const UnexpectedErrorContainer();
          }
          if (response == null || response.loading) {
            return const LoadingContainer();
          }
          if (response.graphqlErrors != null) {
            return const UnexpectedErrorContainer();
          }
          final followees = response.data?.user?.followers;
          if (followees == null) {
            return const DataNotFoundErrorContainer();
          }
          if (followees.isEmpty) {
            return const EmptyErrorContainer();
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
