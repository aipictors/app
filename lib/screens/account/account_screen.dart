import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アカウント
class AccountScreen extends HookConsumerWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント'.i18n),
      ),
      body: ListView(children: [
        ListTile(
          title: Text('ログインIDの変更'.i18n),
          subtitle: Text('ログインに使用するIDを変更します。'.i18n),
          onTap: () {
            context.push('/account/login');
          },
        ),
        ListTile(
          title: Text('パスワードの変更'.i18n),
          subtitle: Text('ログインに使用するパスワードを変更できます。'.i18n),
          onTap: () {
            context.push('/account/password');
          },
        ),
        ListTile(
          title: Text('アカウントの削除'.i18n),
          subtitle: Text('現在ログインしているアカウントを削除します。'.i18n),
          onTap: () {
            context.push('/account/delete');
          },
        )
      ]),
    );
  }
}
