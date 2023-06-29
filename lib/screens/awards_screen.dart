import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_daily_work_awards_provider.dart';

class AwardsScreen extends HookConsumerWidget {
  const AwardsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final queryHistories = ref.watch(
      queryDailyWorkAwardsProvider(
        const QueryDailyWorkAwardsProps(
          year: 2023,
          month: 6,
          day: 12,
        ),
        // QueryDailyWorkAwardsProps(
        //   year: DateTime.now().year,
        //   month: DateTime.now().month,
        //   day: DateTime.now().day,
        // ),
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
            final awards = data.data!.workAwards;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: awards.length,
              itemBuilder: (context, index) {
                final award = awards[index];
                final work = award.work;
                return GestureDetector(
                  onTap: () {
                    context.push("/works/${work.id}");
                  },
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: work.thumbnailImage!.downloadURL,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Theme.of(context).primaryColorLight,
                        );
                      },
                      errorWidget: (context, uri, error) {
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
