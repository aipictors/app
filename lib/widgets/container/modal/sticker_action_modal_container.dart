import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/list_tile/modal_report_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StickerActionModalContainer extends HookConsumerWidget {
  const StickerActionModalContainer({
    Key? key,
    required this.userName,
    required this.stickerId,
    required this.userId,
  }) : super(key: key);

  final String stickerId;

  final String userId;

  final String userName;

  @override
  Widget build(context, ref) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ModalHeaderContainer(
              title: Text('スタンプ'.i18n),
            ),
            ModalReportListTile(
              titleText: 'スタンプを報告する'.i18n,
              onTap: () {
                context.pop();
                context.push('/stickers/$stickerId/report');
              },
            ),
            ModalReportListTile(
              titleText: 'ユーザを報告する'.i18n,
              onTap: () {
                context.pop();
                context.push('/users/$userId/report');
              },
            ),
          ],
        ),
      ),
    );
  }
}
