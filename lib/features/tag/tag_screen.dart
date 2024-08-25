import 'package:aipictors/features/home/widgets/data_not_found_error_screen.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/tag/__generated__/tag_screen.req.gql.dart';
import 'package:aipictors/features/tag/widgets/tag_work_list_view.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タグの詳細
class TagScreen extends HookConsumerWidget {
  const TagScreen({
    super.key,
    required this.tagName,
  });

  final String tagName;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: GTagScreenReq((builder) {
        builder.vars.name = tagName;
      }),
      builder: (context, response) {
        final tag = response.data?.tag;
        if (tag == null) {
          return const DataNotFoundErrorScreen();
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              tag.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          extendBody: true,
          body: TagWorkListView(
            client: client.value!,
            tagName: tagName,
          ),
        );
      },
    );
  }
}
