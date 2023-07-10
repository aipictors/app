import 'package:aipictors/graphql/__generated__/folder.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/error/data_not_found_error_screen.dart';
import 'package:aipictors/screens/error/operation_error_screen.dart';
import 'package:aipictors/screens/error/unexpected_error_screen.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/view/folder_works_view.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FolderScreen extends HookConsumerWidget {
  const FolderScreen({
    Key? key,
    required this.folderId,
  }) : super(key: key);

  final String folderId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Operation(
      client: client.value!,
      operationRequest: GFolderReq((builder) {
        return builder..vars.id = folderId;
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
        final folder = response.data?.folder;
        if (folder == null) {
          return const DataNotFoundErrorScreen();
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              'フォルダ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          extendBody: true,
          body: FolderWorksView(
            client: client.value!,
            folderId: folderId,
          ),
        );
      },
    );
  }
}
