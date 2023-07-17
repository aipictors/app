import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ユーザの報告
class StickerReportScreen extends HookConsumerWidget {
  const StickerReportScreen({
    Key? key,
    required this.stickerId,
  }) : super(key: key);

  final String stickerId;

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('スタンプの報告'.i18n),
      ),
    );
  }
}
