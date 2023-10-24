import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/album.req.gql.dart';
import 'package:aipictors/providers/audio_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/error/data_not_found_error_screen.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:aipictors/widgets/view/album_works_view.dart';
import 'package:audioplayers/audioplayers.dart';
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
    final audio = ref.watch(audioProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GAlbumReq((builder) {
      return builder..vars.id = albumId;
    });

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          audio.play(AssetSource('snd_sine/progress_loop.wav'));
          final req = request.rebuild((builder) {
            return builder..vars.id = albumId;
          });
          client.value?.requestController.add(req);
          await Future.delayed(const Duration(seconds: 2));
          audio.play(AssetSource('snd_sine/transition_up.wav'));
        },
        child: OperationScreenBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final album = response.data?.album;
            if (album == null) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('シリーズ'.i18n),
                ),
                body: const DataNotFoundErrorScreen(),
              );
            }
            return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                title: Text(
                  'シリーズ'.i18n,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              extendBody: true,
              body: AlbumWorksView(
                client: client.value!,
                albumId: albumId,
                albumTitle: album.title,
                albumDescription: album.description,
                userId: album.user.id,
                userName: album.user.name,
                userIconImageURL: album.user.iconImage!.downloadURL,
                isFollowee: album.user.viewer?.isFollowee == true,
              ),
            );
          },
        ),
      ),
    );
  }
}
