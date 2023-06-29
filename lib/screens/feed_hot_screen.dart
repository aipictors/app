import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_hot_works_provider.dart';

class FeedHotScreen extends HookConsumerWidget {
  const FeedHotScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final queryWorks = ref.watch(queryHotWorksProvider);

    return SafeArea(
      key: const PageStorageKey("feed_hot"),
      child: queryWorks.when(
        data: (data) {
          return MasonryGridView.count(
            padding: const EdgeInsets.all(16),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: data.data!.hotWorks.length,
            itemBuilder: (context, index) {
              final work = data.data!.hotWorks[index];
              return GestureDetector(
                onTap: () {
                  context.push("/works/${work.id}");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        work.image!.downloadURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return const Text("エラー");
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
