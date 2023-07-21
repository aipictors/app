import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_muted_tags.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/unexpected_error_container.dart';
import 'package:aipictors/widgets/list_tile/muted_tag_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定・ミュートしたタグ
class ConfigMutedTagsScreen extends HookConsumerWidget {
  const ConfigMutedTagsScreen({
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
        title: const Text('ミュートしたタグ'),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: GViewerMutedTagsReq((builder) {
          return builder
            ..vars.limit = 16
            ..vars.offset = 0;
        }),
        builder: (context, response) {
          final tagList = response.data?.viewer?.mutedTags;
          if (tagList == null) {
            return const UnexpectedErrorContainer();
          }
          if (tagList.isEmpty) {
            return DataEmptyErrorContainer(
              message: 'ミュートしたタグは無いみたい。'.i18n,
            );
          }
          return ListView.builder(
            itemCount: tagList.length,
            itemBuilder: (context, index) {
              final tag = tagList[index];
              return MutedTagListTile(
                tagName: tag.name,
                onTap: null,
              );
            },
          );
        },
      ),
    );
  }
}
