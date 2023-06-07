import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_search_works_provider.dart';
import '../widgets/app_bar/search_app_bar.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final search = useState("");

    final queryWorks = ref.watch(
      querySearchWorksProvider(SearchWorksProps(search: search.value)),
    );

    return Scaffold(
      key: const PageStorageKey("search"),
      appBar: SearchAppBar(onSubmit: (text) {
        search.value = text;
      }),
      body: SafeArea(
        child: queryWorks.when(
          data: (data) {
            return MasonryGridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: data.data!.works!.length,
              itemBuilder: (context, index) {
                final work = data.data!.works![index];
                return GestureDetector(
                  onTap: () {
                    context.push("/works/${work.id}");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      work.image!.downloadURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: CachedNetworkImage(
                  //     imageUrl: work.image!.downloadURL,
                  //     fit: BoxFit.cover,
                  //     errorWidget: (context, uri, error) {
                  //       return Container();
                  //     },
                  //     placeholder: (context, uri) {
                  //       return Container();
                  //     },
                  //   ),
                  // ),
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
