import 'package:aipictors/widgets/container/user_works_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_user_provider.dart';
import '../widgets/container/user_header_container.dart';
import '../widgets/container/user_profile_container.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(context, ref) {
    final queryUser = ref.watch(queryUserProvider(userId));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBody: true,
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: queryUser.when(
            data: (data) {
              if (data.data!.user == null) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).disabledColor,
                );
              }
              final user = data.data!.user!;
              return Column(
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
                  const SizedBox(height: 16),
                  UserWorksContainer(userId: userId),
                  const SizedBox(height: 64),
                ],
              );
            },
            error: (error, stackTrace) {
              return const Text("エラー");
            },
            loading: () {
              return Container();
              // const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
