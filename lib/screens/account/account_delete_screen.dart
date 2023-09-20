import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/container/unavailable_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アカウントの削除
class AccountDeleteScreen extends HookConsumerWidget {
  const AccountDeleteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント削除'.i18n),
      ),
      body: const UnavailableContainer(),
    );
  }
}
