import 'package:aipictors/providers/query_search_works_provider.dart';
import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/unexpected_error_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplorerSearchScreen extends HookConsumerWidget {
  const ExplorerSearchScreen({
    Key? key,
    required this.search,
  }) : super(key: key);

  final String search;

  @override
  Widget build(context, ref) {
    final provider = querySearchWorksProvider(
      SearchWorksProps(search: search),
    );

    final queryWorks = ref.watch(provider);

    return RefreshIndicator(
      onRefresh: () async {
        return ref.refresh(provider);
      },
      child: queryWorks.when(
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
          final works = data.works!;
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
      ),
    );
  }
}
