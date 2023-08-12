import 'package:aipictors/graphql/__generated__/album.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/error/data_not_found_error_screen.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/view/album_works_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アルバムの詳細
class AlbumScreen extends HookConsumerWidget {
  const AlbumScreen({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  final String albumId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return OperationScreenBuilder(
      client: client.value!,
      operationRequest: GAlbumReq((builder) {
        return builder..vars.id = albumId;
      }),
      builder: (context, response) {
        final album = response.data?.album;
        if (album == null) {
          return const DataNotFoundErrorScreen();
        }
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              album.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          extendBody: true,
          body: AlbumWorksView(
            client: client.value!,
            albumId: albumId,
          ),
        );
      },
    );
  }
}
