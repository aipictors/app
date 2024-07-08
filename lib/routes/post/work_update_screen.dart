import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品の編集
class WorkUpdateScreen extends HookConsumerWidget {
  const WorkUpdateScreen({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('作品の編集'.i18n),
      ),
    );
  }
}
