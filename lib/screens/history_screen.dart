import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_histories_provider.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final queryHistories = ref.watch(
      queryHistoriesProvider(
        const QueryHistoriesProps(dateTime: "2023-06-12"),
      ),
    );

    return Scaffold(
      key: const PageStorageKey("feed_histories"),
      appBar: AppBar(
        title: const Text('ランキング'),
      ),
      body: SafeArea(
        child: queryHistories.when(
          data: (data) {
            final histories = data.data!.histories;
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              cacheExtent: 0.0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 3,
              ),
              itemCount: histories.length,
              itemBuilder: (context, index) {
                final history = histories[index];
                final work = history.work;
                if (work == null) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Theme.of(context).disabledColor,
                  );
                }
                return GestureDetector(
                  onTap: () {
                    context.push("/works/${work.id}");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      work.thumbnailImage!.downloadURL,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, event) {
                        if (event == null) return child;
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Theme.of(context).primaryColorLight,
                        );
                      },
                      errorBuilder: (context, uri, error) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Theme.of(context).disabledColor,
                        );
                      },
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
      ),
    );
  }
}
