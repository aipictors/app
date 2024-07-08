import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/album/widgets/album_action_modal_container.dart';
import 'package:aipictors/features/album/widgets/album_works_view.dart';
import 'package:aipictors/features/home/widgets/data_not_found_error_screen.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/graphql/__generated__/album.req.gql.dart';
import 'package:aipictors/providers/audio_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_screen_builder.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アルバムの詳細
class AlbumScreen extends HookConsumerWidget {
  const AlbumScreen({
    super.key,
    required this.albumId,
  });

  final String albumId;

  @override
  Widget build(context, ref) {
    final audio = ref.watch(audioProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GAlbumReq((builder) {
      builder.vars.id = albumId;
    });

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          audio.play(AssetSource('snd_sine/progress_loop.wav'));
          final req = request.rebuild((builder) {
            builder.vars.id = albumId;
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
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {
                      onOpenActionModal(
                        context,
                        userId: album.user.id,
                        userName: album.user.name,
                        albumTitle: album.title,
                        albumSlug: album.slug!,
                        isMutedUser: album.user.isMuted == true,
                      );
                    },
                  ),
                ],
              ),
              extendBody: true,
              body: AlbumWorksView(
                client: client.value!,
                albumId: albumId,
                albumTitle: album.title,
                albumDescription: album.description,
                userId: album.user.id,
                userName: album.user.name,
                userIconImageURL: album.user.iconImage?.downloadURL,
                isFollowee: album.user.isFollowee == true,
              ),
            );
          },
        ),
      ),
    );
  }

  onOpenActionModal(
    BuildContext context, {
    required String userId,
    required String userName,
    required String albumTitle,
    required String albumSlug,
    required bool isMutedUser,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AlbumActionModalContainer(
          albumId: albumId,
          albumTitle: albumTitle,
          albumSlug: albumSlug,
          userId: userId,
          userName: userName,
          isMutedUser: isMutedUser,
        );
      },
    );
  }
}
