import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final provider = querySearchWorksProvider(
      SearchWorksProps(search: search.value),
    );

    final queryWorks = ref.watch(provider);

    return Scaffold(
      key: const PageStorageKey("search"),
      appBar: SearchAppBar(onSubmit: (text) {
        search.value = text;
      }),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.refresh(provider);
        },
        child: queryWorks.when(
          error: (error, stackTrace) {
            return const Text("エラー");
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          data: (data) {
            final works = data.data!.works!;
            return GridView.builder(
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
              ),
              itemCount: works.length,
              itemBuilder: (context, index) {
                final work = works[index];
                return GestureDetector(
                  onTap: () {
                    context.push("/works/${work.id}");
                  },
                  child: CachedNetworkImage(
                    imageUrl: work.image!.downloadURL,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, child, _) {
                      return const Placeholder();
                    },
                    errorWidget: (context, uri, error) {
                      return const Placeholder();
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
