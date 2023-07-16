import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定・ログインIDの変更
class AccountLoginScreen extends HookConsumerWidget {
  const AccountLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログインIDの変更'.i18n),
      ),
    );
  }
}
