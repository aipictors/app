import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/screens/work/work_screen_compact.dart';
import 'package:aipictors/screens/work/work_screen_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品の詳細
class WorkScreen extends HookConsumerWidget {
  const WorkScreen({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(context, ref) {
    final layout = Layout.fromWith(MediaQuery.of(context).size.width);
    if (layout.notCompact) {
      return WorkScreenMedium(workId: workId);
    } else {
      return WorkScreenCompact(workId: workId);
    }
  }
}
