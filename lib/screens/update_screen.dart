import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アップデート
class UpdateScreen extends HookConsumerWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      body: Center(
        child: Text('アップデートが必要です。'.i18n),
      ),
    );
  }
}
