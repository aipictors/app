import 'package:aipictors/graphql/__generated__/folder.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/view/folder_works_view.dart';
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

    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: GFolderReq((builder) {
        return builder..vars.id = folderId;
      }),
      notFound: (data) {
        return data?.folder == null;
      },
      builder: (data) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              data.folder?.title ?? '-',
              style: const TextStyle(fontWeight: FontWeight.bold),
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
