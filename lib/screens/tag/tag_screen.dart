import 'package:aipictors/graphql/__generated__/tag.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/data_not_found_error_screen.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/screens/operation_error_screen.dart';
import 'package:aipictors/screens/unexpected_error_screen.dart';
import 'package:aipictors/widgets/grid/tag_works_view.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagScreen extends HookConsumerWidget {
  const TagScreen({
    Key? key,
    required this.tagName,
  }) : super(key: key);

  final String tagName;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Operation(
      client: client.value!,
      operationRequest: GTagReq((builder) {
        return builder..vars.name = tagName;
      }),
      builder: (context, response, error) {
        if (error != null) {
          return const UnexpectedErrorScreen();
        }
        if (response == null || response.loading) {
          return const LoadingScreen();
        }
        if (response.graphqlErrors != null) {
          return OperationErrorScreen(errors: response.graphqlErrors!);
        }
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
          body: TagWorksView(
            client: client.value!,
            tagName: tagName,
          ),
        );
      },
    );
  }
}
