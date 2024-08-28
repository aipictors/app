import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/information/__generated__/announcements_screen.req.gql.dart';
import 'package:aipictors/features/information/widgets/announcement_list_tile.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// お知らせ（アプリ）
class AnnouncementsScreen extends HookConsumerWidget {
  const AnnouncementsScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GAnnouncementsScreenReq((builder) {
      builder;
    });

    return RefreshIndicator(
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
          final announcementList = response.data?.announcements;
          if (announcementList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (announcementList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return ListView.separated(
            padding: const EdgeInsets.only(top: 8),
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: announcementList.length,
            itemBuilder: (context, index) {
              final announcement = announcementList[index];
              return AnnouncementListTile(announcement: announcement);
            },
          );
        },
      ),
    );
  }
}
