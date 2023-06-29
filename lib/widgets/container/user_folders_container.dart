import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/query_user_works_provider.dart';
import '../grid/work_grid_view.dart';
import '../image/grid_work_image.dart';
import 'data_not_found_error_container.dart';
import 'loading_container.dart';

class UserFoldersContainer extends HookConsumerWidget {
  const UserFoldersContainer({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(context, ref) {
    final queryUserWorks = ref.watch(queryUserWorksProvider(userId));

    return queryUserWorks.when(
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
        final works = user.works;
        if (works.isEmpty) {
          return const DataNotFoundErrorContainer();
        }
        return WorkGridView(
          itemCount: works.length,
          itemBuilder: (context, index) {
            final work = works[index];
            return InkWell(
              onTap: () {
                context.push('/works/${work.id}');
              },
              child: GridWorkImage(
                imageUrl: work.image!.downloadURL,
              ),
            );
          },
        );
      },
    );
  }
}
