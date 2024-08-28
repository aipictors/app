import 'package:aipictors/features/feed/__generated__/feed_home_view.req.gql.dart';
import 'package:aipictors/features/feed/widgets/feed_work_list_tile.dart';
import 'package:aipictors/features/feed/widgets/home_message_list_tile.dart';
import 'package:aipictors/providers/audio_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/end_of_content.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フィード・フォローしているユーザやタグに関連する作品の一覧
class FeedHomeView extends HookConsumerWidget {
  const FeedHomeView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    final audio = ref.watch(audioProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GFeedHomeViewReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });

    final indexCount = config.homeMessage != null ? 1 : 0;

    return RefreshIndicator(
      onRefresh: () async {
        audio.play(AssetSource('snd_sine/progress_loop.wav'));
        final req = request.rebuild((builder) {
          builder
            ..vars.limit = config.graphqlQueryLimit
            ..vars.offset = 0;
        });
        client.value?.requestController.add(req);
        await Future.delayed(const Duration(seconds: 2));
        audio.play(AssetSource('snd_sine/transition_up.wav'));
      },
      child: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final workList = response.data?.viewer?.feedWorks;
          if (workList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (workList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider(height: 0);
            },
            itemCount: workList.length + 1 + indexCount,
            itemBuilder: (context, index) {
              if (index == 0 && indexCount == 1) {
                return HomeMessageListTile(message: config.homeMessage!);
              }
              if (index == workList.length + indexCount) {
                return const EndOfContentContainer();
              }
              final work = workList[index - indexCount];
              return FeedWorkListTile(work: work);
            },
          );
        },
      ),
    );
  }
}
