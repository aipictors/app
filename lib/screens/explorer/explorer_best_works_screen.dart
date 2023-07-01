import 'package:aipictors/providers/query_best_works_provider.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplorerBestWorksScreen extends HookConsumerWidget {
  const ExplorerBestWorksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final queryWorks = ref.watch(queryBestWorksProvider);

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
        final works = data.bestWorks;
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
