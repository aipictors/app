import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_popular_works_provider.dart';
import '../widgets/container/data_not_found_error_container.dart';
import '../widgets/container/loading_container.dart';
import '../widgets/container/unexpected_error_container.dart';
import '../widgets/image/grid_work_image.dart';

class ExplorerPopularScreen extends HookConsumerWidget {
  const ExplorerPopularScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final queryWorks = ref.watch(queryPopularWorksProvider);

    return queryWorks.when(
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
        final works = data.popularWorks;
        if (works.isEmpty) {
          return const DataNotFoundErrorContainer();
        }
        return GridView.builder(
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: works.length,
          itemBuilder: (context, index) {
            final work = works[index];
            return InkWell(
              onTap: () {
                context.push('/works/${work.id}');
              },
              child: GridWorkImage(imageUrl: work.image!.downloadURL),
            );
          },
        );
      },
    );
  }
}
