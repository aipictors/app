import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentActionModalContainer extends HookConsumerWidget {
  const CommentActionModalContainer({
    Key? key,
    required this.userName,
  }) : super(key: key);

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
              title: Container(),
            ),
            ListTile(
              leading: const Icon(Icons.block_rounded),
              title: Text(
                'ユーザをミュートする'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.gpp_maybe_rounded),
              title: Text(
                'コメントを通報する'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.gpp_maybe_rounded),
              title: Text(
                'ユーザを通報する'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
