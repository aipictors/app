import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/container/notification_user_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserActionModalContainer extends HookConsumerWidget {
  const UserActionModalContainer({
    Key? key,
    required this.userName,
    required this.userIconImageURL,
  }) : super(key: key);

  final String userName;

  final String? userIconImageURL;

  @override
  Widget build(context, ref) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ModalHeaderContainer(
              title: NotificationUserContainer(
                userName: userName,
                userIconImageURL: userIconImageURL,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.share_rounded),
              title: Text(
                '作品をシェアする'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite_rounded),
              title: Text(
                'ユーザをフォローする'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.block_rounded),
              title: Text(
                'ユーザをミュートする'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.gpp_maybe_rounded),
              title: Text(
                'ユーザを通報する'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.gpp_maybe_rounded),
              title: Text(
                '作品を通報する'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
