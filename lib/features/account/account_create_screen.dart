import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/unavailable_feature.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アカウントの作成
class AccountCreateScreen extends HookConsumerWidget {
  const AccountCreateScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント作成'.i18n),
      ),
      body: const UnavailableFeature(),
    );
  }
}
