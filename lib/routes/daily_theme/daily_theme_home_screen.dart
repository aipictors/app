import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/feed_daily_theme_works.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/routes/daily_theme/widgets/daily_theme_title_list_tile.dart';
import 'package:aipictors/routes/feed/widgets/feed_work_list_tile.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/end_of_content.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 日別テーマの作品の一覧
class DailyThemeHomeScreen extends HookConsumerWidget {
  const DailyThemeHomeScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingProgress();
    }

    final request = GFeedDailyThemeWorksReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0
        ..vars.year = DateTime.now().year
        ..vars.month = DateTime.now().month
        ..vars.day = DateTime.now().day;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('お題'.i18n),
        actions: [
          FilledButton.tonal(
            child: Text('過去のお題'.i18n),
            // icon: const Icon(Icons.newspaper_rounded),
            onPressed: () {
              context.push('/daily_themes');
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final req = request.rebuild((builder) {
            builder;
          });
          client.value?.requestController.add(req);
          await Future.delayed(const Duration(seconds: 2));
        },
        child: OperationBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final dailyTheme = response.data?.dailyTheme;
            if (dailyTheme == null) {
              return const DataNotFoundErrorContainer();
            }
            final workList = response.data?.dailyTheme?.works;
            if (workList == null) {
              return const DataNotFoundErrorContainer();
            }
            if (workList.isEmpty) {
              return const DataEmptyErrorContainer();
            }
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(height: 0);
              },
              itemCount: workList.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return DailyThemeTitleListTile(title: dailyTheme.title);
                }
                if (index == workList.length + 1) {
                  return const EndOfContentContainer();
                }
                final work = workList[index - 1];
                return FeedWorkListTile(
                  workId: work.id,
                  workTitle: work.title,
                  workImageURL: work.imageURL,
                  workCreatedAt: work.createdAt,
                  workImageAspectRatio: work.imageAspectRatio,
                  userId: work.user.id,
                  userName: work.user.name,
                  userIconImageURL: work.user.iconUrl,
                  likesCount: work.likesCount,
                  commentsCount: work.commentsCount,
                  isLiked: work.isLiked == true,
                  isBookmarked: false,
                  isFollowee: work.user.isFollowee == true,
                  isMutedUser: work.user.isMuted == true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
