import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/container/unavailable_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定・パスワード変更
class AccountPasswordScreen extends HookConsumerWidget {
  const AccountPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('パスワード変更'.i18n),
      ),
      body: const UnavailableContainer(),
    );
  }
}
