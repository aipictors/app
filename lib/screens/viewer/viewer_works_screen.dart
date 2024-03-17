import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/utils/to_readable_number.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///  投稿した作品
class ViewerWorksScreen extends HookConsumerWidget {
  const ViewerWorksScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

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
          builder
            ..vars.limit = config.graphqlQueryLimit
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
          return ListView.builder(
            itemCount: workList.length,
            itemBuilder: (context, index) {
              final work = workList[index];
              return WorkInfoListTile(
                thumbnailImageURL: work.thumbnailImage!.downloadURL,
                title: work.title,
                body: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'いいね _LIKES_COUNT_件'.i18n.replaceAllMapped(
                            RegExp(r'_LIKES_COUNT_'),
                            (match) => toReadableNumber(work.likesCount),
                          ),
                      style: TextStyle(color: Theme.of(context).dividerColor),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'コメント _COMMENTS_COUNT_件'.i18n.replaceAllMapped(
                            RegExp(r'_COMMENTS_COUNT_'),
                            (match) => toReadableNumber(work.commentsCount),
                          ),
                      style: TextStyle(color: Theme.of(context).dividerColor),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                onTap: () {
                  FirebaseAnalytics.instance.logSelectContent(
                    contentType: 'work',
                    itemId: work.id,
                  );
                  context.push('/works/${work.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
