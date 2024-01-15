import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/widgets/container/unavailable_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品の投稿
class WorkCreateScreen extends HookConsumerWidget {
  const WorkCreateScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text('新しい作品'.i18n)),
      body: const UnavailableContainer(),
    );
  }
}
