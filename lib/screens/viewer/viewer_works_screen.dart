import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/image/grid_work_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///  投稿した作品
class ViewerWorksScreen extends HookConsumerWidget {
  const ViewerWorksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('あなたの作品'.i18n),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GViewerWorksReq((builder) {
          return builder
            ..vars.limit = 16
            ..vars.offset = 0;
        }),
        builder: (context, response) {
          final workList = response.data?.viewer?.works;
          if (workList == null) {
            return const UnexpectedErrorContainer();
          }
          if (workList.isEmpty) {
            return DataEmptyErrorContainer(
              message: 'あなたの作品は無いみたい。'.i18n,
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: workList.length,
            itemBuilder: (context, index) {
              final work = workList[index];
              return InkWell(
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'work',
                    itemId: work.id,
                  );
                  context.push('/works/${work.id}');
                },
                child: GridWorkImage(
                  imageURL: work.thumbnailImage?.downloadURL,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
